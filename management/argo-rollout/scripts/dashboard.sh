#!/bin/bash

# Argo Rollouts Dashboard 접속 스크립트

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
NAMESPACE="argo-rollouts"
DASHBOARD_PORT="${DASHBOARD_PORT:-3100}"
LOCAL_PORT="${LOCAL_PORT:-3100}"

echo -e "${BLUE}🚀 Argo Rollouts Dashboard 접속${NC}"
echo -e "${BLUE}===============================${NC}"
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

# Check if kubectl is available
if ! command -v kubectl &> /dev/null; then
    print_error "kubectl이 설치되어 있지 않습니다."
    exit 1
fi

# Check if connected to cluster
if ! kubectl cluster-info &> /dev/null; then
    print_error "Kubernetes 클러스터에 연결할 수 없습니다."
    exit 1
fi

# Check if namespace exists
if ! kubectl get namespace ${NAMESPACE} &> /dev/null; then
    print_error "네임스페이스 ${NAMESPACE}를 찾을 수 없습니다."
    exit 1
fi

# Check if dashboard service exists
if ! kubectl get service argo-rollouts-dashboard -n ${NAMESPACE} &> /dev/null; then
    print_error "Argo Rollouts Dashboard 서비스를 찾을 수 없습니다."
    exit 1
fi

# Check if dashboard is running
READY_PODS=$(kubectl get pods -n ${NAMESPACE} -l app.kubernetes.io/name=argo-rollouts-dashboard --field-selector=status.phase=Running --no-headers 2>/dev/null | wc -l)

if [ "$READY_PODS" -eq 0 ]; then
    print_warning "Argo Rollouts Dashboard 파드가 실행되지 않고 있습니다."
    print_info "파드 상태 확인 중..."
    kubectl get pods -n ${NAMESPACE} -l app.kubernetes.io/name=argo-rollouts-dashboard
    echo ""
    
    read -p "계속 진행하시겠습니까? (y/N): " -n 1 -r
    echo ""
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1
    fi
fi

# Display connection options
echo -e "${BLUE}📊 사용 가능한 접속 방법:${NC}"
echo ""

# Option 1: Port Forward
echo -e "${GREEN}1. Port Forward (권장)${NC}"
echo -e "   명령어: kubectl port-forward svc/argo-rollouts-dashboard -n ${NAMESPACE} ${LOCAL_PORT}:${DASHBOARD_PORT}"
echo -e "   접속 URL: http://localhost:${LOCAL_PORT}/rollouts"
echo ""

# Option 2: NodePort (if exists)
NODEPORT=$(kubectl get svc argo-rollouts-dashboard-nodeport -n ${NAMESPACE} -o jsonpath='{.spec.ports[0].nodePort}' 2>/dev/null || echo "")
if [ "$NODEPORT" != "" ]; then
    echo -e "${GREEN}2. NodePort 접속${NC}"
    
    # Get node IPs
    NODE_IPS=$(kubectl get nodes -o jsonpath='{.items[*].status.addresses[?(@.type=="ExternalIP")].address}' 2>/dev/null)
    if [ -z "$NODE_IPS" ]; then
        NODE_IPS=$(kubectl get nodes -o jsonpath='{.items[*].status.addresses[?(@.type=="InternalIP")].address}' 2>/dev/null)
    fi
    
    echo -e "   포트: ${NODEPORT}"
    for ip in $NODE_IPS; do
        echo -e "   접속 URL: http://${ip}:${NODEPORT}/rollouts"
    done
    echo ""
fi

# Option 3: Ingress (if exists)
INGRESS_HOST=$(kubectl get ingress argo-rollouts-dashboard-ingress -n ${NAMESPACE} -o jsonpath='{.spec.rules[0].host}' 2>/dev/null || echo "")
if [ "$INGRESS_HOST" != "" ]; then
    echo -e "${GREEN}3. Ingress 접속${NC}"
    echo -e "   접속 URL: https://${INGRESS_HOST}/rollouts"
    echo ""
fi

# Option 4: kubectl plugin dashboard
if command -v kubectl-argo-rollouts &> /dev/null; then
    echo -e "${GREEN}4. Kubectl Plugin Dashboard${NC}"
    echo -e "   명령어: kubectl argo rollouts dashboard"
    echo -e "   설명: 내장 dashboard 실행 (별도 터미널 필요)"
    echo ""
fi

# Interactive port forwarding
echo -e "${BLUE}🚀 자동 Port Forward 시작하기${NC}"
read -p "Port Forward를 시작하시겠습니까? (Y/n): " -n 1 -r
echo ""

if [[ $REPLY =~ ^[Nn]$ ]]; then
    print_info "Port Forward를 시작하지 않습니다."
    exit 0
fi

# Check if port is already in use
if lsof -Pi :${LOCAL_PORT} -sTCP:LISTEN -t >/dev/null 2>&1; then
    print_warning "포트 ${LOCAL_PORT}가 이미 사용 중입니다."
    
    # Find alternative port
    for port in $(seq $((LOCAL_PORT+1)) $((LOCAL_PORT+10))); do
        if ! lsof -Pi :${port} -sTCP:LISTEN -t >/dev/null 2>&1; then
            LOCAL_PORT=$port
            print_info "대안 포트 ${LOCAL_PORT}를 사용합니다."
            break
        fi
    done
fi

print_info "Port Forward 시작 중..."
print_status "접속 URL: http://localhost:${LOCAL_PORT}/rollouts"
echo ""
print_info "종료하려면 Ctrl+C를 누르세요."
echo ""

# Create a trap to cleanup on exit
cleanup() {
    print_info "Port Forward를 종료합니다..."
    exit 0
}
trap cleanup SIGINT SIGTERM

# Start port forwarding
kubectl port-forward svc/argo-rollouts-dashboard -n ${NAMESPACE} ${LOCAL_PORT}:${DASHBOARD_PORT} 