#!/bin/bash
# Cert-Manager 수동 설치 스크립트

set -e

echo "🔐 Cert-Manager 수동 설치 시작..."

# 1. 기존 cert-manager 정리
echo "🧹 기존 cert-manager 정리 중..."
kubectl delete namespace cert-manager --ignore-not-found=true || echo "cert-manager 네임스페이스가 이미 삭제되었습니다."

# 2. 잠시 대기
echo "⏳ 네임스페이스 삭제 완료 대기 중..."
sleep 10

# 3. Helm 저장소 추가
echo "📦 Helm 저장소 추가 중..."
helm repo add jetstack https://charts.jetstack.io
helm repo update

# 4. Cert-Manager 설치
echo "🔧 Cert-Manager 설치 중..."
helm install cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --create-namespace \
  --version v1.13.3 \
  --set installCRDs=true \
  --set prometheus.enabled=true \
  --set startupapicheck.enabled=true

# 5. 설치 확인
echo "✅ 설치 상태 확인 중..."
echo "Pod 상태:"
kubectl get pods -n cert-manager

echo "ServiceAccount 상태:"
kubectl get serviceaccount -n cert-manager

echo "CRD 상태:"
kubectl get crd | grep cert-manager

echo "🎉 Cert-Manager 수동 설치 완료!"
echo ""
echo "설치 상태 확인:"
echo "kubectl get pods -n cert-manager"
echo "kubectl get crd | grep cert-manager" 