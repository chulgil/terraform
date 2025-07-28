#!/bin/bash
# Helm 릴리스 상태 정리 스크립트

set -e

echo "🧹 Helm 릴리스 상태 정리 시작..."

# 기존 Helm 릴리스 삭제 (존재하는 경우)
echo "📦 기존 ALB Controller Helm 릴리스 삭제 중..."
helm uninstall aws-load-balancer-controller -n kube-system 2>/dev/null || echo "ALB Controller가 이미 삭제되었거나 존재하지 않습니다."

# Terraform 상태에서 Helm 릴리스 제거
echo "🗑️ Terraform 상태에서 Helm 릴리스 제거 중..."
terraform state rm module.alb_controller.helm_release.alb_controller 2>/dev/null || echo "Terraform 상태에서 Helm 릴리스가 이미 제거되었습니다."

# Terraform 상태에서 IAM 정책 제거
echo "🗑️ Terraform 상태에서 IAM 정책 제거 중..."
terraform state rm module.alb_controller.aws_iam_policy.alb_controller 2>/dev/null || echo "Terraform 상태에서 IAM 정책이 이미 제거되었습니다."

# Terraform 상태에서 IAM 역할 제거
echo "🗑️ Terraform 상태에서 IAM 역할 제거 중..."
terraform state rm module.alb_controller.module.alb_controller_irsa_role 2>/dev/null || echo "Terraform 상태에서 IAM 역할이 이미 제거되었습니다."

echo "✅ Helm 릴리스 상태 정리 완료!"
echo ""
echo "이제 다음 명령어로 Terraform을 적용하세요:"
echo "terraform apply -auto-approve" 