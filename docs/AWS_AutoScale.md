# AWS EKS Cluster Autoscaler 구축 가이드

## 개요

이 가이드는 AWS EKS 클러스터에서 Cluster Autoscaler를 구축하고 테스트하는 방법을 설명합니다. Cluster Autoscaler는 Pod의 리소스 요구사항에 따라 워커 노드를 자동으로 확장(Scale-out) 및 축소(Scale-in)하는 기능을 제공합니다.

## 아키텍처 개요

```
┌─────────────────────────────────────────────────────────────────┐
│                        AWS Cloud                                │
│  ┌─────────────────────────────────────────────────────────────┐│
│  │                VPC (172.31.0.0/16)                         ││
│  │                                                             ││
│  │  ┌─────────────────┐    ┌─────────────────────────────────┐ ││
│  │  │ Public Subnet   │    │ Private Subnet                  │ ││
│  │  │ - Bastion       │    │ ┌─────────────────────────────┐ │ ││
│  │  │ - NAT Gateway   │    │ │      EKS Cluster            │ │ ││
│  │  └─────────────────┘    │ │ ┌─────────────────────────┐ │ │ ││
│  │                         │ │ │   Cluster Autoscaler    │ │ │ ││
│  │                         │ │ │   - ServiceAccount      │ │ │ ││
│  │                         │ │ │   - IAM Role (IRSA)     │ │ │ ││
│  │                         │ │ │   - Deployment          │ │ │ ││
│  │                         │ │ └─────────────────────────┘ │ │ ││
│  │                         │ │                             │ │ ││
│  │                         │ │ ┌─────────────────────────┐ │ │ ││
│  │                         │ │ │   EKS Node Groups       │ │ │ ││
│  │                         │ │ │   - Auto Scaling Group  │ │ │ ││
│  │                         │ │ │   - Worker Nodes        │ │ │ ││
│  │                         │ │ │   - Pods                │ │ │ ││
│  │                         │ │ └─────────────────────────┘ │ │ ││
│  │                         │ └─────────────────────────────┘ │ ││
│  │                         └─────────────────────────────────┘ ││
│  └─────────────────────────────────────────────────────────────┘│
└─────────────────────────────────────────────────────────────────┘
```

## 구성 요소

### 1. AWS Auto Scaling Group 태그 설정

EKS 노드 그룹에는 다음 태그들이 자동으로 설정됩니다:

```hcl
tags = {
  "k8s.io/cluster-autoscaler/enabled"         = "true"
  "k8s.io/cluster-autoscaler/${cluster_name}" = "owned"
  "kubernetes.io/cluster/${cluster_name}"     = "owned"
}
```

### 2. IAM 정책 및 역할

Cluster Autoscaler는 다음 AWS API 권한이 필요합니다:

- `autoscaling:DescribeAutoScalingGroups`
- `autoscaling:DescribeAutoScalingInstances`
- `autoscaling:SetDesiredCapacity`
- `autoscaling:TerminateInstanceInAutoScalingGroup`
- `ec2:DescribeInstanceTypes`
- `eks:DescribeNodegroup`

### 3. Kubernetes RBAC

Cluster Autoscaler는 다음 Kubernetes 리소스에 대한 권한이 필요합니다:

- Nodes (watch, list, get, update)
- Pods (watch, list, get)
- Events (create, patch)
- ConfigMaps (create, list, watch, get, update, delete)

## 구축 단계

### 1단계: Terraform 코드 배포

```bash
cd /Users/r00360/Dev/devops/terraform/terraform-codes/environments/dev

# Terraform 초기화
terraform init

# 계획 확인
terraform plan

# 배포 실행
terraform apply
```

### 2단계: Cluster Autoscaler 배포 확인

```bash
# EKS 클러스터 연결 설정
aws eks update-kubeconfig --region ap-northeast-2 --name dev-eks-cluster

# Cluster Autoscaler 배포 상태 확인
kubectl get deployment cluster-autoscaler -n kube-system

# Cluster Autoscaler 로그 확인
kubectl logs -f deployment/cluster-autoscaler -n kube-system
```

### 3단계: 노드 그룹 상태 확인

```bash
# 현재 노드 상태 확인
kubectl get nodes

# Auto Scaling Group 상태 확인
aws autoscaling describe-auto-scaling-groups \
  --query 'AutoScalingGroups[?contains(Tags[?Key==`k8s.io/cluster-autoscaler/enabled`].Value, `true`)].[AutoScalingGroupName,MinSize,MaxSize,DesiredCapacity]' \
  --output table
```

## 테스트 시나리오

### 테스트 1: Scale-out (10개 POD 배포)

#### 1.1 테스트 배포 실행

```bash
# 10개 POD 배포
kubectl apply -f /Users/r00360/Dev/devops/terraform/k8s-manifests/cluster-autoscaler/test-deployment.yaml

# POD 상태 확인
kubectl get pods -l app=nginx-scale-test

# POD 스케줄링 상태 확인
kubectl get pods -l app=nginx-scale-test -o wide
```

#### 1.2 Scale-out 모니터링

```bash
# Cluster Autoscaler 로그 실시간 모니터링
kubectl logs -f deployment/cluster-autoscaler -n kube-system

# 노드 증가 확인 (별도 터미널)
watch kubectl get nodes

# Auto Scaling Group 상태 모니터링 (별도 터미널)
watch "aws autoscaling describe-auto-scaling-groups --query 'AutoScalingGroups[?contains(Tags[?Key==\`k8s.io/cluster-autoscaler/enabled\`].Value, \`true\`)].[AutoScalingGroupName,MinSize,MaxSize,DesiredCapacity]' --output table"
```

#### 1.3 예상 결과

- **초기 상태**: 2개 워커 노드 (min_size)
- **POD 배포 후**: 리소스 부족으로 일부 POD가 Pending 상태
- **Scale-out 발생**: Cluster Autoscaler가 새로운 노드 추가
- **최종 상태**: 모든 POD가 Running 상태, 노드 수 증가

### 테스트 2: Scale-in (2개 POD로 축소)

#### 2.1 POD 수 축소

```bash
# POD 수를 2개로 축소
kubectl apply -f /Users/r00360/Dev/devops/terraform/k8s-manifests/cluster-autoscaler/test-deployment-scale-in.yaml

# POD 상태 확인
kubectl get pods -l app=nginx-scale-test
```

#### 2.2 Scale-in 모니터링

```bash
# Cluster Autoscaler 로그 모니터링
kubectl logs -f deployment/cluster-autoscaler -n kube-system

# 노드 감소 확인 (10분 후)
watch kubectl get nodes

# 불필요한 노드 식별 로그 확인
kubectl logs deployment/cluster-autoscaler -n kube-system | grep "scale down"
```

#### 2.3 예상 결과

- **초기 상태**: 확장된 워커 노드들
- **POD 축소 후**: 대부분의 노드가 사용률 저하
- **Scale-in 발생**: 10분 후 불필요한 노드 제거 시작
- **최종 상태**: 최소 필요한 노드만 유지

## 주요 설정 파라미터

### Cluster Autoscaler 설정

```yaml
# 주요 명령행 옵션
--scale-down-delay-after-add=10m      # Scale-up 후 Scale-down 대기 시간
--scale-down-unneeded-time=10m        # 불필요한 노드 유지 시간
--skip-nodes-with-local-storage=false # 로컬 스토리지 노드 스킵 여부
--skip-nodes-with-system-pods=false   # 시스템 POD 노드 스킵 여부
--expander=least-waste                # 확장 전략
--balance-similar-node-groups=true    # 유사 노드 그룹 밸런싱
```

### 노드 그룹 설정

```hcl
# EKS 노드 그룹 스케일링 설정
scaling_config {
  desired_size = 2    # 초기 노드 수
  max_size     = 10   # 최대 노드 수
  min_size     = 1    # 최소 노드 수
}
```

## 모니터링 및 로그

### 1. Cluster Autoscaler 상태 확인

```bash
# 배포 상태
kubectl get deployment cluster-autoscaler -n kube-system

# 서비스 어카운트 확인
kubectl get serviceaccount cluster-autoscaler -n kube-system

# ConfigMap 상태 확인
kubectl get configmap cluster-autoscaler-status -n kube-system -o yaml
```

### 2. 로그 분석

```bash
# 전체 로그 확인
kubectl logs deployment/cluster-autoscaler -n kube-system

# Scale-out 관련 로그
kubectl logs deployment/cluster-autoscaler -n kube-system | grep "scale up"

# Scale-in 관련 로그
kubectl logs deployment/cluster-autoscaler -n kube-system | grep "scale down"

# 에러 로그 확인
kubectl logs deployment/cluster-autoscaler -n kube-system | grep -i error
```

### 3. 메트릭 모니터링

```bash
# 노드 리소스 사용률
kubectl top nodes

# POD 리소스 사용률
kubectl top pods

# 클러스터 이벤트 확인
kubectl get events --sort-by=.metadata.creationTimestamp
```

## 문제 해결

### 일반적인 문제들

#### 1. Cluster Autoscaler가 시작되지 않는 경우

```bash
# IAM 역할 확인
kubectl describe serviceaccount cluster-autoscaler -n kube-system

# IRSA 설정 확인
aws iam get-role --role-name dev-eks-cluster-cluster-autoscaler-role

# 정책 연결 확인
aws iam list-attached-role-policies --role-name dev-eks-cluster-cluster-autoscaler-role
```

#### 2. 노드가 확장되지 않는 경우

```bash
# Auto Scaling Group 태그 확인
aws autoscaling describe-tags --filters Name=key,Values=k8s.io/cluster-autoscaler/enabled

# 노드 그룹 상태 확인
aws eks describe-nodegroup --cluster-name dev-eks-cluster --nodegroup-name dev-eks-cluster-node-group

# Cluster Autoscaler 로그에서 에러 확인
kubectl logs deployment/cluster-autoscaler -n kube-system | grep -i "failed\|error"
```

#### 3. 노드가 축소되지 않는 경우

```bash
# 노드의 시스템 POD 확인
kubectl get pods --all-namespaces -o wide | grep <node-name>

# PodDisruptionBudget 확인
kubectl get pdb --all-namespaces

# 노드 드레인 가능 여부 확인
kubectl describe node <node-name>
```

## 보안 고려사항

### 1. IAM 최소 권한 원칙

- Cluster Autoscaler IAM 역할은 필요한 최소 권한만 부여
- IRSA(IAM Roles for Service Accounts) 사용으로 보안 강화

### 2. 네트워크 보안

- 워커 노드는 프라이빗 서브넷에 배치
- 보안 그룹을 통한 트래픽 제어

### 3. 리소스 제한

- 노드 그룹의 최대 크기 제한 설정
- 비용 최적화를 위한 인스턴스 타입 선택

## 비용 최적화

### 1. 인스턴스 타입 최적화

```hcl
# 다양한 인스턴스 타입 사용
instance_types = ["t3.medium", "t3.large", "m5.large"]

# Spot 인스턴스 활용
capacity_type = "SPOT"
```

### 2. 스케일링 정책 조정

```yaml
# 빠른 Scale-down으로 비용 절약
--scale-down-delay-after-add=5m
--scale-down-unneeded-time=5m
```

### 3. 리소스 요청 최적화

```yaml
# POD 리소스 요청 적절히 설정
resources:
  requests:
    cpu: 100m      # 과도한 요청 방지
    memory: 128Mi
```

## 결론

이 가이드를 통해 AWS EKS에서 Cluster Autoscaler를 성공적으로 구축하고 테스트할 수 있습니다. 주요 성공 요소는:

1. **적절한 태그 설정**: Auto Scaling Group에 필요한 태그 구성
2. **IAM 권한 관리**: IRSA를 통한 안전한 권한 부여
3. **모니터링**: 로그와 메트릭을 통한 지속적인 모니터링
4. **테스트**: 정기적인 Scale-out/Scale-in 테스트 수행

Cluster Autoscaler는 Kubernetes 클러스터의 효율성과 비용 최적화에 중요한 역할을 하므로, 운영 환경에서는 지속적인 모니터링과 튜닝이 필요합니다.

## 추가 리소스

- [AWS EKS Cluster Autoscaler 공식 문서](https://docs.aws.amazon.com/eks/latest/userguide/autoscaling.html)
- [Kubernetes Cluster Autoscaler GitHub](https://github.com/kubernetes/autoscaler/tree/master/cluster-autoscaler)
- [AWS EKS 모범 사례](https://aws.github.io/aws-eks-best-practices/)

---

**작성일**: 2025-01-25  
**버전**: 1.0  
**작성자**: DevOps Team
