# AWS EKS 클러스터 구축 가이드

이 문서는 Terraform을 사용하여 AWS EKS(Elastic Kubernetes Service) 클러스터를 구축하고 관리하는 방법을 안내합니다.

## 목차

1. [사전 준비사항](#사전-준비사항)
2. [인프라 구성](#인프라-구성)
3. [EKS 클러스터 배포](#eks-클러스터-배포)
4. [ALB Controller 설치](#alb-controller-설치)
5. [테스트 애플리케이션 배포](#테스트-애플리케이션-배포)
6. [문제 해결](#문제-해결)
7. [클린업](#클린업)

## 사전 준비사항

### 1. 필수 도구 설치

```bash
# AWS CLI (최신 버전)
aws --version

# kubectl 설치
brew update && brew install kubectl

# eksctl 설치 (선택사항)
brew tap weaveworks/tap
brew install weaveworks/tap/eksctl

# Terraform 설치
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
```

### 2. AWS 자격 증명 설정

```bash
# AWS 자격 증명 확인
aws sts get-caller-identity

# AWS 프로필 설정 (필요시)
aws configure
```

## 인프라 구성

### 디렉토리 구조

```
terraform-codes/
├── modules/
│   └── vpc/           # VPC 모듈
└── envs/
    └── production/    # 프로덕션 환경
        ├── main.tf
        ├── variables.tf
        ├── outputs.tf
        ├── alb-controller.tf
        └── echo-app.tf
```

### 주요 모듈 버전

- AWS Provider: ~> 5.0
- EKS 모듈: 19.21.0
- VPC 모듈: 5.21.0

## EKS 클러스터 배포

### 1. Terraform 초기화

```bash
# 프로젝트 루트로 이동
cd /Users/r00360/Dev/devops/terraform/terraform-codes/envs/production

# 캐시 정리 (필요시)
find . -type d -name ".terraform" -exec rm -rf {} +
find . -name ".terraform.lock.hcl" -delete

# 모듈 및 프로바이더 초기화
terraform init -upgrade
```

### 2. 배포 실행

```bash
# 변경사항 확인
terraform plan

# 인프라 배포 (실제 리소스 생성)
terraform apply
```

### 3. kubectl 설정

```bash
# kubeconfig 업데이트
aws eks update-kubeconfig --region ap-northeast-2 --name test-eks-cluster

# 노드 상태 확인
kubectl get nodes
```

## ALB Controller 설치

### 1. IAM 정책 및 역할 생성

```bash
# ALB Controller 정책 다운로드
curl -o iam-policy.json https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/v2.4.7/docs/install/iam_policy.json

# IAM 정책 생성
aws iam create-policy \
    --policy-name AWSLoadBalancerControllerIAMPolicy \
    --policy-document file://iam-policy.json

# IAM OIDC 공급자 생성
eksctl utils associate-iam-oidc-provider \
    --region ap-northeast-2 \
    --cluster test-eks-cluster \
    --approve

# IAM 서비스 계정 생성
eksctl create iamserviceaccount \
    --cluster=test-eks-cluster \
    --namespace=kube-system \
    --name=aws-load-balancer-controller \
    --role-name AmazonEKSLoadBalancerControllerRole \
    --attach-policy-arn=arn:aws:iam::$(aws sts get-caller-identity --query Account --output text):policy/AWSLoadBalancerControllerIAMPolicy \
    --approve
```

### 2. Helm을 통한 ALB Controller 설치

```bash
# Helm 리포지토리 추가
helm repo add eks https://aws.github.io/eks-charts
helm repo update

# ALB Controller 설치
helm install aws-load-balancer-controller eks/aws-load-balancer-controller \
  -n kube-system \
  --set clusterName=test-eks-cluster \
  --set serviceAccount.create=false \
  --set serviceAccount.name=aws-load-balancer-controller \
  --set region=ap-northeast-2 \
  --set vpcId=$(terraform output -raw vpc_id)

# 배포 상태 확인
kubectl get deployment -n kube-system aws-load-balancer-controller
```

## 테스트 애플리케이션 배포

### 1. Terraform으로 애플리케이션 배포

```bash
# 테스트 애플리케이션 배포
terraform apply

# 배포 상태 확인
kubectl get pods,svc,ingress
```

### 2. 애플리케이션 접속

```bash
# ALB DNS 확인
kubectl get ingress

# 웹 브라우저에서 확인 (http://<ALB-DNS>)
```

## 문제 해결

### Pod가 정상적으로 시작되지 않는 경우

```bash
# Pod 이벤트 확인
kubectl describe pod <pod-name>

# Pod 로그 확인
kubectl logs <pod-name>
```

### ALB가 생성되지 않는 경우

```bash
# ALB Controller 로그 확인
kubectl logs -n kube-system deployment/aws-load-balancer-controller
```

### 노드가 Ready 상태가 아닌 경우

```bash
# 노드 상태 확인
kubectl get nodes

# 노드 상세 정보 확인
kubectl describe node <node-name>
```

## 클린업

### 1. 테스트 애플리케이션 삭제

```bash
# 테스트 애플리케이션 삭제
kubectl delete -f <manifest-file>.yaml
```

### 2. ALB Controller 삭제

```bash
# Helm 릴리즈 삭제
helm uninstall -n kube-system aws-load-balancer-controller

# IAM 서비스 계정 삭제
eksctl delete iamserviceaccount \
  --cluster=test-eks-cluster \
  --namespace=kube-system \
  --name=aws-load-balancer-controller
```

### 3. EKS 클러스터 삭제

```bash
# 프로덕션 환경 디렉토리로 이동
cd /Users/r00360/Dev/devops/terraform/terraform-codes/envs/production

# 인프라 삭제
terraform destroy
```

### 4. IAM 정책 삭제

```bash
# IAM 정책 ARN 확인
aws iam list-policies --query "Policies[?PolicyName=='AWSLoadBalancerControllerIAMPolicy'].Arn" --output text

# IAM 정책 삭제
aws iam delete-policy --policy-arn <policy-arn>
```

## 참고 자료

- [AWS EKS 공식 문서](https://docs.aws.amazon.com/eks/latest/userguide/what-is-eks.html)
- [AWS Load Balancer Controller](https://kubernetes-sigs.github.io/aws-load-balancer-controller/)
- [Terraform AWS EKS 모듈](https://registry.terraform.io/modules/terraform-aws-modules/eks/aws/latest)
