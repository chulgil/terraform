#!/bin/bash

# Argo Rollouts 빠른 문제 해결 스크립트
# HTTPS 접속 문제 및 터미널 멈춤 문제 해결

echo "🔧 Argo Rollouts 문제 해결 시작..."

# 1. 네임스페이스 확인
echo "1. 네임스페이스 상태 확인..."
kubectl get namespace argo-rollouts 2>/dev/null || kubectl create namespace argo-rollouts

# 2. 현재 파드 상태 확인
echo "2. 파드 상태 확인..."
kubectl get pods -n argo-rollouts

# 3. 서비스 상태 확인
echo "3. 서비스 상태 확인..."
kubectl get services -n argo-rollouts

# 4. Ingress 상태 확인
echo "4. Ingress 상태 확인..."
kubectl get ingress -n argo-rollouts

# 5. 대시보드 상태 확인
echo "5. 대시보드 로그 확인..."
kubectl logs -l app.kubernetes.io/name=argo-rollouts-dashboard -n argo-rollouts --tail=10

echo ""
echo "🚀 포트 포워딩으로 대시보드 접속:"
echo "kubectl port-forward svc/argo-rollouts-dashboard -n argo-rollouts 3100:3100"
echo ""
echo "브라우저에서 http://localhost:3100 접속"

# 6. DNS 문제 확인
echo "6. DNS 문제 확인..."
nslookup rollouts-dev.barodream.com || echo "DNS 해결 실패 - 포트 포워딩 사용 권장"

echo "✅ 문제 진단 완료" 