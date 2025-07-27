#!/bin/bash
# barodream.com DNS 레코드 설정

set -e

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${GREEN}[정보]${NC} barodream.com DNS 레코드 설정 시작"

# ALB DNS 이름 확인
echo "🔍 ALB DNS 이름 확인 중..."
ALB_DNS=$(kubectl get ingress bubblepool-ingress -n bubblepool-dev -o jsonpath='{.status.loadBalancer.ingress[0].hostname}' 2>/dev/null || echo "ALB_NOT_READY")

if [ "$ALB_DNS" = "ALB_NOT_READY" ]; then
    echo -e "${RED}[오류]${NC} ALB가 아직 준비되지 않았습니다."
    echo "먼저 애플리케이션을 배포하세요:"
    echo "kubectl apply -f ../../../../management/argo-cd/applications/projects/dev-apps.yaml"
    exit 1
fi

echo "📋 ALB DNS: $ALB_DNS"

# 호스팅 영역 ID 확인
ZONE_ID=$(aws route53 list-hosted-zones-by-name --dns-name barodream.com --query 'HostedZones[0].Id' --output text | cut -d'/' -f3)

if [ "$ZONE_ID" = "None" ]; then
    echo -e "${RED}[오류]${NC} barodream.com 호스팅 영역을 찾을 수 없습니다"
    exit 1
fi

echo "🎯 호스팅 영역 ID: $ZONE_ID"

# BubblePool CNAME 레코드 생성
echo "📝 BubblePool DNS 레코드 생성 중..."
aws route53 change-resource-record-sets --hosted-zone-id $ZONE_ID --change-batch "{
    \"Changes\": [{
        \"Action\": \"UPSERT\",
        \"ResourceRecordSet\": {
            \"Name\": \"bubblepool-dev.barodream.com\",
            \"Type\": \"CNAME\",
            \"TTL\": 300,
            \"ResourceRecords\": [{\"Value\": \"$ALB_DNS\"}]
        }
    }]
}"

# GuestBook CNAME 레코드 생성
echo "📝 GuestBook DNS 레코드 생성 중..."
aws route53 change-resource-record-sets --hosted-zone-id $ZONE_ID --change-batch "{
    \"Changes\": [{
        \"Action\": \"UPSERT\",
        \"ResourceRecordSet\": {
            \"Name\": \"guestbook-dev.barodream.com\",
            \"Type\": \"CNAME\",
            \"TTL\": 300,
            \"ResourceRecords\": [{\"Value\": \"$ALB_DNS\"}]
        }
    }]
}"

echo -e "${GREEN}✅ DNS 레코드가 성공적으로 생성되었습니다!${NC}"
echo ""
echo "🌐 접속 URL:"
echo "   BubblePool: https://bubblepool-dev.barodream.com"
echo "   GuestBook:  https://guestbook-dev.barodream.com"
echo ""
echo "⏰ DNS 전파에 5-10분 정도 소요될 수 있습니다"
echo ""
echo "🔍 접속 테스트:"
echo "curl -I https://bubblepool-dev.barodream.com"
echo "curl -I https://guestbook-dev.barodream.com"
