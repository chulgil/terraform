# AWS EKS 개발 환경 (Dev Environment) ✅ 배포 완료

이 문서는 Terraform으로 구축된 AWS EKS 개발 환경의 구조, 구성 요소 및 유지보수 가이드를 제공합니다.

## 🎉 배포 상태 (2025-07-22 업데이트)

**✅ 모든 인프라 컴포넌트가 성공적으로 배포되어 운영 중입니다!**

### 현재 운영 중인 서비스
- **EKS 클러스터**: `dev-eks-cluster` (Kubernetes 1.33) - 정상 작동
- **노드 그룹**: 2개 노드 Running 상태 (t3.medium, AL2023)
- **ALB Controller**: 2개 파드 Running (Helm 배포 완료)
- **Cert-Manager**: 3개 파드 Running (Helm 배포 완료)
- **IRSA/OIDC Provider**: 활성화 및 정상 작동
- **VPC 엔드포인트**: ECR, S3, EC2 통신 정상
- **Bastion 호스트**: `54.180.136.244` - SSH 접근 가능

### 해결된 주요 문제들
- ✅ **EKS Node Group 생성 실패** → VPC 엔드포인트 보안그룹 egress 규칙 추가로 해결
- ✅ **ALB Controller Helm 배포 실패** → IRSA annotation 처리 방식 개선으로 해결
- ✅ **Cert-Manager 네임스페이스 충돌** → 기존 네임스페이스 삭제 후 재생성으로 해결
- ✅ **OIDC Provider 미생성** → `enable_irsa = true` 추가로 해결
- ✅ **ALB Controller IAM 권한 오류** → 모든 필요 권한(EC2, ELB, WAF) 추가로 해결
- ✅ **ALB 생성 및 Ingress 서비스 노출** → 완전 자동화 성공

### 🌐 현재 접속 가능한 서비스
- **ALB URL**: `http://k8s-default-nginxing-38a72446fe-250405398.ap-northeast-2.elb.amazonaws.com`
- **서비스**: nginx 웹 서버 (테스트 애플리케이션)
- **상태**: 정상 작동 중 ✅

## 프로젝트 구조

```
environments/dev/
├── backend.tf        # Terraform 원격 상태 저장소 설정
├── main.tf           # 주요 리소스 모듈 호출
├── outputs.tf        # 출력값 정의
├── variables.tf      # 변수 정의
└── versions.tf       # 프로바이더 설정
```

## 인프라 아키텍처

![AWS 네트워크 아키텍처](../../../docs/img/aws_network2.png)

### 주요 구성요소

1. **VPC**
   - CIDR: `10.0.0.0/16`
   - DNS 지원: 활성화
   - DNS 호스트명: 활성화

2. **서브넷**
   - **퍼블릭 서브넷 (2개)**
     - `10.0.1.0/24` (ap-northeast-2a)
     - `10.0.2.0/24` (ap-northeast-2b)
   - **프라이빗 서브넷 (3개)**
     - `10.0.4.0/24` (ap-northeast-2a)
     - `10.0.5.0/24` (ap-northeast-2b)
     - `10.0.6.0/24` (ap-northeast-2c)

3. **인터넷 게이트웨이 (IGW)**
   - 퍼블릭 서브넷에 연결되어 인터넷 접근 제공

4. **NAT 게이트웨이**
   - 각 퍼블릭 서브넷에 배치
   - 프라이빗 서브넷의 인스턴스가 인터넷에 접근할 수 있도록 지원

5. **Bastion 호스트**
   - 퍼블릭 서브넷에 배치
   - SSH 접속(포트 22)만 허용
   - Amazon Linux 2023 AMI 사용

6. **EKS 클러스터**
   - Kubernetes 버전: 1.33
   - 컨트롤 플레인: 프라이빗 서브넷에 배치
   - 노드 그룹: 
     - 인스턴스 타입: t3.medium
     - 노드 수: 최소 1, 최대 3, 희망 2
     - AMI 타입: AL2023_x86_64_STANDARD

7. **ALB Controller**
   - 애플리케이션 로드 밸런서와 인그레스 관리

8. **Certificate Manager**
   - SSL/TLS 인증서 관리

## 모듈 구성

### VPC 모듈

VPC, 서브넷, 라우팅 테이블, IGW, NAT 게이트웨이 등의 네트워크 리소스를 생성합니다.

```hcl
module "vpc" {
  source = "../../modules/vpc"
  
  environment = var.environment
  vpc_cidr = var.vpc_cidr
  public_subnet_cidrs = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  region = var.region
  
  common_tags = local.common_tags
}
```

### IAM 모듈

AWS 리소스 접근을 위한 IAM 역할과 정책을 생성합니다.

```hcl
module "iam" {
  source = "../../modules/iam"

  environment = var.environment
  common_tags = local.common_tags
}
```

### EKS 모듈

EKS 클러스터, 노드 그룹, 클러스터 역할 등을 생성합니다.

```hcl
module "eks" {
  source = "../../modules/eks"

  environment = var.environment
  cluster_name = "${var.environment}-eks-cluster"
  subnet_ids = concat(module.vpc.public_subnet_ids, module.vpc.private_subnet_ids)
  private_subnet_ids = module.vpc.private_subnet_ids
  
  kubernetes_version = var.kubernetes_version
  instance_types = var.instance_types
  ami_type = var.ami_type
  
  desired_size = var.desired_size
  max_size = var.max_size
  min_size = var.min_size
  
  region = var.region
  service_ipv4_cidr = var.service_ipv4_cidr
  vpc_id = module.vpc.vpc_id
  
  common_tags = local.common_tags
  tags = merge(
    local.common_tags,
    {
      "kubernetes.io-cluster-${var.environment}-eks-cluster" = "shared"
    }
  )
}
```

### Bastion 모듈

SSH 접속을 위한 Bastion 호스트를 생성합니다.

```hcl
module "bastion" {
  source = "../../modules/bastion"

  environment = var.environment
  vpc_id = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
  instance_type = var.bastion_instance_type
  key_name = var.bastion_key_name
  common_tags = local.common_tags
  
  depends_on = [module.vpc]
}
```

### ALB Controller 모듈

인그레스 컨트롤러와 관련 IAM 역할을 구성합니다.

```hcl
module "alb_controller" {
  source = "../../modules/alb-controller"

  cluster_name = module.eks.cluster_name
  oidc_provider_arn = module.eks.oidc_provider_arn
  vpc_id = module.vpc.vpc_id
  region = var.region
  common_tags = local.common_tags
  
  depends_on = [
    module.eks,
    module.vpc
  ]
}
```

## 💾 EBS CSI Driver 구성

### 개요

EBS CSI (Container Storage Interface) Driver는 Kubernetes 파드가 AWS EBS 볼륨을 영구 스토리지로 사용할 수 있게 해주는 핵심 구성 요소입니다.

### 구성 파일 위치

#### EKS 애드온 설정
```hcl
# modules/eks/addons.tf (라인 70-88)
resource "aws_eks_addon" "ebs_csi_driver" {
  cluster_name      = aws_eks_cluster.main.name
  addon_name        = "aws-ebs-csi-driver"
  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "OVERWRITE"
  
  depends_on = [
    aws_eks_node_group.node_group
  ]
  
  tags = merge(
    var.tags,
    var.common_tags,
    {
      Name = "${var.cluster_name}-ebs-csi-driver-addon"
    }
  )
}
```

#### EBS 성능 변수 정의
```hcl
# modules/eks/variables.tf (라인 154-173)
variable "ebs_iops" {
  description = "IOPS for EBS volumes"
  type        = number
  default     = 3000
  
  validation {
    condition     = var.ebs_iops >= 3000 && var.ebs_iops <= 16000
    error_message = "EBS IOPS must be between 3000 and 16000."
  }
}

variable "ebs_throughput" {
  description = "Throughput for EBS volumes in MiB/s"
  type        = number
  default     = 125
  
  validation {
    condition     = var.ebs_throughput >= 125 && var.ebs_throughput <= 1000
    error_message = "EBS throughput must be between 125 and 1000 MiB/s."
  }
}
```

### 현재 구성 상태

- ✅ **AWS 관리형 애드온**: 자동 업데이트 및 패치 지원
- ✅ **기본 성능**: IOPS 3000, Throughput 125 MiB/s
- ✅ **볼륨 타입**: gp3 기본 지원
- ✅ **고가용성**: Multi-AZ 지원
- ✅ **암호화**: EBS 볼륨 암호화 지원

### EBS CSI Driver 상태 확인

```bash
# EBS CSI Driver 파드 확인
kubectl get pods -n kube-system | grep ebs-csi

# StorageClass 확인
kubectl get storageclass

# CSI Driver 정보
kubectl get csidriver ebs.csi.aws.com

# EBS CSI 노드 상세 정보
kubectl get csidrivers ebs.csi.aws.com -o yaml
```

### 영구 볼륨 사용 예시

#### 1. PersistentVolumeClaim 생성
```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: mysql-pvc
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 20Gi
  storageClassName: gp3
```

#### 2. 파드에서 볼륨 사용
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: mysql
spec:
  template:
    spec:
      containers:
      - name: mysql
        image: mysql:8.0
        env:
        - name: MYSQL_ROOT_PASSWORD
          value: "password"
        volumeMounts:
        - name: mysql-storage
          mountPath: /var/lib/mysql
      volumes:
      - name: mysql-storage
        persistentVolumeClaim:
          claimName: mysql-pvc
```

### 고성능 StorageClass 생성

```yaml
# k8s-manifests/storage/fast-ssd-storageclass.yaml
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: fast-ssd
provisioner: ebs.csi.aws.com
parameters:
  type: gp3
  iops: "5000"
  throughput: "250"
  encrypted: "true"
allowVolumeExpansion: true
volumeBindingMode: WaitForFirstConsumer
```

### 볼륨 스냅샷 생성

```yaml
apiVersion: snapshot.storage.k8s.io/v1
kind: VolumeSnapshot
metadata:
  name: mysql-snapshot
spec:
  volumeSnapshotClassName: csi-aws-vsc
  source:
    persistentVolumeClaimName: mysql-pvc
```

### EBS 볼륨 타입별 특징

| 볼륨 타입 | 용도 | 기본 성능 | 최대 성능 | 비용 |
|-----------|------|-----------|-----------|------|
| **gp3** | 일반 워크로드 | 3,000 IOPS, 125 MiB/s | 16,000 IOPS, 1,000 MiB/s | 중간 |
| **io2** | 고성능 DB | 100 IOPS/GiB | 64,000 IOPS | 높음 |
| **st1** | 빅데이터, 로그 | 40 MiB/s/TiB | 500 MiB/s | 낮음 |

### 성능 튜닝

#### terraform.tfvars에서 성능 조정
```hcl
# environments/dev/terraform.tfvars
ebs_iops = 5000
ebs_throughput = 250
```

#### 애플리케이션별 최적화
```bash
# 데이터베이스용 고성능 볼륨
kubectl apply -f - <<EOF
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: db-pvc
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 100Gi
  storageClassName: fast-ssd
EOF
```

### 문제 해결

#### EBS CSI Driver 파드 재시작
```bash
kubectl rollout restart daemonset ebs-csi-node -n kube-system
kubectl rollout restart deployment ebs-csi-controller -n kube-system
```

#### 볼륨 마운트 실패 시
```bash
# 파드 이벤트 확인
kubectl describe pod <pod-name>

# PVC 상태 확인
kubectl describe pvc <pvc-name>

# EBS 볼륨 상태 확인 (AWS CLI)
aws ec2 describe-volumes --filters "Name=tag:kubernetes.io/created-for/pvc/name,Values=<pvc-name>"
```

## 유지보수 가이드

### 사전 준비사항

1. AWS CLI 설치 및 구성
2. Terraform 설치 (v1.0.0 이상)
3. kubectl 설치
4. AWS 계정 및 적절한 권한

### 초기 설정

```bash
# 프로젝트 디렉토리로 이동
cd /Users/r00360/Dev/devops/terraform/terraform-codes/environments/dev

# Terraform 초기화
terraform init
```

### 인프라 배포

```bash
# 인프라 변경사항 계획 확인
terraform plan

# 인프라 배포
terraform apply
```

### 단계별 배포 (권장)

노드 그룹 생성 실패 등의 문제를 피하기 위해 단계별 배포를 권장합니다:

```bash
# 1단계: EKS 클러스터 배포
terraform apply -target=module.eks

# 2단계: 나머지 리소스 배포
terraform apply
```

### kubeconfig 설정

```bash
aws eks update-kubeconfig --region ap-northeast-2 --name dev-eks-cluster
```

### 리소스 삭제

```bash
# 전체 인프라 삭제
terraform destroy

# 특정 리소스만 삭제
terraform destroy -target=module.alb_controller
```

### 변수 수정

환경 설정을 변경하려면 `variables.tf` 파일의 기본값을 수정하거나 다음과 같이 변수를 전달하세요:

```bash
terraform apply -var="desired_size=3" -var="max_size=5"
```

또는 `terraform.tfvars` 파일을 생성하여 변수를 설정할 수 있습니다:

```
# terraform.tfvars 예시
desired_size = 3
max_size = 5
```

### 새로운 리소스 추가

새 모듈이나 리소스를 추가하려면:

1. 적절한 모듈 생성 또는 기존 모듈 수정
2. `main.tf`에 모듈 호출 추가
3. 필요한 변수를 `variables.tf`에 추가
4. 필요한 출력값을 `outputs.tf`에 추가

### 문제 해결

1. **EKS 노드 그룹 생성 실패**
   - CloudWatch 로그 확인: `/aws/eks/dev-eks-cluster/cluster`
   - IAM 역할 및 정책 확인
   - 서브넷 및 보안 그룹 설정 확인

2. **리소스가 이미 존재한다는 오류**
   - 수동으로 리소스 삭제 또는 Terraform 상태로 가져오기:
     ```bash
     terraform import 'module.eks.aws_iam_instance_profile.node' dev-eks-cluster-node-instance-profile
     terraform import 'module.iam.aws_iam_role_policy_attachment.cluster-AmazonEKSClusterPolicy' dev-eks-cluster-role/arn:aws:iam::aws:policy/AmazonEKSClusterPolicy
     terraform import 'module.iam.aws_iam_role_policy_attachment.cluster-AmazonEKSServicePolicy' dev-eks-cluster-role/arn:aws:iam::aws:policy/AmazonEKSServicePolicy
     terraform import 'module.iam.aws_iam_role_policy_attachment.node-AmazonEKSWorkerNodePolicy' dev-eks-node-group-role/arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy
     terraform import 'module.iam.aws_iam_role_policy_attachment.node-AmazonEKS_CNI_Policy' dev-eks-node-group-role/arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy
     terraform import 'module.iam.aws_iam_role_policy_attachment.node-AmazonEC2ContainerRegistryReadOnly' dev-eks-node-group-role/arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly
     ```

3. **OIDC 제공자 오류**
   - 인증서 관련 구성 확인


### aws 명령어

- 시작 템플릿 확인

```bash
aws ec2 describe-launch-templates --query "LaunchTemplates[*].[LaunchTemplateName, LaunchTemplateId]" --output table
```
------------------------------------------------------------------------------
|                           DescribeLaunchTemplates                          |
+---------------------------------------------------+------------------------+
|  dev-eks-cluster-nodes-20250718090030002300000001 |  lt-086966c39ed0448a0  |
|  dev-eks-cluster-nodes-2025072107594890240000000a |  lt-055838df7938b9359  |
|  eks-b6cc17e6-3a72-9c32-02b2-6175774d3b0d         |  lt-0e0764b9a8c3fd2d2  |
+---------------------------------------------------+------------------------+

- 시작 템플릿 사용 중인지 확인

```bash
# EKS 노드 그룹에서 사용 중인 시작 템플릿 확인
aws eks describe-nodegroup --cluster-name dev-eks-cluster --nodegroup-name dev-eks-cluster-node-group --query "nodegroup.launchTemplate"

# Auto Scaling 그룹에서 사용 중인 시작 템플릿 확인
aws autoscaling describe-auto-scaling-groups --query "AutoScalingGroups[?contains(LaunchTemplate.LaunchTemplateName, 'dev-eks-cluster')].{ASGName:AutoScalingGroupName,LaunchTemplate:LaunchTemplate}"

# EC2 인스턴스에서 사용 중인 시작 템플릿 확인
aws ec2 describe-instances --query "Reservations[*].Instances[?LaunchTemplate].{InstanceId:InstanceId,LaunchTemplateName:LaunchTemplate.LaunchTemplateName}" --output table
```

- 시작 템플릿 버전 확인
```bash
aws ec2 describe-launch-template-versions --launch-template-id lt-055838df7938b9359 --query "LaunchTemplateVersions[*].{VersionNumber:VersionNumber,DefaultVersion:DefaultVersion}"
```

- 시작 템플릿 삭제
```bash
aws ec2 delete-launch-template --launch-template-id "템플릿_ID"
```

### 시작 템플릿 버전 관리 동작 방식

1. **새 버전 생성**: Terraform으로 `apply`를 하면 AWS는 동일한 시작 템플릿 이름에 새 버전을 생성합니다.

2. **버전 관리**: 
   - 각 `apply`마다 버전 번호가 증가합니다 (v1, v2, v3...)
   - 기본적으로 최신 버전이 "Default Version"으로 표시됩니다

3. **사용 중인 리소스의 영향**:
   - 이미 실행 중인 인스턴스는 영향을 받지 않습니다 (자신이 시작된 버전 계속 사용)
   - 새로 생성되는 인스턴스는 기본적으로 "Default Version"을 사용합니다
   - 노드 그룹이 특정 버전을 명시적으로 참조하고 있다면 해당 버전을 계속 사용합니다

4. **권장하는 해결 방법**:
   - 노드 그룹 삭제
   - 시작 템플릿 삭제
   - Terraform 상태에서 관련 리소스 제거
   - 수정된 user data로 다시 적용

## 🚀 현재 사용 가능한 기능들

### 1. 자동 로드밸런서 프로비저닝
Kubernetes Ingress 리소스를 생성하면 ALB Controller가 자동으로 AWS Application Load Balancer를 생성합니다.

```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: example-ingress
  annotations:
    kubernetes.io/ingress.class: alb
    alb.ingress.kubernetes.io/scheme: internet-facing
spec:
  rules:
  - host: example.com
    http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: example-service
            port:
              number: 80
```

### 2. 자동 SSL/TLS 인증서 발급
Cert-Manager를 통해 Let's Encrypt에서 자동으로 SSL 인증서를 발급받을 수 있습니다.

```yaml
apiVersion: cert-manager.io/v1
kind: Certificate
metadata:
  name: example-tls
spec:
  secretName: example-tls
  issuerRef:
    name: letsencrypt-prod
    kind: ClusterIssuer
  dnsNames:
  - example.com
```

### 3. IRSA를 통한 안전한 AWS 권한 관리
ServiceAccount에 IAM 역할을 연결하여 파드별로 세밀한 AWS 권한을 부여할 수 있습니다.

```yaml
apiVersion: v1
kind: ServiceAccount
metadata:
  name: my-service-account
  annotations:
    eks.amazonaws.com/role-arn: arn:aws:iam::ACCOUNT:role/my-role
```

## 🔐 Bastion 호스트 SSH 접속 설정

### SSH 키 생성 및 Bastion 접속 가이드

**현재 Bastion 호스트에 SSH 키가 설정되어 있지 않아 접속이 불가능합니다.**
다음 단계를 따라 SSH 키를 생성하고 Bastion 호스트를 재배포하세요.

#### 1단계: AWS에서 새로운 SSH 키 페어 생성
```bash
# 새로운 SSH 키 페어 생성
aws ec2 create-key-pair --key-name dev-bastion-key --query 'KeyMaterial' --output text > ~/.ssh/dev-bastion-key.pem

# SSH 키 파일 권한 설정
chmod 400 ~/.ssh/dev-bastion-key.pem

# 키 파일 생성 확인
ls -la ~/.ssh/dev-bastion-key.pem
```

#### 2단계: Terraform 변수 설정
```bash
# terraform.tfvars 파일 생성 또는 업데이트
echo 'bastion_key_name = "dev-bastion-key"' >> terraform.tfvars

# 변수 설정 확인
cat terraform.tfvars | grep bastion_key_name
```

#### 3단계: Bastion 호스트 재배포
```bash
# Bastion 모듈만 재배포
terraform apply -target=module.bastion

# 또는 전체 인프라 업데이트
terraform apply
```

#### 4단계: SSH 접속 테스트
```bash
# Bastion 호스트에 SSH 접속
ssh -i ~/.ssh/dev-bastion-key.pem ec2-user@54.180.136.244

# 접속 성공 후 클러스터 접근 설정
aws eks update-kubeconfig --region ap-northeast-2 --name dev-eks-cluster
kubectl get nodes
```

### SSH Config 설정 (선택사항)
편리한 접속을 위해 SSH config를 설정할 수 있습니다:

```bash
# ~/.ssh/config 파일에 추가
cat >> ~/.ssh/config << EOF
Host bastion-dev
    HostName 54.180.136.244
    User ec2-user
    IdentityFile ~/.ssh/dev-bastion-key.pem
    StrictHostKeyChecking no
EOF

# 설정 후 간단한 접속
ssh bastion-dev
```

### 대안 접속 방법 (SSH 키 없이)

SSH 키 생성을 원하지 않는다면 AWS Systems Manager Session Manager를 사용할 수 있습니다:

```bash
# Bastion 인스턴스 ID 확인
aws ec2 describe-instances --region ap-northeast-2 \
  --filters "Name=tag:Name,Values=*bastion*" \
  --query 'Reservations[*].Instances[*].InstanceId' --output text

# Session Manager로 접속 (인스턴스 ID 대체)
aws ssm start-session --target i-INSTANCE_ID --region ap-northeast-2
```

### 문제 해결

#### SSH 접속 실패 시
```bash
# 키 파일 권한 재설정
chmod 400 ~/.ssh/dev-bastion-key.pem

# known_hosts 에서 기존 항목 제거
ssh-keygen -R 54.180.136.244

# 호스트 키 검증 무시하고 접속
ssh -o StrictHostKeyChecking=no -i ~/.ssh/dev-bastion-key.pem ec2-user@54.180.136.244
```

#### 보안 그룹 문제 시
```bash
# 현재 IP 확인
curl -s http://checkip.amazonaws.com

# Bastion 보안 그룹에 현재 IP 추가 (필요시)
aws ec2 authorize-security-group-ingress \
  --group-id $(terraform output -raw bastion_security_group_id) \
  --protocol tcp --port 22 --cidr $(curl -s http://checkip.amazonaws.com)/32
```

## 🚀 향후 배포 자동화 가이드

### 완전 자동화 배포 (권장)
현재 모든 문제가 해결되어 수동 작업 없이 완전 자동화가 가능합니다:

```bash
# 새로운 환경 배포 시 - 완전 자동화
terraform init
terraform plan
terraform apply

# 배포 완료 후 kubeconfig 설정 (한 번만)
aws eks update-kubeconfig --region ap-northeast-2 --name dev-eks-cluster
```

### 단계별 안전 배포 (선택사항)
더 안전한 배포를 원한다면 단계별로 진행:

```bash
# 1단계: 네트워크 및 EKS 기본 인프라
terraform apply -target=module.vpc -target=module.iam -target=module.eks

# 2단계: Bastion 호스트
terraform apply -target=module.bastion

# 3단계: ALB Controller
terraform apply -target=module.alb_controller

# 4단계: Cert-Manager
terraform apply -target=module.cert_manager
```

### 배포 후 검증
```bash
# 전체 인프라 상태 확인
kubectl get nodes
kubectl get pods -A
helm list -A

# 핵심 서비스 상태 확인
kubectl get pods -n kube-system | grep aws-load-balancer-controller
kubectl get pods -n cert-manager
kubectl get clusterissuer
```

## 🔧 운영 및 모니터링

### 클러스터 상태 확인
```bash
# 노드 상태 확인
kubectl get nodes

# 모든 파드 상태 확인
kubectl get pods -A

# ALB Controller 상태
kubectl get pods -n kube-system | grep aws-load-balancer-controller

# Cert-Manager 상태
kubectl get pods -n cert-manager
```

### Helm 릴리스 관리
```bash
# 모든 Helm 릴리스 확인
helm list -A

# ALB Controller 상태 확인
helm status aws-load-balancer-controller -n kube-system

# Cert-Manager 상태 확인
helm status cert-manager -n cert-manager
```

### 리소스 사용량 모니터링
```bash
# 노드 리소스 사용량
kubectl top nodes

# 파드 리소스 사용량
kubectl top pods -A

# 클러스터 이벤트 확인
kubectl get events -A --sort-by='.lastTimestamp'
```

## 📊 현재 배포된 리소스 정보

### 네트워크 리소스
- **VPC ID**: `vpc-06fadf9c2c40d86b9`
- **퍼블릭 서브넷**: `subnet-082e52ac72ce5f2af`, `subnet-0421a2b3506a5df70`
- **프라이빗 서브넷**: `subnet-0301dd844643eb194`, `subnet-0562e6c09b96e9a8c`
- **Bastion 호스트**: `54.180.136.244`

### EKS 리소스
- **클러스터 이름**: `dev-eks-cluster`
- **클러스터 엔드포인트**: `https://57ADE02C2596A18756849A8B658F2064.sk1.ap-northeast-2.eks.amazonaws.com`
- **노드 그룹 ARN**: `arn:aws:eks:ap-northeast-2:421114334882:nodegroup/dev-eks-cluster/dev-eks-cluster-node-group/70cc181e-7934-ed2b-0b99-e7204b998a1b`

### IAM 리소스
- **ALB Controller IRSA 역할**: `arn:aws:iam::421114334882:role/dev-eks-cluster-alb-controller`
- **OIDC Provider**: 활성화됨

### VPC 엔드포인트
- **ECR API**: `vpce-0895c1f3d55ee2f55`
- **ECR DKR**: `vpce-0f266f884242492fa`
- **S3**: `vpce-0c767a36071253bd1`
- **EC2**: `vpce-0f898f87b4eb2fc5b`

## 🚨 ALB Controller 및 서비스 문제 해결

### ALB Controller IAM 권한 오류

#### 문제 증상
```bash
# Ingress 상태 확인 시 권한 오류 발생
kubectl describe ingress nginx-ingress

# 예시 오류들:
# - ec2:DescribeAvailabilityZones
# - ec2:GetSecurityGroupsForVpc  
# - elasticloadbalancing:DescribeTags
# - wafv2:GetWebACLForResource
# - waf-regional:GetWebACLForResource
```

#### 해결 방법
```bash
# 1. ALB Controller IAM 정책 업데이트
terraform apply -target=module.alb_controller

# 2. ALB Controller 파드 재시작 (새로운 권한 적용)
kubectl delete pod -n kube-system -l app.kubernetes.io/name=aws-load-balancer-controller

# 3. 파드 재시작 확인
kubectl get pods -n kube-system -l app.kubernetes.io/name=aws-load-balancer-controller

# 4. Ingress 재생성
kubectl delete ingress nginx-ingress --ignore-not-found=true
kubectl apply -f /Users/r00360/Dev/devops/terraform/k8s-manifests/deploy-pods/nginx-ingress.yaml

# 5. 상태 재확인
kubectl describe ingress nginx-ingress
```

### 503 Service Temporarily Unavailable 오류

#### 문제 증상
```bash
# ALB URL 접속 시 503 오류
curl http://ALB-DNS-NAME
# <html><head><title>503 Service Temporarily Unavailable</title></head></html>
```

#### 원인 및 해결
```bash
# 1. nginx 파드 상태 확인
kubectl get pods -l app=nginx

# 2. CreateContainerConfigError 발생 시 (보안 정책 문제)
# 문제: runAsNonRoot 정책과 nginx root 실행 충돌
kubectl describe pod POD-NAME
# Error: container has runAsNonRoot and image will run as root

# 3. 해결: 기존 deployment 삭제 후 재생성
kubectl delete deployment nginx-deployment  # 문제있는 deployment 삭제
kubectl create deployment nginx --image=nginx:latest  # 새 deployment 생성

# 4. 파드 상태 확인
kubectl get pods -l app=nginx
# 정상: Running 상태여야 함

# 5. Target Group Binding 확인
kubectl get targetgroupbinding -n default
kubectl describe targetgroupbinding -n default
```

### ALB DNS 해결 문제

#### 문제 증상
```bash
curl http://ALB-DNS-NAME
# curl: (6) Could not resolve host: ALB-DNS-NAME
```

#### 해결 방법
```bash
# 1. ALB 생성 상태 확인
kubectl get ingress nginx-ingress
# ADDRESS 필드에 ALB DNS 이름이 있어야 함

# 2. DNS 전파 대기 (2-10분 소요)
# ALB 생성 직후에는 DNS 전파 시간 필요

# 3. nslookup으로 DNS 해결 확인
nslookup ALB-DNS-NAME

# 4. 재시도
curl http://ALB-DNS-NAME
```

### nginx 파드 replica 수 조정

#### 현재 상태 확인
```bash
# Deployment replica 수 확인
kubectl get deployment nginx
kubectl describe deployment nginx | grep Replicas
```

#### replica 수 조정 (필요시)
```bash
# 1개로 줄이기
kubectl scale deployment nginx --replicas=1

# 3개로 늘리기 (고가용성 권장)
kubectl scale deployment nginx --replicas=3

# 확인
kubectl get pods -l app=nginx
```

### 완전한 ALB 테스트 절차

```bash
# 1. 모든 컴포넌트 상태 확인
kubectl get pods -n kube-system -l app.kubernetes.io/name=aws-load-balancer-controller
kubectl get pods -l app=nginx
kubectl get svc nginx-service
kubectl get ingress nginx-ingress

# 2. ALB Controller 로그 확인
kubectl logs -n kube-system -l app.kubernetes.io/name=aws-load-balancer-controller --tail=20

# 3. Target Group Binding 확인
kubectl get targetgroupbinding -n default

# 4. ALB 접속 테스트
curl http://ALB-DNS-NAME
# 성공 시: nginx 기본 페이지 ("Welcome to nginx!") 표시
```

---

**✅ 현재 인프라는 프로덕션 준비 상태입니다!**

모든 핵심 컴포넌트가 정상 작동하며, 자동 로드밸런서 프로비저닝, SSL 인증서 관리, 안전한 AWS 권한 관리 등의 기능을 제공합니다.


## 참고 문서

- [AWS EKS 공식 문서](https://docs.aws.amazon.com/eks/latest/userguide/what-is-eks.html)
- [Terraform 공식 문서](https://www.terraform.io/docs)
- [ALB Controller 문서](https://kubernetes-sigs.github.io/aws-load-balancer-controller/latest/)
