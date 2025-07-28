#!/bin/bash
# ALB Controller 모듈 테스트 스크립트

set -e

echo "🧪 ALB Controller 모듈 테스트 시작..."

# 1. Terraform 계획 확인
echo "📋 Terraform 계획 확인 중..."
terraform plan -target=module.alb_controller

# 2. ALB Controller 모듈만 적용
echo "🔧 ALB Controller 모듈 적용 중..."
terraform apply -target=module.alb_controller -auto-approve

# 3. 설치 상태 확인
echo "✅ 설치 상태 확인 중..."
echo "Helm 릴리스 상태:"
helm list -n kube-system | grep aws-load-balancer-controller || echo "Helm 릴리스가 아직 준비되지 않았습니다."

echo "Pod 상태:"
kubectl get pods -n kube-system | grep aws-load-balancer-controller || echo "Pod가 아직 준비되지 않았습니다."

echo "ServiceAccount 상태:"
kubectl get serviceaccount -n kube-system | grep aws-load-balancer-controller || echo "ServiceAccount가 아직 준비되지 않았습니다."

echo "IAM 역할 상태:"
aws iam get-role --role-name dev-eks-cluster-alb-controller --query 'Role.Arn' --output text || echo "IAM 역할이 아직 준비되지 않았습니다."

echo "🎉 ALB Controller 모듈 테스트 완료!" 