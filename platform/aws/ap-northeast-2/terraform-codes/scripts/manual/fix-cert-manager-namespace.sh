#!/bin/bash
# Cert-Manager 네임스페이스 문제 해결 스크립트

set -e

echo "🔧 Cert-Manager 네임스페이스 문제 해결 시작..."

# 1. 기존 cert-manager 네임스페이스 확인
echo "📋 기존 cert-manager 네임스페이스 확인 중..."
kubectl get namespace cert-manager 2>/dev/null && echo "cert-manager 네임스페이스가 존재합니다." || echo "cert-manager 네임스페이스가 존재하지 않습니다."

# 2. Terraform 상태에서 네임스페이스 제거
echo "🗑️ Terraform 상태에서 cert-manager 네임스페이스 제거 중..."
terraform state rm module.cert_manager.kubernetes_namespace.cert_manager 2>/dev/null || echo "Terraform 상태에서 네임스페이스가 이미 제거되었습니다."

# 3. 기존 cert-manager 리소스 정리
echo "🧹 기존 cert-manager 리소스 정리 중..."
kubectl delete namespace cert-manager --ignore-not-found=true || echo "cert-manager 네임스페이스가 이미 삭제되었습니다."

# 4. 잠시 대기
echo "⏳ 네임스페이스 삭제 완료 대기 중..."
sleep 10

# 5. Terraform 적용
echo "🔧 Terraform 적용 중..."
terraform apply -target=module.cert_manager.kubernetes_namespace.cert_manager -auto-approve

echo "✅ Cert-Manager 네임스페이스 문제 해결 완료!"
echo ""
echo "이제 전체 Terraform을 적용하세요:"
echo "terraform apply -auto-approve" 