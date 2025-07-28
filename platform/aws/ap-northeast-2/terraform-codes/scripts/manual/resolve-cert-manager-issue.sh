#!/bin/bash
# Cert-Manager 문제 완전 해결 스크립트

set -e

echo "🔧 Cert-Manager 문제 완전 해결 시작..."

# 1. 현재 상태 확인
echo "📋 현재 상태 확인 중..."
echo "Terraform 상태:"
terraform state list | grep cert-manager || echo "Terraform 상태에 cert-manager 없음"

echo "Kubernetes cert-manager 네임스페이스:"
kubectl get namespace cert-manager 2>/dev/null && echo "cert-manager 네임스페이스 존재" || echo "cert-manager 네임스페이스 없음"

# 2. Terraform 상태에서 cert-manager 관련 리소스 제거
echo "🗑️ Terraform 상태에서 cert-manager 관련 리소스 제거 중..."
terraform state rm module.cert_manager.kubernetes_namespace.cert_manager 2>/dev/null || echo "네임스페이스가 이미 제거됨"
terraform state rm module.cert_manager.helm_release.cert_manager 2>/dev/null || echo "Helm release가 이미 제거됨"
terraform state rm module.cert_manager.kubectl_manifest.letsencrypt_prod_issuer 2>/dev/null || echo "Prod issuer가 이미 제거됨"
terraform state rm module.cert_manager.kubectl_manifest.letsencrypt_staging_issuer 2>/dev/null || echo "Staging issuer가 이미 제거됨"
terraform state rm module.cert_manager.kubectl_manifest.letsencrypt_route53_issuer 2>/dev/null || echo "Route53 issuer가 이미 제거됨"
terraform state rm module.cert_manager.aws_iam_policy.cert_manager_route53 2>/dev/null || echo "IAM policy가 이미 제거됨"
terraform state rm module.cert_manager.kubernetes_service_account.cert_manager_route53 2>/dev/null || echo "ServiceAccount가 이미 제거됨"
terraform state rm module.cert_manager.kubectl_manifest.test_certificate 2>/dev/null || echo "Test certificate가 이미 제거됨"

# 3. 기존 cert-manager 리소스 정리
echo "🧹 기존 cert-manager 리소스 정리 중..."
kubectl delete namespace cert-manager --ignore-not-found=true || echo "cert-manager 네임스페이스가 이미 삭제됨"

# 4. 잠시 대기
echo "⏳ 리소스 삭제 완료 대기 중..."
sleep 15

# 5. Terraform 계획 확인
echo "📋 Terraform 계획 확인 중..."
terraform plan

echo ""
echo "✅ Cert-Manager 문제 해결 완료!"
echo ""
echo "이제 다음 중 하나를 선택하세요:"
echo ""
echo "1. Terraform 적용 (Cert-Manager 제외):"
echo "   terraform apply -auto-approve"
echo ""
echo "2. Cert-Manager 수동 설치:"
echo "   chmod +x manual-cert-manager-setup.sh"
echo "   ./manual-cert-manager-setup.sh"
echo ""
echo "3. Cert-Manager 모듈 다시 활성화 (나중에):"
echo "   - main.tf에서 cert-manager 모듈 주석 해제"
echo "   - outputs.tf에서 cert-manager 출력 주석 해제"
echo "   - terraform apply -auto-approve" 