#!/bin/bash

# Argo Rollouts 설치 및 설정 스크립트
set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
NAMESPACE="argo-rollouts"
ROLLOUTS_VERSION="v1.7.2"
ENVIRONMENT="${ENVIRONMENT:-dev}"

echo -e "${BLUE}🚀 Argo Rollouts 설치 시작${NC}"
echo -e "${BLUE}=============================${NC}"
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

# Function to check if command exists
check_command() {
    if ! command -v $1 &> /dev/null; then
        print_error "$1이 설치되어 있지 않습니다."
        exit 1
    fi
}

# Check prerequisites
echo -e "${BLUE}🔍 사전 요구사항 확인...${NC}"
check_command kubectl
check_command kustomize

# Check if kubectl is connected to cluster
if ! kubectl cluster-info &> /dev/null; then
    print_error "Kubernetes 클러스터에 연결할 수 없습니다."
    exit 1
fi

print_status "사전 요구사항 확인 완료"
echo ""

# Step 1: Validate Kustomize configuration
echo -e "${BLUE}📋 Step 1: Kustomize 설정 검증...${NC}"

if [ ! -f "overlays/${ENVIRONMENT}/kustomization.yaml" ]; then
    print_error "overlays/${ENVIRONMENT}/kustomization.yaml 파일을 찾을 수 없습니다."
    exit 1
fi

# Validate Kustomize build
print_info "Kustomize 빌드 검증 중..."
if ! kustomize build overlays/${ENVIRONMENT} > /dev/null; then
    print_error "Kustomize 빌드에 실패했습니다."
    exit 1
fi

print_status "Step 1 완료"
echo ""

# Step 2: Create namespace (if not exists)
echo -e "${BLUE}🏗️  Step 2: 네임스페이스 생성...${NC}"

if kubectl get namespace ${NAMESPACE} &> /dev/null; then
    print_warning "네임스페이스 ${NAMESPACE}가 이미 존재합니다."
else
    kubectl create namespace ${NAMESPACE}
    print_status "네임스페이스 ${NAMESPACE} 생성 완료"
fi

echo ""

# Step 3: Apply Argo Rollouts manifests
echo -e "${BLUE}⚙️  Step 3: Argo Rollouts 매니페스트 적용...${NC}"

print_info "Kustomize로 매니페스트 적용 중..."
kustomize build overlays/${ENVIRONMENT} | kubectl apply -f -

print_status "Step 3 완료"
echo ""

# Step 4: Wait for Argo Rollouts to be ready
echo -e "${BLUE}⏳ Step 4: Argo Rollouts 준비 대기...${NC}"

print_info "Argo Rollouts Controller 준비 대기 중..."
kubectl wait --for=condition=available --timeout=300s deployment/argo-rollouts -n ${NAMESPACE}

print_info "Argo Rollouts Dashboard 준비 대기 중..."
kubectl wait --for=condition=available --timeout=300s deployment/argo-rollouts-dashboard -n ${NAMESPACE} || true

print_status "Step 4 완료"
echo ""

# Step 5: Install kubectl plugin (optional)
echo -e "${BLUE}🔧 Step 5: Kubectl 플러그인 설치...${NC}"

if command -v kubectl-argo-rollouts &> /dev/null; then
    print_warning "kubectl argo-rollouts 플러그인이 이미 설치되어 있습니다."
else
    print_info "kubectl argo-rollouts 플러그인 설치 중..."
    curl -LO https://github.com/argoproj/argo-rollouts/releases/latest/download/kubectl-argo-rollouts-$(uname -s | tr '[:upper:]' '[:lower:]')-$(uname -m | sed 's/x86_64/amd64/')
    chmod +x kubectl-argo-rollouts-*
    sudo mv kubectl-argo-rollouts-* /usr/local/bin/kubectl-argo-rollouts
    print_status "kubectl argo-rollouts 플러그인 설치 완료"
fi

echo ""

# Step 6: Verification
echo -e "${BLUE}✅ Step 6: 설치 검증...${NC}"

# Check pods
print_info "파드 상태 확인 중..."
kubectl get pods -n ${NAMESPACE}

# Check services
print_info "서비스 상태 확인 중..."
kubectl get services -n ${NAMESPACE}

# Check if Argo Rollouts CRDs are installed
print_info "CRD 설치 확인 중..."
if kubectl get crd rollouts.argoproj.io &> /dev/null; then
    print_status "Rollouts CRD가 설치되어 있습니다."
else
    print_error "Rollouts CRD가 설치되지 않았습니다."
fi

echo ""

# Display access information
echo -e "${GREEN}🎉 Argo Rollouts 설치 완료!${NC}"
echo -e "${GREEN}=========================${NC}"
echo ""

# Get dashboard service information
DASHBOARD_SERVICE=$(kubectl get svc argo-rollouts-dashboard -n ${NAMESPACE} -o jsonpath='{.spec.type}' 2>/dev/null || echo "NotFound")
NODEPORT_SERVICE=$(kubectl get svc argo-rollouts-dashboard-nodeport -n ${NAMESPACE} -o jsonpath='{.spec.ports[0].nodePort}' 2>/dev/null || echo "")

echo -e "${BLUE}📊 접속 정보:${NC}"
echo -e "  • 네임스페이스: ${NAMESPACE}"
echo -e "  • 버전: ${ROLLOUTS_VERSION}"
echo -e "  • 환경: ${ENVIRONMENT}"
echo ""

echo -e "${BLUE}🔗 Dashboard 접속:${NC}"
if [ "$NODEPORT_SERVICE" != "" ]; then
    echo -e "  • NodePort: http://<node-ip>:${NODEPORT_SERVICE}/rollouts"
fi

# Check for Ingress
INGRESS_HOST=$(kubectl get ingress argo-rollouts-dashboard-ingress -n ${NAMESPACE} -o jsonpath='{.spec.rules[0].host}' 2>/dev/null || echo "")
if [ "$INGRESS_HOST" != "" ]; then
    echo -e "  • Ingress: https://${INGRESS_HOST}/rollouts"
fi

echo -e "  • Port Forward: kubectl port-forward svc/argo-rollouts-dashboard -n ${NAMESPACE} 3100:3100"
echo ""

echo -e "${BLUE}🛠️  유용한 명령어:${NC}"
echo -e "  • Rollout 목록: kubectl get rollouts -A"
echo -e "  • Rollout 상태: kubectl argo rollouts get rollout <name> -n <namespace>"
echo -e "  • Dashboard 실행: kubectl argo rollouts dashboard"
echo -e "  • 로그 확인: kubectl logs -f deployment/argo-rollouts -n ${NAMESPACE}"
echo ""

echo -e "${BLUE}📋 다음 단계:${NC}"
echo -e "  1. 첫 번째 Rollout 리소스 생성"
echo -e "  2. 블루/그린 또는 카나리 배포 전략 구성"
echo -e "  3. 분석 템플릿 및 메트릭 설정"
echo -e "  4. 알림 설정 (Slack, 이메일 등)"
echo ""

print_status "설치가 성공적으로 완료되었습니다!" 