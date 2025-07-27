#!/bin/bash

# 안전한 EKS 인프라 삭제 스크립트

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${RED}🗑️  EKS 인프라 삭제 스크립트${NC}"
echo -e "${RED}=========================${NC}"
echo ""

print_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

print_info() {
    echo -e "${BLUE}ℹ️  $1${NC}"
}

print_status() {
    echo -e "${GREEN}✅ $1${NC}"
}

# Safety confirmation
echo -e "${RED}⚠️  경고: 이 스크립트는 모든 EKS 인프라를 삭제합니다!${NC}"
echo -e "${YELLOW}삭제될 리소스:${NC}"
echo -e "  • EKS 클러스터 및 노드"
echo -e "  • VPC 및 모든 네트워크 리소스"
echo -e "  • ALB 및 관련 AWS 리소스"
echo -e "  • EBS 볼륨 (영구 데이터 포함)"
echo -e "  • EFS 파일 시스템"
echo -e "  • Bastion 호스트"
echo -e "  • 모든 IAM 역할 및 정책"
echo ""

read -p "정말로 모든 인프라를 삭제하시겠습니까? (yes/no): " confirm
if [ "$confirm" != "yes" ]; then
    echo "삭제가 취소되었습니다."
    exit 0
fi

echo ""
read -p "다시 한 번 확인합니다. 'DELETE'를 입력하세요: " final_confirm
if [ "$final_confirm" != "DELETE" ]; then
    echo "삭제가 취소되었습니다."
    exit 0
fi

echo ""
print_info "인프라 삭제를 시작합니다..."

# Step 1: Remove Helm releases first
echo -e "${BLUE}Step 1: Helm 릴리스 제거...${NC}"

if command -v helm &> /dev/null && command -v kubectl &> /dev/null; then
    # Check if cluster is accessible
    if kubectl cluster-info &> /dev/null; then
        print_info "ALB Controller 제거 중..."
        helm uninstall aws-load-balancer-controller -n kube-system 2>/dev/null || true
        
        print_info "Cert-Manager 제거 중..."
        helm uninstall cert-manager -n cert-manager 2>/dev/null || true
        
        # Wait for resources to be cleaned up
        print_info "리소스 정리 대기 중..."
        sleep 30
    else
        print_warning "클러스터에 접근할 수 없습니다. Helm 리소스 제거를 건너뜁니다."
    fi
else
    print_warning "helm 또는 kubectl이 설치되어 있지 않습니다."
fi

print_status "Step 1 완료"

# Step 2: Remove AWS Load Balancers manually (if any remain)
echo ""
echo -e "${BLUE}Step 2: 남은 AWS 리소스 확인...${NC}"

if command -v aws &> /dev/null; then
    print_info "남은 Load Balancer 확인 중..."
    aws elbv2 describe-load-balancers --query 'LoadBalancers[?contains(LoadBalancerName, `k8s-`)].LoadBalancerArn' --output text 2>/dev/null | while read lb_arn; do
        if [ -n "$lb_arn" ]; then
            print_warning "Load Balancer 발견: $lb_arn"
            print_info "수동으로 삭제하는 것을 권장합니다."
        fi
    done
    
    print_info "남은 Security Group 확인 중..."
    # Note: Security groups will be handled by Terraform
else
    print_warning "AWS CLI가 설치되어 있지 않습니다."
fi

print_status "Step 2 완료"

# Step 3: Terraform destroy
echo ""
echo -e "${BLUE}Step 3: Terraform 리소스 삭제...${NC}"

# Change to dev environment directory
print_info "Dev 환경 디렉토리로 이동 중..."
cd environments/dev

# Ensure Kubernetes providers are disabled during destroy
if [ -f "providers-k8s.tf" ]; then
    mv providers-k8s.tf providers-k8s.tf.disabled
    print_info "Kubernetes provider 비활성화"
fi

print_info "Terraform 초기화..."
terraform init

print_info "Terraform destroy 실행 중... (시간이 오래 걸릴 수 있습니다)"
terraform destroy -auto-approve

print_status "Step 3 완료"

# Step 4: Cleanup local files
echo ""
echo -e "${BLUE}Step 4: 로컬 파일 정리...${NC}"

print_info "배포 정보 파일 정리 중..."
rm -f deployment-info.txt
rm -f terraform.tfstate.backup

# Remove kubeconfig context if it exists
if command -v kubectl &> /dev/null; then
    print_info "kubeconfig 컨텍스트 정리 중..."
    kubectl config delete-context arn:aws:eks:ap-northeast-2:*:cluster/dev-eks-cluster 2>/dev/null || true
fi

print_status "Step 4 완료"

echo ""
echo -e "${GREEN}🎉 인프라 삭제 완료!${NC}"
echo -e "${GREEN}==================${NC}"
echo ""
echo -e "${BLUE}정리된 항목:${NC}"
echo -e "  • EKS 클러스터 및 노드 그룹"
echo -e "  • VPC 및 모든 네트워크 리소스"
echo -e "  • IAM 역할 및 정책"
echo -e "  • 보안 그룹"
echo -e "  • EBS 볼륨"
echo -e "  • EFS 파일 시스템"
echo -e "  • Bastion 호스트"
echo -e "  • 로컬 설정 파일"
echo ""
echo -e "${YELLOW}⚠️  수동 확인 권장:${NC}"
echo -e "  • AWS 콘솔에서 남은 리소스 확인"
echo -e "  • CloudFormation 스택 확인"
echo -e "  • 예상치 못한 비용 발생 모니터링"
echo ""
echo -e "${BLUE}삭제 시간: $(date)${NC}" 