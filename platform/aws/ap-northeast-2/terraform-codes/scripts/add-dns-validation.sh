#!/bin/bash

# 기존 인증서의 DNS 검증 레코드 추가
CERT_ARN="arn:aws:acm:ap-northeast-2:421114334882:certificate/2012ab5e-6569-43e7-906e-cb5e69799132"
ZONE_ID="Z0561332FUOKCAPSBXM1"

echo "🔍 인증서 검증 레코드 확인 중..."

# 검증 레코드 가져오기
aws acm describe-certificate \
    --certificate-arn "$CERT_ARN" \
    --region ap-northeast-2 \
    --query 'Certificate.DomainValidationOptions[].ResourceRecord' \
    --output json > validation-records.json

if [ -s validation-records.json ]; then
    echo "📋 검증 레코드:"
    cat validation-records.json | jq '.[]'
    
    echo ""
    echo "�� 다음 단계:"
    echo "1. 위 JSON에서 Name과 Value 값 확인"
    echo "2. Route53에 CNAME 레코드로 추가"
    echo "3. 예시 명령어:"
    echo '   aws route53 change-resource-record-sets --hosted-zone-id '$ZONE_ID' --change-batch file://dns-change.json'
else
    echo "❌ 검증 레코드를 가져올 수 없습니다"
fi
