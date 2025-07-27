#!/bin/bash

# kubectl이 멈춰도 argo-rollout 상태를 확인하는 대안 방법

echo "🔍 Argo Rollouts 파일 기반 검증"
echo "================================"

# 1. 설정 파일 검증
echo "1. 설정 파일 존재 확인:"
ls -la management/argo-rollout/overlays/dev/
echo ""

# 2. Kustomize 빌드 테스트 (kubectl 없이)
echo "2. Kustomize 빌드 테스트:"
if command -v kustomize &> /dev/null; then
    kustomize build management/argo-rollout/overlays/dev/ > /tmp/argo-rollout-manifest.yaml
    echo "✅ Kustomize 빌드 성공 - /tmp/argo-rollout-manifest.yaml"
    echo "매니페스트 파일 크기: $(wc -l < /tmp/argo-rollout-manifest.yaml) 줄"
else
    echo "❌ kustomize 설치 필요"
fi
echo ""

# 3. AWS 연결 테스트
echo "3. AWS 연결 상태:"
if aws sts get-caller-identity --output text 2>/dev/null; then
    echo "✅ AWS 인증 성공"
else
    echo "❌ AWS 인증 실패"
fi
echo ""

# 4. EKS 클러스터 상태 (kubectl 없이)
echo "4. EKS 클러스터 상태:"
if aws eks describe-cluster --name dev-eks-cluster --region ap-northeast-2 --query 'cluster.status' --output text 2>/dev/null; then
    echo "✅ EKS 클러스터 발견"
    aws eks describe-cluster --name dev-eks-cluster --region ap-northeast-2 --query 'cluster.{Status:status,Version:version,Endpoint:endpoint}' --output table 2>/dev/null
else
    echo "❌ EKS 클러스터 접근 실패"
fi
echo ""

# 5. 포트 포워딩 대안 방법
echo "5. 대안 접속 방법:"
echo "▶️ 포트 포워딩 (터미널이 정상이면):"
echo "   kubectl port-forward svc/argo-rollouts-dashboard -n argo-rollouts 3100:3100"
echo ""
echo "▶️ 직접 ALB 접근 (DNS 설정된 경우):"
echo "   https://rollouts-dev.barodream.com"
echo ""
echo "▶️ NodePort 접근 (설정된 경우):"
echo "   http://<워커노드IP>:30100"
echo ""

# 6. 문제 해결 방법
echo "6. 터미널 멈춤 해결:"
echo "   • aws eks update-kubeconfig --name dev-eks-cluster --region ap-northeast-2"
echo "   • kubectl config get-contexts"
echo "   • kubectl get nodes --request-timeout=5s"
echo ""

echo "7. 매뉴얼 확인:"
cat management/argo-rollout/README.md | grep -A 5 -B 5 "Dashboard 접속"

echo ""
echo "✅ 파일 기반 검증 완료" 