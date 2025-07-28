#!/bin/bash
# GitHub Actions OIDC Provider 문제 해결 스크립트

set -e

echo "🔐 GitHub Actions OIDC Provider 문제 해결 시작..."

# 1. 현재 OIDC Provider 확인
echo "📋 현재 OIDC Provider 확인 중..."
aws iam list-open-id-connect-providers --query 'OpenIDConnectProviderList[?contains(Arn, `token.actions.githubusercontent.com`)]' --output table

# 2. OIDC Provider가 없으면 생성
echo "🔧 OIDC Provider 생성 중..."
aws iam create-open-id-connect-provider \
  --url https://token.actions.githubusercontent.com \
  --client-id-list sts.amazonaws.com \
  --thumbprint-list 6938fd4d98bab03faadb97b34396831e3780aea1 \
  --region ap-northeast-2 2>/dev/null || echo "OIDC Provider가 이미 존재합니다."

# 3. 생성된 Provider 확인
echo "✅ 생성된 OIDC Provider 확인:"
aws iam list-open-id-connect-providers --query 'OpenIDConnectProviderList[?contains(Arn, `token.actions.githubusercontent.com`)]' --output table

# 4. IAM Role 확인 및 생성
echo "🔑 GitHub Actions IAM Role 확인 중..."
if aws iam get-role --role-name GitHubActionsRole >/dev/null 2>&1; then
    echo "GitHubActionsRole이 이미 존재합니다."
else
    echo "GitHubActionsRole을 생성 중..."
    aws iam create-role \
      --role-name GitHubActionsRole \
      --assume-role-policy-document '{
        "Version": "2012-10-17",
        "Statement": [
          {
            "Action": "sts:AssumeRoleWithWebIdentity",
            "Effect": "Allow",
            "Principal": {
              "Federated": "arn:aws:iam::'"$(aws sts get-caller-identity --query Account --output text)"':oidc-provider/token.actions.githubusercontent.com"
            },
            "Condition": {
              "StringEquals": {
                "token.actions.githubusercontent.com:aud": "sts.amazonaws.com"
              },
              "StringLike": {
                "token.actions.githubusercontent.com:sub": "repo:chulgil/terraform:*"
              }
            }
          }
        ]
      }'
fi

# 5. ECR 정책 연결
echo "📦 ECR 정책 연결 중..."
aws iam put-role-policy \
  --role-name GitHubActionsRole \
  --policy-name GitHubActionsECRPolicy \
  --policy-document '{
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Action": [
          "ecr:GetAuthorizationToken",
          "ecr:BatchCheckLayerAvailability",
          "ecr:GetDownloadUrlForLayer",
          "ecr:BatchGetImage",
          "ecr:PutImage",
          "ecr:InitiateLayerUpload",
          "ecr:UploadLayerPart",
          "ecr:CompleteLayerUpload"
        ],
        "Resource": "*"
      },
      {
        "Effect": "Allow",
        "Action": [
          "ecr:CreateRepository",
          "ecr:DescribeRepositories"
        ],
        "Resource": "*"
      }
    ]
  }'

# 6. 생성된 Role ARN 출력
echo "✅ 생성된 IAM Role ARN:"
ROLE_ARN=$(aws iam get-role --role-name GitHubActionsRole --query 'Role.Arn' --output text)
echo "ROLE_ARN: $ROLE_ARN"

echo ""
echo "🎉 GitHub Actions OIDC Provider 문제 해결 완료!"
echo ""
echo "다음 정보를 GitHub Secrets에 설정하세요:"
echo "AWS_ROLE_ARN: $ROLE_ARN"
echo "AWS_ACCOUNT_ID: $(aws sts get-caller-identity --query Account --output text)"
echo "AWS_REGION: ap-northeast-2" 