#!/bin/bash

# EKS 인프라 상태 확인 스크립트

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}📊 EKS 인프라 상태 확인${NC}"
echo -e "${BLUE}======================${NC}"
echo ""

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

# Check prerequisites
echo -e "${BLUE}🔍 도구 상태 확인${NC}"
for tool in terraform kubectl helm aws; do
    if command -v $tool &> /dev/null; then
        print_status "$tool 설치됨"
    else
        print_error "$tool 설치되지 않음"
    fi
done
echo ""

# Check AWS credentials
echo -e "${BLUE}🔑 AWS 자격 증명 확인${NC}"
if aws sts get-caller-identity &> /dev/null; then
    ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)
    USER_ARN=$(aws sts get-caller-identity --query Arn --output text)
    print_status "AWS 계정: $ACCOUNT_ID"
    print_status "사용자: $USER_ARN"
else
    print_error "AWS 자격 증명이 구성되지 않았습니다"
fi
echo ""

# Check Terraform state
echo -e "${BLUE}🏗️  Terraform 상태 확인${NC}"
if [ -f "terraform.tfstate" ]; then
    print_status "Terraform 상태 파일 존재"
    
    # Check if cluster exists in state
    if terraform show 2>/dev/null | grep -q "aws_eks_cluster.main"; then
        print_status "EKS 클러스터가 Terraform 상태에 존재"
        
        # Get outputs
        CLUSTER_NAME=$(terraform output -raw cluster_name 2>/dev/null || echo "N/A")
        CLUSTER_ENDPOINT=$(terraform output -raw cluster_endpoint 2>/dev/null || echo "N/A")
        VPC_ID=$(terraform output -raw vpc_id 2>/dev/null || echo "N/A")
        BASTION_IP=$(terraform output -raw bastion_public_ip 2>/dev/null || echo "N/A")
        
        echo "  • 클러스터 이름: $CLUSTER_NAME"
        echo "  • 엔드포인트: $CLUSTER_ENDPOINT"
        echo "  • VPC ID: $VPC_ID"
        echo "  • Bastion IP: $BASTION_IP"
    else
        print_warning "EKS 클러스터가 Terraform 상태에 없습니다"
    fi
else
    print_warning "Terraform 상태 파일이 없습니다"
fi
echo ""

# Check Kubernetes cluster connectivity
echo -e "${BLUE}☸️  Kubernetes 클러스터 연결 확인${NC}"
if command -v kubectl &> /dev/null; then
    if kubectl cluster-info &> /dev/null; then
        print_status "Kubernetes 클러스터 연결됨"
        
        # Get cluster info
        CURRENT_CONTEXT=$(kubectl config current-context 2>/dev/null || echo "N/A")
        echo "  • 현재 컨텍스트: $CURRENT_CONTEXT"
        
        # Check nodes
        NODE_COUNT=$(kubectl get nodes --no-headers 2>/dev/null | wc -l | tr -d ' ')
        READY_NODES=$(kubectl get nodes --no-headers 2>/dev/null | grep " Ready " | wc -l | tr -d ' ')
        echo "  • 노드 수: $READY_NODES/$NODE_COUNT Ready"
        
        # Show node details
        if [ "$NODE_COUNT" -gt 0 ]; then
            echo "  • 노드 상세:"
            kubectl get nodes --no-headers 2>/dev/null | while read line; do
                echo "    - $line"
            done
        fi
    else
        print_error "Kubernetes 클러스터에 연결할 수 없습니다"
    fi
else
    print_warning "kubectl이 설치되지 않았습니다"
fi
echo ""

# Check system pods
echo -e "${BLUE}📦 시스템 파드 상태 확인${NC}"
if kubectl get pods -n kube-system &> /dev/null; then
    # Core system pods
    echo -e "${YELLOW}핵심 시스템 파드:${NC}"
    kubectl get pods -n kube-system --no-headers 2>/dev/null | grep -E "(coredns|aws-node|kube-proxy)" | while read line; do
        echo "  • $line"
    done
    
    # CSI drivers
    echo -e "${YELLOW}CSI 드라이버:${NC}"
    kubectl get pods -n kube-system --no-headers 2>/dev/null | grep -E "(ebs-csi|efs-csi)" | while read line; do
        echo "  • $line"
    done
    
    # Additional components
    echo -e "${YELLOW}추가 컴포넌트:${NC}"
    kubectl get pods -n kube-system --no-headers 2>/dev/null | grep -E "(cluster-autoscaler|aws-load-balancer-controller)" | while read line; do
        echo "  • $line"
    done
else
    print_error "시스템 파드 정보를 가져올 수 없습니다"
fi
echo ""

# Check cert-manager
echo -e "${BLUE}🔐 Cert-Manager 상태 확인${NC}"
if kubectl get pods -n cert-manager &> /dev/null; then
    CERT_MANAGER_PODS=$(kubectl get pods -n cert-manager --no-headers 2>/dev/null | grep Running | wc -l | tr -d ' ')
    TOTAL_CERT_PODS=$(kubectl get pods -n cert-manager --no-headers 2>/dev/null | wc -l | tr -d ' ')
    print_status "Cert-Manager: $CERT_MANAGER_PODS/$TOTAL_CERT_PODS 파드 Running"
    
    # Check ClusterIssuers
    if kubectl get clusterissuer &> /dev/null; then
        echo -e "${YELLOW}ClusterIssuer 상태:${NC}"
        kubectl get clusterissuer 2>/dev/null | while read line; do
            echo "  • $line"
        done
    fi
else
    print_warning "Cert-Manager가 설치되지 않았거나 접근할 수 없습니다"
fi
echo ""

# Check namespaces
echo -e "${BLUE}🏷️  네임스페이스 확인${NC}"
if kubectl get namespaces &> /dev/null; then
    echo -e "${YELLOW}프로젝트 네임스페이스:${NC}"
    kubectl get namespaces --no-headers 2>/dev/null | grep -E "(bubblepool|guestbook|demo|argocd)" | while read line; do
        echo "  • $line"
    done
else
    print_error "네임스페이스 정보를 가져올 수 없습니다"
fi
echo ""

# Check Helm releases
echo -e "${BLUE}📊 Helm 릴리스 확인${NC}"
if command -v helm &> /dev/null; then
    echo -e "${YELLOW}설치된 Helm 릴리스:${NC}"
    helm list -A 2>/dev/null | tail -n +2 | while read line; do
        echo "  • $line"
    done
else
    print_warning "Helm이 설치되지 않았습니다"
fi
echo ""

# Check AWS resources
echo -e "${BLUE}☁️  AWS 리소스 확인${NC}"
if command -v aws &> /dev/null && aws sts get-caller-identity &> /dev/null; then
    # Check Load Balancers
    LB_COUNT=$(aws elbv2 describe-load-balancers --query 'LoadBalancers[?contains(LoadBalancerName, `k8s-`)].LoadBalancerName' --output text 2>/dev/null | wc -w)
    echo "  • ALB/NLB 개수: $LB_COUNT"
    
    # Check EKS cluster in AWS
    if aws eks describe-cluster --name dev-eks-cluster --region ap-northeast-2 &> /dev/null; then
        CLUSTER_STATUS=$(aws eks describe-cluster --name dev-eks-cluster --region ap-northeast-2 --query 'cluster.status' --output text 2>/dev/null)
        print_status "AWS EKS 클러스터 상태: $CLUSTER_STATUS"
    else
        print_warning "AWS에서 EKS 클러스터를 찾을 수 없습니다"
    fi
else
    print_warning "AWS CLI가 구성되지 않았습니다"
fi
echo ""

# Summary
echo -e "${GREEN}📋 상태 요약${NC}"
echo -e "${GREEN}==========${NC}"

# Overall health check
HEALTH_SCORE=0
MAX_SCORE=6

# Check if Terraform state exists
if [ -f "terraform.tfstate" ]; then
    ((HEALTH_SCORE++))
fi

# Check if kubectl works
if kubectl cluster-info &> /dev/null; then
    ((HEALTH_SCORE++))
fi

# Check if nodes are ready
if [ "$(kubectl get nodes --no-headers 2>/dev/null | grep " Ready " | wc -l | tr -d ' ')" -gt 0 ]; then
    ((HEALTH_SCORE++))
fi

# Check if system pods are running
if [ "$(kubectl get pods -n kube-system --no-headers 2>/dev/null | grep Running | wc -l | tr -d ' ')" -gt 5 ]; then
    ((HEALTH_SCORE++))
fi

# Check if ALB controller is running
if kubectl get pods -n kube-system -l app.kubernetes.io/name=aws-load-balancer-controller 2>/dev/null | grep -q Running; then
    ((HEALTH_SCORE++))
fi

# Check if cert-manager is running
if kubectl get pods -n cert-manager 2>/dev/null | grep -q Running; then
    ((HEALTH_SCORE++))
fi

# Display health score
HEALTH_PERCENTAGE=$((HEALTH_SCORE * 100 / MAX_SCORE))

if [ $HEALTH_PERCENTAGE -ge 90 ]; then
    print_status "전체 상태: 우수 ($HEALTH_SCORE/$MAX_SCORE - $HEALTH_PERCENTAGE%)"
elif [ $HEALTH_PERCENTAGE -ge 70 ]; then
    print_warning "전체 상태: 양호 ($HEALTH_SCORE/$MAX_SCORE - $HEALTH_PERCENTAGE%)"
else
    print_error "전체 상태: 문제 있음 ($HEALTH_SCORE/$MAX_SCORE - $HEALTH_PERCENTAGE%)"
fi

echo ""
echo -e "${BLUE}확인 시간: $(date)${NC}" 