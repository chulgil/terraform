#!/bin/bash
# 간단한 ALB Controller 설치 스크립트

set -e

echo "🚀 간단한 ALB Controller 설치 시작..."

# 기존 설치 제거
echo "🧹 기존 설치 제거 중..."
helm uninstall aws-load-balancer-controller -n kube-system 2>/dev/null || echo "기존 설치가 없습니다."

# Helm 저장소 추가
echo "📦 Helm 저장소 추가 중..."
helm repo add eks https://aws.github.io/eks-charts
helm repo update

# 간단한 설치 (최소 설정)
echo "🔧 ALB Controller 설치 중..."
helm install aws-load-balancer-controller eks/aws-load-balancer-controller \
  -n kube-system \
  --set clusterName=dev-eks-cluster \
  --set region=ap-northeast-2 \
  --set vpcId=vpc-06fadf9c2c40d86b9

echo "✅ ALB Controller 설치 완료!"
echo ""
echo "설치 상태 확인:"
echo "kubectl get pods -n kube-system | grep aws-load-balancer-controller"
echo ""
echo "로그 확인:"
echo "kubectl logs -n kube-system deployment/aws-load-balancer-controller" 