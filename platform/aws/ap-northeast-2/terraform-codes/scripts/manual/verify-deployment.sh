#!/bin/bash
# 배포 상태 확인 스크립트

set -e

echo "🔍 배포 상태 확인 시작..."

# 1. EKS 클러스터 상태
echo "📋 EKS 클러스터 상태:"
kubectl cluster-info

# 2. 노드 상태
echo ""
echo "🖥️ 노드 상태:"
kubectl get nodes

# 3. 네임스페이스 확인
echo ""
echo "📁 네임스페이스 확인:"
kubectl get namespaces

# 4. ALB Controller 상태
echo ""
echo "🌐 ALB Controller 상태:"
kubectl get pods -n kube-system | grep aws-load-balancer-controller || echo "ALB Controller Pod를 찾을 수 없습니다."

# 5. Helm 릴리스 확인
echo ""
echo "📦 Helm 릴리스 확인:"
helm list -A

# 6. Terraform 출력 확인
echo ""
echo "🏗️ Terraform 출력 확인:"
terraform output

# 7. AWS 리소스 확인
echo ""
echo "☁️ AWS 리소스 확인:"
echo "VPC ID: $(terraform output -raw vpc_id)"
echo "클러스터 이름: $(terraform output -raw cluster_name)"
echo "ALB Controller IAM Role: $(terraform output -raw alb_controller_iam_role_arn)"

echo ""
echo "✅ 배포 상태 확인 완료!" 