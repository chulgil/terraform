#!/bin/bash
# 기존 OIDC Provider를 Terraform 상태로 가져오는 스크립트

set -e

echo "📥 기존 OIDC Provider를 Terraform 상태로 가져오기 시작..."

# 1. 기존 OIDC Provider ARN 확인
echo "📋 기존 OIDC Provider ARN 확인 중..."
OIDC_ARN=$(aws iam list-open-id-connect-providers --query 'OpenIDConnectProviderList[?contains(Arn, `token.actions.githubusercontent.com`)].Arn' --output text)

if [ -z "$OIDC_ARN" ]; then
    echo "❌ OIDC Provider를 찾을 수 없습니다."
    exit 1
fi

echo "✅ OIDC Provider ARN: $OIDC_ARN"

# 2. Terraform 상태로 가져오기
echo "📥 Terraform 상태로 가져오는 중..."
terraform import module.eks.aws_iam_openid_connect_provider.github_actions "$OIDC_ARN"

# 3. 가져오기 확인
echo "✅ 가져오기 완료 확인:"
terraform state show module.eks.aws_iam_openid_connect_provider.github_actions

echo ""
echo "🎉 OIDC Provider 가져오기 완료!"
echo ""
echo "이제 Terraform을 적용하세요:"
echo "terraform apply -auto-approve" 