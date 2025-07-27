#!/bin/bash

# Argo Rollouts Dashboard 접속 스크립트
# 포트 포워딩으로 확실한 접속 보장

set -e

# 색상 정의
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${BLUE}🚀 Argo Rollouts Dashboard 접속 준비 중...${NC}"

# Dashboard Pod 상태 확인
echo -e "${BLUE}🔍 Dashboard Pod 상태 확인 중...${NC}"
POD_STATUS=$(kubectl get pods -n argo-rollouts -l app.kubernetes.io/name=argo-rollouts-dashboard -o jsonpath='{.items[0].status.phase}' 2>/dev/null || echo "NotFound")

if [ "$POD_STATUS" != "Running" ]; then
    echo -e "${RED}❌ Dashboard Pod가 실행 중이 아닙니다.${NC}"
    echo -e "${YELLOW}📋 Pod 상태 확인:${NC}"
    kubectl get pods -n argo-rollouts
    exit 1
fi

echo -e "${GREEN}✅ Dashboard Pod 정상 실행 중${NC}"

# 포트 포워딩 시작
echo -e "${BLUE}🌐 포트 포워딩 시작...${NC}"
echo -e "${YELLOW}⚠️  터미널을 종료하지 마세요. Ctrl+C로 중단할 수 있습니다.${NC}"
echo ""
echo -e "${GREEN}🎯 브라우저에서 접속하세요:${NC}"
echo -e "${GREEN}   📍 URL: http://localhost:3100${NC}"
echo -e "${GREEN}   📂 네임스페이스: bubblepool-dev${NC}"
echo -e "${GREEN}   🎯 Rollout: bubblepool-rollout${NC}"
echo ""
echo -e "${BLUE}🔄 Blue/Green 배포 테스트 명령어:${NC}"
echo -e "   kubectl argo rollouts set image bubblepool-rollout -n bubblepool-dev bubblepool=nginx:1.23-alpine"
echo ""

# 포트 포워딩 실행
kubectl port-forward svc/argo-rollouts-dashboard -n argo-rollouts 3100:3100 