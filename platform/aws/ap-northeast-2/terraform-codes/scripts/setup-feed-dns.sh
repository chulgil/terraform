#!/bin/bash
# feed-dev.barodream.com DNS 레코드 설정

set -e

GREEN='\033[0;32m'
RED='\033[0;31m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${BLUE}🌐 feed-dev.barodream.com DNS 레코드 설정 시작${NC}"

# 호스팅 영역 ID (기존 barodream.com 사용)
ZONE_ID="Z0561332FUOKCAPSBXM1"

# ALB DNS 이름 확인
echo "🔍 ALB DNS 이름 확인 중..."
ALB_DNS=$(kubectl get ingress feed-server-ingress -n feed-server-dev -o jsonpath='{.status.loadBalancer.ingress[0].hostname}' 2>/dev/null || echo "ALB_NOT_READY")

if [ "$ALB_DNS" = "ALB_NOT_READY" ]; then
    echo -e "${RED}[오류]${NC} ALB가 아직 준비되지 않았습니다."
    echo "먼저 애플리케이션을 배포하세요:"
    echo "kubectl apply -f ../../../../management/argo-cd/applications/projects/dev-apps.yaml"
    exit 1
fi

echo "📋 ALB DNS: $ALB_DNS"
echo "🎯 호스팅 영역 ID: $ZONE_ID"

# Feed Server CNAME 레코드 생성
echo "📝 Feed Server DNS 레코드 생성 중..."
aws route53 change-resource-record-sets --hosted-zone-id $ZONE_ID --change-batch "{
    \"Changes\": [{
        \"Action\": \"UPSERT\",
        \"ResourceRecordSet\": {
            \"Name\": \"feed-dev.barodream.com\",
            \"Type\": \"CNAME\",
            \"TTL\": 300,
            \"ResourceRecords\": [{\"Value\": \"$ALB_DNS\"}]
        }
    }]
}"

if [ $? -eq 0 ]; then
    echo -e "${GREEN}✅ DNS 레코드가 성공적으로 생성되었습니다!${NC}"
    echo ""
    echo "🌐 접속 URL:"
    echo "   Feed Server: https://feed-dev.barodream.com"
    echo ""
    echo "⏰ DNS 전파에 5-10분 정도 소요될 수 있습니다"
    echo ""
    echo "🔍 접속 테스트:"
    echo "curl -I https://feed-dev.barodream.com"
    echo "curl -I https://feed-dev.barodream.com/actuator/health"
    echo "curl -I https://feed-dev.barodream.com/api/feed/health"
else
    echo -e "${RED}❌ DNS 레코드 생성 실패${NC}"
    exit 1
fi

echo -e "${GREEN}🎉 Feed Server DNS 설정 완료!${NC}" 