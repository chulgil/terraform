#!/bin/bash

# Argo Rollouts 설정 검증 스크립트

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
NAMESPACE="argo-rollouts"
ENVIRONMENT="${ENVIRONMENT:-dev}"

echo -e "${BLUE}🔍 Argo Rollouts 설정 검증${NC}"
echo -e "${BLUE}==========================${NC}"
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

# Test results tracking
TESTS_PASSED=0
TESTS_FAILED=0

run_test() {
    local test_name="$1"
    local test_command="$2"
    local expected_output="$3"
    
    print_info "테스트: $test_name"
    
    if eval "$test_command" &> /dev/null; then
        print_status "$test_name"
        ((TESTS_PASSED++))
        return 0
    else
        print_error "$test_name"
        ((TESTS_FAILED++))
        return 1
    fi
}

# Step 1: 사전 요구사항 검증
echo -e "${BLUE}📋 Step 1: 사전 요구사항 검증${NC}"

run_test "kubectl 명령어 사용 가능" "command -v kubectl"
run_test "kustomize 명령어 사용 가능" "command -v kustomize"
run_test "Kubernetes 클러스터 연결" "kubectl cluster-info"

echo ""

# Step 2: Kustomize 설정 검증
echo -e "${BLUE}🔧 Step 2: Kustomize 설정 검증${NC}"

if [ -f "overlays/${ENVIRONMENT}/kustomization.yaml" ]; then
    run_test "Kustomization 파일 존재" "test -f overlays/${ENVIRONMENT}/kustomization.yaml"
    run_test "Kustomize 빌드 성공" "kustomize build overlays/${ENVIRONMENT}"
    
    # Check for required resources
    KUSTOMIZE_OUTPUT=$(kustomize build overlays/${ENVIRONMENT} 2>/dev/null)
    
    if echo "$KUSTOMIZE_OUTPUT" | grep -q "kind: Namespace"; then
        print_status "네임스페이스 리소스 포함"
        ((TESTS_PASSED++))
    else
        print_error "네임스페이스 리소스 누락"
        ((TESTS_FAILED++))
    fi
    
    if echo "$KUSTOMIZE_OUTPUT" | grep -q "argo-rollouts"; then
        print_status "Argo Rollouts 리소스 포함"
        ((TESTS_PASSED++))
    else
        print_error "Argo Rollouts 리소스 누락"
        ((TESTS_FAILED++))
    fi
else
    print_error "Kustomization 파일을 찾을 수 없습니다: overlays/${ENVIRONMENT}/kustomization.yaml"
    ((TESTS_FAILED++))
fi

echo ""

# Step 3: 실행 중인 리소스 검증 (설치된 경우)
echo -e "${BLUE}☸️  Step 3: 실행 중인 리소스 검증${NC}"

if kubectl get namespace ${NAMESPACE} &> /dev/null; then
    print_status "네임스페이스 ${NAMESPACE} 존재"
    ((TESTS_PASSED++))
    
    # Check deployments
    ROLLOUTS_DEPLOY=$(kubectl get deployment argo-rollouts -n ${NAMESPACE} --no-headers 2>/dev/null | wc -l)
    if [ "$ROLLOUTS_DEPLOY" -gt 0 ]; then
        run_test "Argo Rollouts Controller 배포됨" "kubectl get deployment argo-rollouts -n ${NAMESPACE}"
        
        # Check if deployment is ready
        READY_REPLICAS=$(kubectl get deployment argo-rollouts -n ${NAMESPACE} -o jsonpath='{.status.readyReplicas}' 2>/dev/null || echo "0")
        DESIRED_REPLICAS=$(kubectl get deployment argo-rollouts -n ${NAMESPACE} -o jsonpath='{.spec.replicas}' 2>/dev/null || echo "1")
        
        if [ "$READY_REPLICAS" -eq "$DESIRED_REPLICAS" ]; then
            print_status "Argo Rollouts Controller 준비됨 ($READY_REPLICAS/$DESIRED_REPLICAS)"
            ((TESTS_PASSED++))
        else
            print_warning "Argo Rollouts Controller 준비 중 ($READY_REPLICAS/$DESIRED_REPLICAS)"
            ((TESTS_FAILED++))
        fi
    else
        print_warning "Argo Rollouts Controller가 배포되지 않음"
        ((TESTS_FAILED++))
    fi
    
    # Check dashboard
    DASHBOARD_DEPLOY=$(kubectl get deployment argo-rollouts-dashboard -n ${NAMESPACE} --no-headers 2>/dev/null | wc -l)
    if [ "$DASHBOARD_DEPLOY" -gt 0 ]; then
        run_test "Argo Rollouts Dashboard 배포됨" "kubectl get deployment argo-rollouts-dashboard -n ${NAMESPACE}"
    else
        print_warning "Argo Rollouts Dashboard가 배포되지 않음"
        ((TESTS_FAILED++))
    fi
    
    # Check services
    run_test "Argo Rollouts 서비스 존재" "kubectl get service argo-rollouts-metrics -n ${NAMESPACE}"
    
    DASHBOARD_SVC=$(kubectl get service argo-rollouts-dashboard -n ${NAMESPACE} --no-headers 2>/dev/null | wc -l)
    if [ "$DASHBOARD_SVC" -gt 0 ]; then
        run_test "Dashboard 서비스 존재" "kubectl get service argo-rollouts-dashboard -n ${NAMESPACE}"
    else
        print_warning "Dashboard 서비스가 존재하지 않음"
        ((TESTS_FAILED++))
    fi
    
else
    print_warning "네임스페이스 ${NAMESPACE}가 존재하지 않음 (아직 설치되지 않음)"
    ((TESTS_FAILED++))
fi

echo ""

# Step 4: CRD 검증
echo -e "${BLUE}📦 Step 4: CRD (Custom Resource Definitions) 검증${NC}"

run_test "Rollouts CRD 설치됨" "kubectl get crd rollouts.argoproj.io"
run_test "AnalysisTemplates CRD 설치됨" "kubectl get crd analysistemplates.argoproj.io"
run_test "AnalysisRuns CRD 설치됨" "kubectl get crd analysisruns.argoproj.io"
run_test "Experiments CRD 설치됨" "kubectl get crd experiments.argoproj.io"

echo ""

# Step 5: 권한 검증
echo -e "${BLUE}🔐 Step 5: RBAC 권한 검증${NC}"

if kubectl get namespace ${NAMESPACE} &> /dev/null; then
    run_test "Argo Rollouts ServiceAccount 존재" "kubectl get serviceaccount argo-rollouts -n ${NAMESPACE}"
    run_test "Argo Rollouts ClusterRole 존재" "kubectl get clusterrole argo-rollouts"
    run_test "Argo Rollouts ClusterRoleBinding 존재" "kubectl get clusterrolebinding argo-rollouts"
    
    # Check dashboard RBAC (if dashboard is deployed)
    if kubectl get deployment argo-rollouts-dashboard -n ${NAMESPACE} &> /dev/null; then
        run_test "Dashboard ServiceAccount 존재" "kubectl get serviceaccount argo-rollouts-dashboard -n ${NAMESPACE}"
        run_test "Dashboard ClusterRole 존재" "kubectl get clusterrole argo-rollouts-dashboard"
        run_test "Dashboard ClusterRoleBinding 존재" "kubectl get clusterrolebinding argo-rollouts-dashboard"
    fi
else
    print_warning "네임스페이스가 없어 RBAC 검증을 건너뜁니다."
    ((TESTS_FAILED+=4))
fi

echo ""

# Step 6: 네트워크 연결성 검증
echo -e "${BLUE}🌐 Step 6: 네트워크 연결성 검증${NC}"

if kubectl get namespace ${NAMESPACE} &> /dev/null; then
    # Check if controller is accessible via service
    if kubectl get service argo-rollouts-metrics -n ${NAMESPACE} &> /dev/null; then
        CONTROLLER_IP=$(kubectl get service argo-rollouts-metrics -n ${NAMESPACE} -o jsonpath='{.spec.clusterIP}' 2>/dev/null)
        if [ -n "$CONTROLLER_IP" ]; then
            print_status "Controller 서비스 IP: $CONTROLLER_IP"
            ((TESTS_PASSED++))
        else
            print_error "Controller 서비스 IP를 가져올 수 없음"
            ((TESTS_FAILED++))
        fi
    fi
    
    # Check dashboard connectivity (if deployed)
    if kubectl get service argo-rollouts-dashboard -n ${NAMESPACE} &> /dev/null; then
        DASHBOARD_IP=$(kubectl get service argo-rollouts-dashboard -n ${NAMESPACE} -o jsonpath='{.spec.clusterIP}' 2>/dev/null)
        if [ -n "$DASHBOARD_IP" ]; then
            print_status "Dashboard 서비스 IP: $DASHBOARD_IP"
            ((TESTS_PASSED++))
        else
            print_error "Dashboard 서비스 IP를 가져올 수 없음"
            ((TESTS_FAILED++))
        fi
    fi
else
    print_warning "네임스페이스가 없어 네트워크 검증을 건너뜁니다."
    ((TESTS_FAILED+=2))
fi

echo ""

# Step 7: kubectl plugin 검증
echo -e "${BLUE}🔧 Step 7: Kubectl 플러그인 검증${NC}"

if command -v kubectl-argo-rollouts &> /dev/null; then
    run_test "kubectl argo-rollouts 플러그인 설치됨" "command -v kubectl-argo-rollouts"
    run_test "kubectl argo-rollouts 버전 확인" "kubectl argo rollouts version --client"
else
    print_warning "kubectl argo-rollouts 플러그인이 설치되지 않음"
    ((TESTS_FAILED+=2))
fi

echo ""

# Final results
echo -e "${GREEN}📊 검증 결과${NC}"
echo -e "${GREEN}==========${NC}"
echo -e "  • 통과: ${GREEN}${TESTS_PASSED}${NC}"
echo -e "  • 실패: ${RED}${TESTS_FAILED}${NC}"
echo -e "  • 전체: $((TESTS_PASSED + TESTS_FAILED))"
echo ""

if [ "$TESTS_FAILED" -eq 0 ]; then
    print_status "모든 검증이 통과했습니다! 🎉"
    echo ""
    echo -e "${BLUE}🚀 다음 단계:${NC}"
    echo -e "  1. 첫 번째 Rollout 리소스 생성"
    echo -e "  2. 배포 전략 설정 (Blue/Green, Canary)"
    echo -e "  3. 분석 템플릿 구성"
    echo -e "  4. Dashboard 접속 테스트"
    exit 0
else
    print_error "일부 검증이 실패했습니다."
    echo ""
    echo -e "${BLUE}🔧 권장 조치:${NC}"
    if [ "$TESTS_FAILED" -gt 10 ]; then
        echo -e "  • Argo Rollouts 설치: ./setup.sh"
    else
        echo -e "  • 실패한 항목들을 개별적으로 확인하세요"
        echo -e "  • Dashboard 설치: kubectl apply -f overlays/${ENVIRONMENT}/patches/dashboard-patch.yaml"
        echo -e "  • kubectl 플러그인 설치: curl -LO https://github.com/argoproj/argo-rollouts/releases/latest/download/kubectl-argo-rollouts-linux-amd64"
    fi
    exit 1
fi 