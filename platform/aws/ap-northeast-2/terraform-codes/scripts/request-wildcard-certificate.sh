#!/bin/bash

# 🔐 barodream.com 와일드카드 SSL 인증서 요청 스크립트

set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}🔐 와일드카드 SSL 인증서 요청${NC}"
echo -e "${BLUE}=================================${NC}"
echo ""

# AWS CLI 설정 확인
if ! aws sts get-caller-identity >/dev/null 2>&1; then
    echo -e "${RED}❌ AWS CLI 설정이 필요합니다${NC}"
    echo "aws configure를 실행하세요"
    exit 1
fi

echo -e "${YELLOW}📋 요청할 도메인:${NC}"
echo "  • barodream.com (메인 도메인)"
echo "  • *.barodream.com (모든 서브도메인)"
echo ""
echo -e "${BLUE}💡 지원될 서브도메인 예시:${NC}"
echo "  • argo.barodream.com (ArgoCD)"
echo "  • bubblepool-dev.barodream.com (BubblePool)"
echo "  • guestbook-dev.barodream.com (GuestBook)"
echo "  • api.barodream.com (향후 API 서버)"
echo "  • www.barodream.com (향후 웹사이트)"
echo ""

# 인증서 요청
echo -e "${BLUE}🚀 와일드카드 SSL 인증서 요청 중...${NC}"

CERT_ARN=$(aws acm request-certificate \
    --domain-name barodream.com \
    --subject-alternative-names "*.barodream.com" \
    --validation-method DNS \
    --region ap-northeast-2 \
    --query 'CertificateArn' \
    --output text)

if [ $? -eq 0 ]; then
    echo -e "${GREEN}✅ 와일드카드 인증서 요청 성공!${NC}"
    echo ""
    echo -e "${GREEN}📋 새 인증서 ARN:${NC}"
    echo "  $CERT_ARN"
    echo ""
    
    # DNS 검증 레코드 확인
    echo -e "${BLUE}⏳ DNS 검증 레코드 정보 조회 중... (5초 대기)${NC}"
    sleep 5
    
    echo -e "${BLUE}📝 DNS 검증 레코드:${NC}"
    aws acm describe-certificate \
        --certificate-arn "$CERT_ARN" \
        --region ap-northeast-2 \
        --query 'Certificate.DomainValidationOptions[].ResourceRecord' \
        --output table
    
    echo ""
    echo -e "${GREEN}🎯 다음 단계:${NC}"
    echo "1. 📋 위 CNAME 레코드들을 Route53에 추가"
    echo "2. 🔄 기존 Ingress 설정에서 인증서 ARN 업데이트:"
    echo "   ${CERT_ARN}"
    echo "3. 🚀 Ingress 재배포"
    echo ""
    echo -e "${BLUE}💡 자동 DNS 검증 레코드 추가 스크립트:${NC}"
    echo "   ./add-wildcard-dns-validation.sh $CERT_ARN"
    
else
    echo -e "${RED}❌ 인증서 요청 실패${NC}"
    echo "AWS 권한이나 할당량을 확인하세요"
    exit 1
fi

echo ""
echo -e "${GREEN}🌟 와일드카드 인증서 혜택:${NC}"
echo "  • 하나의 인증서로 모든 서브도메인 지원"
echo "  • 새 서브도메인 추가 시 인증서 재발급 불필요"
echo "  • 관리 비용 절감"
echo "  • 자동 갱신 지원" 