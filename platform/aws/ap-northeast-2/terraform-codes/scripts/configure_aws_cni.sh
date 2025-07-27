#!/bin/bash

# 스크립트 설명: AWS CNI 설정을 위한 스크립트
# 사용법: ./configure_aws_cni.sh <클러스터_이름> <리전>
# 예시: ./configure_aws_cni.sh dev-eks-cluster ap-northeast-2

set -e

# 인자 확인
if [ $# -ne 2 ]; then
  echo "사용법: $0 <클러스터_이름> <리전>"
  echo "예: $0 dev-eks-cluster ap-northeast-2"
  exit 1
fi

CLUSTER_NAME=$1
REGION=$2

echo "[1/4] kubeconfig 업데이트 중..."
aws eks update-kubeconfig --name $CLUSTER_NAME --region $REGION

echo "[2/4] AWS CNI Custom Network 설정 중..."
kubectl set env daemonset aws-node -n kube-system AWS_VPC_K8S_CNI_CUSTOM_NETWORK_CFG=true

echo "[3/4] ENI Config Label 설정 중(Worker Node 식별용)..."
kubectl set env daemonset aws-node -n kube-system ENI_CONFIG_LABEL_DEF=failure-domain.beta.kubernetes.io/zone

echo "[4/4] Warm ENI Target 설정 (선택사항)..."
kubectl set env daemonset aws-node -n kube-system WARM_ENI_TARGET=2

echo -e "\n[완료] AWS CNI 설정이 완료되었습니다.\n"

echo "=== 현재 설정 상태 확인 ==="
kubectl -n kube-system get daemonset aws-node -o=jsonpath='{.spec.template.spec.containers[0].env}'

echo -e "\n=== ENI Config 확인 ==="
kubectl get eniconfigs.crd.k8s.amazonaws.com

echo -e "\n스크립트 실행이 완료되었습니다."
