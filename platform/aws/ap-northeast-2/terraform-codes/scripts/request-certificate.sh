#!/bin/bash

# 새로운 SSL 인증서 요청
echo "🔐 새 SSL 인증서 요청 중..."

# AWS CLI 설정 확인
if ! aws sts get-caller-identity >/dev/null 2>&1; then
    echo "❌ AWS CLI 설정이 필요합니다"
    echo "aws configure를 실행하세요"
    exit 1
fi

# 인증서 요청
CERT_ARN=$(aws acm request-certificate \
    --domain-name barodream.com \
    --subject-alternative-names "*.barodream.com" \
    --validation-method DNS \
    --region ap-northeast-2 \
    --query 'CertificateArn' \
    --output text)

if [ $? -eq 0 ]; then
    echo "✅ 인증서 요청 성공: $CERT_ARN"
    
    # 검증 레코드 확인
    echo "📋 DNS 검증 레코드 확인 중..."
    aws acm describe-certificate \
        --certificate-arn "$CERT_ARN" \
        --region ap-northeast-2 \
        --query 'Certificate.DomainValidationOptions[].ResourceRecord' \
        --output table
    
    echo ""
    echo "🎯 다음 단계:"
    echo "1. 위 CNAME 레코드들을 Route53에 추가"
    echo "2. 인증서 ARN을 Ingress에 업데이트"
    echo "3. Ingress 재배포"
    
else
    echo "❌ 인증서 요청 실패"
fi
