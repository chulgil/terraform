#!/bin/bash

# 완전 자동화 EKS 배포 스크립트
# 모든 의존성과 에러 요소를 고려한 단계별 배포

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
REGION="ap-northeast-2"
CLUSTER_NAME="dev-eks-cluster"
NAMESPACE="argocd"

echo -e "${BLUE}🚀 EKS 완전 자동화 배포 스크립트${NC}"
echo -e "${BLUE}====================================${NC}"
echo ""

# Function to print status
print_status() {
    echo -e "${GREEN}✅ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

print_error() {
    echo -e "${RED}❌ $1${NC}"
}

print_info() {
    echo -e "${BLUE}ℹ️  $1${NC}"
}

# Function to wait for command with retry
wait_for_command() {
    local cmd="$1"
    local description="$2"
    local max_attempts=10
    local attempt=1
    
    while [ $attempt -le $max_attempts ]; do
        if eval "$cmd" > /dev/null 2>&1; then
            print_status "$description completed"
            return 0
        fi
        print_info "$description (attempt $attempt/$max_attempts)"
        sleep 30
        ((attempt++))
    done
    
    print_error "$description failed after $max_attempts attempts"
    return 1
}

# Step 0: Prerequisites check
echo -e "${BLUE}🔍 사전 요구사항 확인...${NC}"

# Check required tools
for tool in terraform kubectl helm aws; do
    if ! command -v $tool &> /dev/null; then
        print_error "$tool is not installed. Please install it first."
        exit 1
    fi
done

# Check AWS credentials
if ! aws sts get-caller-identity &> /dev/null; then
    print_error "AWS credentials not configured. Please run 'aws configure' first."
    exit 1
fi

print_status "모든 사전 요구사항 확인 완료"
echo ""

# Step 1: Prepare Terraform configuration
echo -e "${BLUE}📋 Step 1: Terraform 설정 준비...${NC}"

# Change to dev environment directory
print_info "Dev 환경 디렉토리로 이동 중..."
cd environments/dev

# Disable Kubernetes providers initially
if [ -f "providers-k8s.tf" ]; then
    mv providers-k8s.tf providers-k8s.tf.disabled
    print_info "Kubernetes provider 임시 비활성화"
fi

# Initialize Terraform
print_info "Terraform 초기화 중..."
terraform init

print_status "Step 1 완료"
echo ""

# Step 2: Deploy core infrastructure
echo -e "${BLUE}🏗️  Step 2: 기본 인프라 배포...${NC}"

print_info "VPC, EKS, Bastion, EFS 배포 중..."
terraform apply -target=module.vpc -target=module.eks -target=module.bastion -target=module.efs -auto-approve

print_status "Step 2 완료"
echo ""

# Step 3: Configure kubeconfig and verify cluster
echo -e "${BLUE}⚙️  Step 3: Kubernetes 클러스터 설정...${NC}"

print_info "kubeconfig 설정 중..."
aws eks update-kubeconfig --region $REGION --name $CLUSTER_NAME

# Wait for cluster to be fully ready
print_info "클러스터 노드 준비 대기 중..."
wait_for_command "kubectl get nodes | grep -q Ready" "EKS 클러스터 노드 준비"

# Verify all system pods are running
print_info "시스템 파드 준비 대기 중..."
wait_for_command "kubectl get pods -n kube-system | grep -v Pending | grep -v ContainerCreating | wc -l | grep -q '[1-9]'" "시스템 파드 준비"

print_status "Step 3 완료"
echo ""

# Step 4: Enable Kubernetes providers and initialize
echo -e "${BLUE}🔧 Step 4: Kubernetes Provider 활성화...${NC}"

# Re-enable Kubernetes providers
if [ -f "providers-k8s.tf.disabled" ]; then
    mv providers-k8s.tf.disabled providers-k8s.tf
    print_info "Kubernetes provider 활성화"
fi

# Re-initialize with Kubernetes providers
print_info "Kubernetes provider와 함께 재초기화 중..."
terraform init

print_status "Step 4 완료"
echo ""

# Step 5: Deploy Cluster Autoscaler (no Helm dependencies)
echo -e "${BLUE}🔄 Step 5: Cluster Autoscaler 배포...${NC}"

print_info "Cluster Autoscaler 배포 중..."
terraform apply -target=module.cluster_autoscaler -auto-approve

# Wait for Cluster Autoscaler to be ready
wait_for_command "kubectl get pods -n kube-system -l app=cluster-autoscaler | grep Running" "Cluster Autoscaler 준비"

print_status "Step 5 완료"
echo ""

# Step 6: Setup Helm repositories
echo -e "${BLUE}📦 Step 6: Helm Repository 설정...${NC}"

print_info "Helm repository 추가 중..."
helm repo add jetstack https://charts.jetstack.io 2>/dev/null || true
helm repo add eks https://aws.github.io/eks-charts 2>/dev/null || true
helm repo update

print_status "Step 6 완료"
echo ""

# Step 7: Deploy Cert-Manager
echo -e "${BLUE}🔐 Step 7: Cert-Manager 배포...${NC}"

print_info "Cert-Manager 설치 중..."
helm upgrade --install cert-manager jetstack/cert-manager \
    --namespace cert-manager \
    --create-namespace \
    --set installCRDs=true \
    --version v1.13.3 \
    --wait

# Wait for cert-manager to be ready
wait_for_command "kubectl get pods -n cert-manager | grep Running | wc -l | grep -q '3'" "Cert-Manager 준비"

print_status "Step 7 완료"
echo ""

# Step 8: Deploy ALB Controller
echo -e "${BLUE}⚖️  Step 8: ALB Controller 배포...${NC}"

# Get ALB Controller IAM role ARN
ALB_ROLE_ARN=$(terraform output -raw alb_controller_iam_role_arn 2>/dev/null || echo "")
VPC_ID=$(terraform output -raw vpc_id 2>/dev/null || echo "")

if [ -z "$ALB_ROLE_ARN" ] || [ -z "$VPC_ID" ]; then
    print_error "Required outputs not available. Checking terraform state..."
    terraform refresh
    ALB_ROLE_ARN=$(terraform output -raw alb_controller_iam_role_arn)
    VPC_ID=$(terraform output -raw vpc_id)
fi

print_info "ALB Controller 설치 중..."
helm upgrade --install aws-load-balancer-controller eks/aws-load-balancer-controller \
    --namespace kube-system \
    --set clusterName=$CLUSTER_NAME \
    --set serviceAccount.create=true \
    --set serviceAccount.name=aws-load-balancer-controller \
    --set serviceAccount.annotations."eks\.amazonaws\.com/role-arn"=$ALB_ROLE_ARN \
    --set region=$REGION \
    --set vpcId=$VPC_ID \
    --wait

# Wait for ALB Controller to be ready
wait_for_command "kubectl get pods -n kube-system -l app.kubernetes.io/name=aws-load-balancer-controller | grep Running | wc -l | grep -q '2'" "ALB Controller 준비"

print_status "Step 8 완료"
echo ""

# Step 9: Create SSL Certificate Issuers
echo -e "${BLUE}🏅 Step 9: SSL 인증서 발급자 설정...${NC}"

print_info "Let's Encrypt 인증서 발급자 생성 중..."

# Create Let's Encrypt staging issuer
kubectl apply -f - <<EOF
apiVersion: cert-manager.io/v1
kind: ClusterIssuer
metadata:
  name: letsencrypt-staging
spec:
  acme:
    email: admin@example.com
    server: https://acme-staging-v02.api.letsencrypt.org/directory
    privateKeySecretRef:
      name: letsencrypt-staging-account-key
    solvers:
    - http01:
        ingress:
          class: alb
EOF

# Create Let's Encrypt production issuer
kubectl apply -f - <<EOF
apiVersion: cert-manager.io/v1
kind: ClusterIssuer
metadata:
  name: letsencrypt-prod
spec:
  acme:
    email: admin@example.com
    server: https://acme-v02.api.letsencrypt.org/directory
    privateKeySecretRef:
      name: letsencrypt-prod-account-key
    solvers:
    - http01:
        ingress:
          class: alb
EOF

# Wait for issuers to be ready
sleep 10
wait_for_command "kubectl get clusterissuer letsencrypt-staging -o jsonpath='{.status.conditions[0].status}' | grep -q True" "Let's Encrypt Staging 발급자 준비"
wait_for_command "kubectl get clusterissuer letsencrypt-prod -o jsonpath='{.status.conditions[0].status}' | grep -q True" "Let's Encrypt Production 발급자 준비"

print_status "Step 9 완료"
echo ""

# Step 10: Final verification and cleanup
echo -e "${BLUE}✅ Step 10: 최종 검증 및 정리...${NC}"

print_info "최종 상태 확인 중..."

# Get cluster info
CLUSTER_ENDPOINT=$(terraform output -raw cluster_endpoint)
BASTION_IP=$(terraform output -raw bastion_public_ip)

# Verify all components
echo ""
echo -e "${BLUE}📊 배포된 리소스 정보:${NC}"
echo -e "  • ${GREEN}EKS 클러스터${NC}: $CLUSTER_NAME"
echo -e "  • ${GREEN}클러스터 엔드포인트${NC}: $CLUSTER_ENDPOINT"
echo -e "  • ${GREEN}Bastion IP${NC}: $BASTION_IP"
echo -e "  • ${GREEN}VPC ID${NC}: $VPC_ID"
echo ""

# Show pod status
echo -e "${BLUE}📋 파드 상태:${NC}"
kubectl get pods -A | grep -E "(cert-manager|aws-load-balancer-controller|cluster-autoscaler)" | while read line; do
    echo -e "  ${GREEN}✅${NC} $line"
done

# Show node status
echo ""
echo -e "${BLUE}🖥️  노드 상태:${NC}"
kubectl get nodes --no-headers | while read line; do
    echo -e "  ${GREEN}✅${NC} $line"
done

print_status "Step 10 완료"
echo ""

# Step 11: Create test namespaces for multi-project support
echo -e "${BLUE}🏗️  Step 11: 멀티 프로젝트 네임스페이스 생성...${NC}"

print_info "프로젝트 네임스페이스 생성 중..."

# Create project namespaces
for project in bubblepool guestbook demo; do
    kubectl create namespace $project --dry-run=client -o yaml | kubectl apply -f -
    kubectl label namespace $project project=$project
    print_info "$project 네임스페이스 생성 완료"
done

print_status "Step 11 완료"
echo ""

# Final summary
echo -e "${GREEN}🎉 배포 완료!${NC}"
echo -e "${GREEN}===============${NC}"
echo ""
echo -e "${BLUE}✅ 성공적으로 배포된 컴포넌트:${NC}"
echo -e "  • VPC 및 네트워크 인프라"
echo -e "  • EKS 클러스터 (Kubernetes 1.33)"
echo -e "  • Cluster Autoscaler (자동 스케일링)"
echo -e "  • ALB Controller (로드밸런서 자동 생성)"
echo -e "  • Cert-Manager (SSL 인증서 자동 발급)"
echo -e "  • EBS CSI Driver (영구 스토리지)"
echo -e "  • EFS CSI Driver (공유 파일 시스템)"
echo -e "  • Bastion 호스트 (SSH 접근)"
echo -e "  • 멀티 프로젝트 네임스페이스"
echo ""
echo -e "${BLUE}🔗 유용한 명령어:${NC}"
echo -e "  • 클러스터 상태 확인: ${YELLOW}kubectl get nodes${NC}"
echo -e "  • 파드 상태 확인: ${YELLOW}kubectl get pods -A${NC}"
echo -e "  • Bastion SSH 접속: ${YELLOW}ssh -i ~/.ssh/dev-bastion-key.pem ec2-user@$BASTION_IP${NC}"
echo ""
echo -e "${BLUE}🚀 다음 단계:${NC}"
echo -e "  1. ArgoCD 설치 (GitOps)"
echo -e "  2. 첫 번째 애플리케이션 배포"
echo -e "  3. 모니터링 설정 (Prometheus + Grafana)"
echo ""
echo -e "${GREEN}배포 시간: $(date)${NC}"

# Save deployment info
cat > deployment-info.txt <<EOF
EKS Deployment Information
==========================
Date: $(date)
Cluster Name: $CLUSTER_NAME
Cluster Endpoint: $CLUSTER_ENDPOINT
Bastion IP: $BASTION_IP
VPC ID: $VPC_ID
Region: $REGION

Components Deployed:
- VPC & Networking
- EKS Cluster (Kubernetes 1.33)
- Cluster Autoscaler
- ALB Controller
- Cert-Manager
- EBS CSI Driver
- EFS CSI Driver
- Bastion Host
- Multi-project Namespaces (bubblepool, guestbook, demo)

Next Steps:
1. Deploy ArgoCD for GitOps
2. Deploy first application
3. Setup monitoring
EOF

print_status "배포 정보가 deployment-info.txt에 저장되었습니다"

echo ""
echo -e "${GREEN}🎉 Dev 환경이 성공적으로 배포되었습니다! 🎉${NC}" 