#!/bin/bash
# ALB Controller 수동 설치 스크립트

set -e

echo "🚀 ALB Controller 수동 설치 시작..."

# Helm 저장소 추가
echo "📦 Helm 저장소 추가 중..."
helm repo add eks https://aws.github.io/eks-charts
helm repo update

# ALB Controller 설치
echo "🔧 ALB Controller 설치 중..."
helm install aws-load-balancer-controller eks/aws-load-balancer-controller \
  -n kube-system \
  --set clusterName=dev-eks-cluster \
  --set serviceAccount.create=true \
  --set serviceAccount.name=aws-load-balancer-controller \
  --set serviceAccount.annotations."eks\.amazonaws\.com/role-arn"=arn:aws:iam::421114334882:role/dev-eks-cluster-alb-controller \
  --set region=ap-northeast-2 \
  --set vpcId=vpc-06fadf9c2c40d86b9 \
  --set image.tag=v2.4.2

echo "✅ ALB Controller 수동 설치 완료!"
echo ""
echo "설치 상태 확인:"
echo "kubectl get pods -n kube-system | grep aws-load-balancer-controller" 