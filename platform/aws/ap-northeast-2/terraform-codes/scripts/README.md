# 🚀 EKS 자동화 스크립트 가이드

이 문서는 AWS EKS 환경을 완전 자동화하여 배포, 관리, 삭제할 수 있는 스크립트들의 사용법을 설명합니다.

## 📋 **스크립트 목록**

| 스크립트 | 용도 | 소요 시간 |
|----------|------|-----------|
| `deploy.sh` | **완전 자동화 배포** | 15-20분 |
| `status.sh` | **상태 확인** | 1-2분 |
| `destroy.sh` | **안전한 삭제** | 10-15분 |

## 🎯 **deploy.sh - 완전 자동화 배포**

### **사용법**
```bash
# terraform-codes 루트 디렉토리에서 실행
cd platform/aws/ap-northeast-2/terraform-codes
./scripts/deploy.sh
```

### **특징**
- ✅ **에러 방지**: 모든 의존성 문제를 자동으로 해결
- ✅ **단계별 배포**: 11단계로 나누어 안전하게 진행
- ✅ **실시간 상태 확인**: 각 컴포넌트가 준비될 때까지 대기
- ✅ **완전 무인 배포**: 사용자 개입 없이 처음부터 끝까지 자동화

### **배포 단계**
```
🔍 Step 0: 사전 요구사항 확인 (terraform, kubectl, helm, aws)
📋 Step 1: Terraform 설정 준비 (Kubernetes provider 임시 비활성화)
🏗️  Step 2: 기본 인프라 배포 (VPC, EKS, Bastion, EFS)
⚙️  Step 3: Kubernetes 클러스터 설정 (kubeconfig, 노드 대기)
🔧 Step 4: Kubernetes Provider 활성화
🔄 Step 5: Cluster Autoscaler 배포
📦 Step 6: Helm Repository 설정
🔐 Step 7: Cert-Manager 배포
⚖️  Step 8: ALB Controller 배포
🏅 Step 9: SSL 인증서 발급자 설정
✅ Step 10: 최종 검증 및 정리
🏗️  Step 11: 멀티 프로젝트 네임스페이스 생성
```

### **배포 완료 후 생성되는 것들**
```
✅ 성공적으로 배포된 컴포넌트:
  • VPC 및 네트워크 인프라
  • EKS 클러스터 (Kubernetes 1.33)
  • Cluster Autoscaler (자동 스케일링)
  • ALB Controller (로드밸런서 자동 생성)
  • Cert-Manager (SSL 인증서 자동 발급)
  • EBS CSI Driver (영구 스토리지)
  • EFS CSI Driver (공유 파일 시스템)
  • Bastion 호스트 (SSH 접근)
  • 멀티 프로젝트 네임스페이스 (bubblepool, guestbook, demo)
```

### **생성되는 파일**
- `deployment-info.txt`: 배포 정보 및 접속 정보 저장

## 📊 **status.sh - 상태 확인**

### **사용법**
```bash
# terraform-codes 루트 디렉토리에서 실행
cd platform/aws/ap-northeast-2/terraform-codes
./scripts/status.sh
```

### **확인 항목**
- 🔍 **도구 상태**: terraform, kubectl, helm, aws CLI 설치 확인
- 🔑 **AWS 자격 증명**: 계정 및 권한 확인
- 🏗️  **Terraform 상태**: 리소스 배포 상태 확인
- ☸️  **Kubernetes 연결**: 클러스터 접근성 및 노드 상태
- 📦 **시스템 파드**: 핵심 시스템 컴포넌트 상태
- 🔐 **Cert-Manager**: SSL 인증서 관리 상태
- 🏷️  **네임스페이스**: 프로젝트별 네임스페이스 확인
- 📊 **Helm 릴리스**: 설치된 Helm 차트 목록
- ☁️  **AWS 리소스**: 클라우드 리소스 상태

### **건강 상태 점수**
- **90-100%**: 우수 ✅
- **70-89%**: 양호 ⚠️
- **70% 미만**: 문제 있음 ❌

## 🗑️  **destroy.sh - 안전한 삭제**

### **사용법**
```bash
# terraform-codes 루트 디렉토리에서 실행
cd platform/aws/ap-northeast-2/terraform-codes
./scripts/destroy.sh
```

### **안전 장치**
1. **이중 확인**: `yes` 입력 후 `DELETE` 입력 필요
2. **단계별 삭제**: Helm → AWS 리소스 → Terraform → 로컬 파일
3. **잔여 리소스 확인**: 수동 삭제가 필요한 리소스 알림

### **삭제 단계**
```
Step 1: Helm 릴리스 제거 (ALB Controller, Cert-Manager)
Step 2: 남은 AWS 리소스 확인 (Load Balancer 등)
Step 3: Terraform 리소스 삭제 (모든 인프라)
Step 4: 로컬 파일 정리 (상태 파일, kubeconfig)
```

## 🔧 **사전 요구사항**

### **필수 도구 설치**
```bash
# macOS
brew install terraform kubectl helm awscli

# Ubuntu/Debian
sudo apt update
sudo apt install -y terraform kubectl helm awscli

# CentOS/RHEL
sudo yum install -y terraform kubectl helm awscli
```

### **AWS 자격 증명 설정**
```bash
# AWS CLI 설정
aws configure

# 또는 환경 변수
export AWS_ACCESS_KEY_ID="your-access-key"
export AWS_SECRET_ACCESS_KEY="your-secret-key"
export AWS_DEFAULT_REGION="ap-northeast-2"
```

### **필요한 AWS 권한**
- EKS 클러스터 생성/관리
- VPC 및 네트워크 리소스 관리
- IAM 역할 및 정책 생성
- EC2 인스턴스 및 보안 그룹 관리
- ELB/ALB 생성 및 관리

## 🚨 **문제 해결**

### **일반적인 문제들**

#### **1. AWS 권한 부족**
```bash
# 오류: AccessDenied
# 해결: AWS 사용자에게 AdministratorAccess 또는 필요한 권한 부여
aws sts get-caller-identity  # 현재 사용자 확인
```

#### **2. kubectl 연결 실패**
```bash
# 해결: kubeconfig 재설정
aws eks update-kubeconfig --region ap-northeast-2 --name dev-eks-cluster
```

#### **3. Terraform 상태 문제**
```bash
# 해결: 상태 새로고침
terraform refresh
terraform plan
```

#### **4. 네트워크 연결 문제**
```bash
# 해결: DNS 확인
nslookup eks.ap-northeast-2.amazonaws.com
ping 8.8.8.8
```

### **로그 확인**

#### **스크립트 실행 로그 저장**
```bash
# terraform-codes 루트에서 실행
cd platform/aws/ap-northeast-2/terraform-codes

# 배포 로그 저장
./scripts/deploy.sh 2>&1 | tee deploy.log

# 상태 확인 로그 저장
./scripts/status.sh 2>&1 | tee status.log
```

#### **Kubernetes 로그 확인**
```bash
# 시스템 파드 로그
kubectl logs -n kube-system -l app.kubernetes.io/name=aws-load-balancer-controller
kubectl logs -n cert-manager -l app.kubernetes.io/name=cert-manager

# 노드 이벤트
kubectl get events -A --sort-by='.lastTimestamp'
```

## 🎯 **사용 시나리오**

### **🆕 새 환경 구축**
```bash
# terraform-codes 루트에서 실행
cd platform/aws/ap-northeast-2/terraform-codes

# 1. 완전 자동화 배포
./scripts/deploy.sh

# 2. 상태 확인
./scripts/status.sh

# 3. 배포 정보 확인
cat environments/dev/deployment-info.txt
```

### **🔍 정기 상태 점검**
```bash
# 매일/매주 실행 권장
cd platform/aws/ap-northeast-2/terraform-codes
./scripts/status.sh
```

### **🧹 환경 정리**
```bash
# 개발 완료 후 또는 비용 절약을 위해
cd platform/aws/ap-northeast-2/terraform-codes
./scripts/destroy.sh
```

### **🔄 재배포**
```bash
# 문제 발생 시 완전 재구축
cd platform/aws/ap-northeast-2/terraform-codes
./scripts/destroy.sh  # 기존 환경 삭제
./scripts/deploy.sh   # 새로 배포
```

## ⏱️ **예상 소요 시간**

| 작업 | 소요 시간 | 비고 |
|------|-----------|------|
| **새 배포** | 15-20분 | 첫 번째 배포 |
| **재배포** | 10-15분 | 기존 리소스 일부 재사용 |
| **상태 확인** | 1-2분 | 빠른 헬스 체크 |
| **완전 삭제** | 10-15분 | 모든 리소스 정리 |

## 💰 **예상 비용 (월간)**

- **EKS 클러스터**: $73/월
- **EC2 인스턴스** (t3.medium × 2): $60-80/월
- **NAT 게이트웨이** (2개): $90/월
- **ALB**: $20-30/월
- **EBS 볼륨**: $10-20/월
- **총 예상**: $250-290/월

> 💡 **비용 절약 팁**: 개발 완료 후 `./scripts/destroy.sh`로 환경을 삭제하면 비용을 크게 절약할 수 있습니다.

## 🔗 **다음 단계**

배포 완료 후 권장 작업:

1. **ArgoCD 설치**: GitOps 환경 구축
2. **모니터링 설정**: Prometheus + Grafana
3. **첫 번째 애플리케이션 배포**: bubblepool 또는 guestbook
4. **백업 설정**: Velero for Kubernetes backups

---

## 📞 **지원**

문제가 발생하면:
1. `./scripts/status.sh`로 상태 확인
2. 로그 파일 확인 (`deploy.log`, `status.log`)
3. AWS 콘솔에서 리소스 상태 확인
4. 필요 시 `./scripts/destroy.sh` 후 재배포

**Happy Deploying! 🚀** 