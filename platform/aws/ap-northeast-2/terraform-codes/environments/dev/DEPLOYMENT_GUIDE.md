# Dev 환경 배포 가이드

## 🚀 **배포 순서 (중요!)**

### **1단계: 인프라 배포 (EKS 클러스터)**
```bash
# providers-k8s.tf 파일을 임시로 제외
mv providers-k8s.tf providers-k8s.tf.disabled

# Terraform 초기화
terraform init

# 인프라 배포 (EKS 클러스터 생성)
terraform plan
terraform apply
```

### **2단계: Kubernetes Provider 활성화**
```bash
# EKS 클러스터 생성 완료 후 Kubernetes provider 활성화
mv providers-k8s.tf.disabled providers-k8s.tf

# Provider 재초기화
terraform init

# Kubernetes 리소스 배포
terraform plan
terraform apply
```

## 🔧 **문제 해결**

### **Provider 설정 에러 발생 시**
```bash
# 1. kubeconfig 설정
aws eks update-kubeconfig --region ap-northeast-2 --name dev-eks-cluster

# 2. 클러스터 연결 확인
kubectl get nodes

# 3. Terraform provider 재초기화
terraform init -upgrade
```

### **Data source 에러 발생 시**
```bash
# EKS 클러스터가 실제로 존재하는지 확인
aws eks describe-cluster --name dev-eks-cluster --region ap-northeast-2

# 클러스터 이름이 다른 경우 outputs.tf에서 확인
terraform output cluster_name
```

## 📋 **현재 해결된 문제들**

- ✅ **Count 의존성 에러**: Bastion 규칙 제거로 해결
- ✅ **Data source 에러**: Provider 설정 분리로 해결
- ✅ **Project name 변수**: 누락된 변수 추가로 해결

## 🎯 **배포 확인**

```bash
# 1. EKS 클러스터 상태
kubectl get nodes

# 2. 시스템 파드 상태
kubectl get pods -A

# 3. ALB Controller 상태
kubectl get pods -n kube-system | grep aws-load-balancer-controller

# 4. Cert-Manager 상태
kubectl get pods -n cert-manager
```

---

## ⚠️ **주의사항**

- **단계별 배포 필수**: EKS 클러스터 생성 → Kubernetes provider 활성화
- **Provider 분리**: `providers-k8s.tf` 파일은 클러스터 생성 후에만 사용
- **의존성 관리**: 모듈 간 순환 의존성 방지 