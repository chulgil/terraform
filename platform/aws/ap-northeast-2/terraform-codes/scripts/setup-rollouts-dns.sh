#!/bin/bash

# Argo Rollouts Dashboard DNS 설정 스크립트
# rollouts-dev.barodream.com -> ALB 연결

set -e

# 색상 정의
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${BLUE}🚀 Argo Rollouts Dashboard DNS 설정 시작...${NC}"

# 필수 변수 설정
ZONE_ID="Z0561332FUOKCAPSBXM1"
DOMAIN="rollouts-dev.barodream.com"

# ALB DNS 이름 가져오기 (Rollouts Dashboard 전용 ALB)
ALB_DNS=$(kubectl get ingress argo-rollouts-dashboard-ingress -n argo-rollouts -o jsonpath='{.status.loadBalancer.ingress[0].hostname}')

if [ -z "$ALB_DNS" ]; then
    echo -e "${RED}❌ ALB DNS를 가져올 수 없습니다. BubblePool Ingress를 확인하세요.${NC}"
    exit 1
fi

echo -e "${GREEN}📡 ALB DNS: ${ALB_DNS}${NC}"

# Route53에 CNAME 레코드 생성
echo -e "${BLUE}📝 DNS 레코드 생성 중...${NC}"

aws route53 change-resource-record-sets --hosted-zone-id $ZONE_ID --change-batch "{
    \"Changes\": [{
        \"Action\": \"UPSERT\",
        \"ResourceRecordSet\": {
            \"Name\": \"$DOMAIN\",
            \"Type\": \"CNAME\",
            \"TTL\": 300,
            \"ResourceRecords\": [{\"Value\": \"$ALB_DNS\"}]
        }
    }]
}"

if [ $? -eq 0 ]; then
    echo -e "${GREEN}✅ DNS 레코드 생성 완료!${NC}"
    echo -e "${GREEN}🌐 URL: https://$DOMAIN${NC}"
    echo -e "${YELLOW}⏰ DNS 전파까지 최대 5분 소요${NC}"
    
    echo ""
    echo -e "${BLUE}📋 접속 정보:${NC}"
    echo -e "  • ${GREEN}대시보드 URL${NC}: https://$DOMAIN/rollouts/"
    echo -e "  • ${GREEN}네임스페이스${NC}: bubblepool-dev"
    echo -e "  • ${GREEN}Rollout${NC}: bubblepool-rollout"
    
    echo ""
    echo -e "${BLUE}🔍 DNS 전파 확인:${NC}"
    echo -e "  nslookup $DOMAIN"
    echo -e "  dig $DOMAIN"
else
    echo -e "${RED}❌ DNS 레코드 생성 실패${NC}"
    exit 1
fi

echo -e "${GREEN}🎉 Argo Rollouts Dashboard DNS 설정 완료!${NC}" 