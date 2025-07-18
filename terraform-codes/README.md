# Production-level AWS EKS Terraform

이 코드는 프로덕션 환경의 AWS EKS 인프라를 모듈화하여 유지보수와 확장성이 뛰어나도록 설계되었습니다.

## 디렉토리 구조

```
.
├── modules/                  # 재사용 가능한 모듈들
│   ├── vpc/                 # VPC 관련 리소스
│   ├── eks/                 # EKS 클러스터 관련 리소스
│   └── iam/                 # IAM 역할 및 정책
├── environments/            # 환경별 구성
│   ├── dev/                 # 개발 환경
│   └── prod/                # 프로덕션 환경
└── scripts/                 # 유틸리티 스크립트
```

## 시작하기

### 전제 조건

1. AWS 계정 및 자격 증명 설정
2. Terraform 1.0.0 이상 설치
3. AWS CLI 설치 및 구성

### 사용 방법

1. 원하는 환경(dev/prod)으로 이동합니다:
   ```bash
   cd environments/dev  # 또는 cd environments/prod
   ```

2. `terraform.tfvars.example` 파일을 복사하여 `terraform.tfvars` 파일을 생성하고 필요한 값을 설정합니다:
   ```bash
   cp terraform.tfvars.example terraform.tfvars
   # 파일을 열어 필요한 값들을 설정하세요
   ```

3. Terraform 초기화:
   ```bash
   terraform init
   ```

4. 실행 계획 확인:
   ```bash
   terraform plan
   ```

5. 인프라 배포:
   ```bash
   terraform apply
   ```

6. (필요시) 인프라 제거:
   ```bash
   terraform destroy
   ```

## 스크립트 사용법

### 배포 스크립트 (`scripts/deploy.sh`)

개발 또는 프로덕션 환경에 인프라를 배포합니다.

```bash
# 개발 환경 배포
./scripts/deploy.sh dev

# 프로덕션 환경 배포
./scripts/deploy.sh prod
```

### 제거 스크립트 (`scripts/destroy.sh`)

특정 환경의 모든 리소스를 제거합니다.

```bash
# 개발 환경 제거
./scripts/destroy.sh dev

# 프로덕션 환경 제거
./scripts/destroy.sh prod
```

### 테스트 스크립트 (`scripts/test.sh`)

Terraform 구성의 유효성을 검사하고 린트를 실행합니다.

```bash
# 개발 환경 테스트
./scripts/test.sh dev

# 프로덕션 환경 테스트
./scripts/test.sh prod
```

### 정리 스크립트 (`scripts/clean.sh`)

테라폼 환경을 정리하고 초기화합니다. 상태 파일이나 캐시 문제가 있을 때 유용합니다.

```bash
# 개발 환경 정리 및 초기화 (확인 단계 포함)
./scripts/clean.sh dev

# 프로덕션 환경 강제 정리 (확인 없이 진행)
./scripts/clean.sh prod --force
```

## 모듈 설명

### VPC 모듈
- VPC 생성
- 퍼블릭/프라이빗 서브넷 구성
- 인터넷 게이트웨이 및 NAT 게이트웨이 설정

### EKS 모듈
- EKS 클러스터 생성
- 노드 그룹 구성
- Kubernetes API 엔드포인트 설정

### IAM 모듈
- EKS 클러스터 및 노드 그룹을 위한 IAM 역할 생성
- 필요한 정책 연결

## 모범 사례

1. **버전 관리**
   - 항상 `terraform.tfvars` 파일을 제외하고 커밋하세요.
   - `.gitignore` 파일이 올바르게 설정되어 있는지 확인하세요.

2. **작업 흐름**
   ```bash
   # 1. 코드 변경
   # 2. 테스트 실행
   ./scripts/test.sh dev
   
   # 3. 계획 확인
   cd environments/dev
   terraform plan -out=tfplan
   
   # 4. 적용
   terraform apply tfplan
   ```

3. **협업**
   - 항상 최신 상태를 pull 받고 작업을 시작하세요.
   - 변경 사항은 작은 단위로 나누어 커밋하세요.
   - Pull Request를 통해 코드 리뷰를 진행하세요.

## 문제 해결

### 일반적인 문제

1. **인증 오류**
   ```bash
   Error: error configuring Terraform AWS Provider: no valid credential sources found
   ```
   - AWS 자격 증명이 올바르게 설정되었는지 확인하세요.
   - `aws configure` 명령어로 자격 증명을 설정하거나 환경 변수를 설정하세요.

2. **상태 잠금 오류**
   ```bash
   Error: Error acquiring the state lock
   ```
   - 다른 프로세스가 Terraform을 실행 중인지 확인하세요.
   - 필요시 상태 잠금을 강제로 해제하세요:
     ```bash
     terraform force-unlock LOCK_ID
     ```

3. **리소스 제거 문제**
   - 리소스가 제대로 삭제되지 않으면 수동으로 삭제한 후 상태를 새로고침하세요:
     ```bash
     terraform state rm aws_instance.example
     ```

## 추가 리소스

- [Terraform 공식 문서](https://www.terraform.io/docs/index.html)
- [AWS 공급자 문서](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [EKS 모듈 문서](https://registry.terraform.io/modules/terraform-aws-modules/eks/aws/latest)

## 기존 리소스 가져오기 (레거시)

```bash
# EKS 클러스터 IAM 역할 가져오기
terraform import aws_iam_role.test-iam-role-eks-cluster test-iam-role-eks-cluster

# EKS 노드그룹 IAM 역할 가져오기
terraform import aws_iam_role.test-iam-role-eks-nodegroup test-iam-role-eks-nodegroup

# VPC ID 확인
aws ec2 describe-vpcs --query "Vpcs[].VpcId" --output text

# 보안 그룹 ID 확인
aws ec2 describe-security-groups \
  --filters Name=vpc-id,Values=vpc-004e1194bb2f6b0c0 \
  --query "SecurityGroups[?GroupName=='test-sg-eks-cluster'].GroupId" \
  --output text

# 보안 그룹 가져오기
terraform import aws_security_group.test-sg-eks-cluster sg-xxxxxxxx

# 상태 확인
terraform state list
```
