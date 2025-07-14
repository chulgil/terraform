# AWS 인프라를 코드로 관리하기: Terracognita

Terracognita는 기존 AWS 인프라를 Terraform 구성 파일로 가져오는 강력한 도구입니다. 여러 가지 이유로 Terraformer보다 나은 대안으로 여겨지고 있습니다.

## 목차
- [Terracognita를 선택해야 하는 이유](#terracognita를-선택해야-하는-이유)
- [설치](#설치)
- [기본 사용법](#기본-사용법)
- [고급 기능](#고급-기능)
- [Terraformer와의 비교](#terraformer와의-비교)
- [모범 사례](#모범-사례)
- [문제 해결](#문제-해결)

## Terracognita를 선택해야 하는 이유

Terracognita는 다른 유사한 도구들에 비해 다음과 같은 장점을 제공합니다:

1. **더 깔끔한 HCL 생성**: 가독성과 유지보수성이 뛰어난 코드 생성
2. **자동 의존성 해결**: 리소스 간 의존성을 자동으로 처리
3. **모듈화 지원**: 모듈 기반 구조 생성 가능
4. **직관적인 명령어**: 더 간단하고 일관된 명령어 구조
5. **향상된 필터링**: 더 유연한 리소스 필터링 옵션

## 설치

### 필수 조건
- Go 1.17+ (소스에서 빌드할 경우)
- Terraform 0.12 이상
- AWS 자격 증명 설정 완료

### macOS (Homebrew 사용)
```bash
brew install terracognita
```

### 리눅스/윈도우
```bash
# GitHub에서 최신 릴리즈 다운로드
# https://github.com/cycloidio/terracognita/releases

# 리눅스의 경우
tar -xzf terracognita-linux-amd64.tar.gz -C /usr/local/bin terracognita

# 윈도우의 경우
# zip 파일을 압축 해제하고 PATH에 추가
```

## 기본 사용법

### 모든 리소스 가져오기
```bash
terracognita aws --hcl output/ \
  --aws-default-region ap-northeast-2 \
  --aws-profile default
```

### 특정 리소스만 가져오기
```bash
terracognita aws --hcl output/ \
  --aws-default-region ap-northeast-2 \
  --resources aws_vpc,aws_subnet,aws_security_group
```

### 모듈 구조로 생성하기
```bash
terracognita aws --module output/ \
  --aws-default-region ap-northeast-2 \
  --module-name my-infrastructure
```

## 고급 기능

### 리소스 필터링
```bash
# 특정 태그가 있는 리소스만 가져오기
terracognita aws --hcl output/ \
  --aws-default-region ap-northeast-2 \
  --filter "Tags['Environment']=='production'"

# 리소스 유형별로 가져오기
terracognita aws --hcl output/ \
  --aws-default-region ap-northeast-2 \
  --filter "Type=='aws_vpc' || Type=='aws_subnet'"
```

### 상태 가져오기
Terraform 상태 가져오기 명령어 생성:
```bash
terracognita aws --import-commands import_commands.sh \
  --aws-default-region ap-northeast-2
```

### AWS 프로필 사용하기
```bash
terracognita aws --hcl output/ \
  --aws-default-region ap-northeast-2 \
  --aws-profile my-profile \
  --aws-shared-credentials-file ~/.aws/credentials
```

## Terraformer와의 비교

| 기능                | Terracognita | Terraformer |
|---------------------|--------------|-------------|
| HCL 출력 품질      | ⭐⭐⭐⭐⭐      | ⭐⭐⭐        |
| 의존성 해결        | ⭐⭐⭐⭐⭐      | ⭐⭐⭐        |
| 사용 편의성        | ⭐⭐⭐⭐⭐      | ⭐⭐⭐⭐      |
| 리소스 필터링      | ⭐⭐⭐⭐⭐      | ⭐⭐⭐        |
| 모듈 지원          | ⭐⭐⭐⭐⭐      | ⭐⭐          |
| 커뮤니티 & 지원    | ⭐⭐⭐         | ⭐⭐⭐⭐⭐     |

## 모범 사례

1. **작게 시작하기**: 모든 것을 한 번에 가져오기 전에 소량의 리소스부터 시작하세요
2. **필터 사용하기**: 불필요한 가져오기를 피하기 위해 항상 필터를 사용하세요
3. **생성된 코드 검토**: 적용하기 전에 항상 생성된 HCL을 검토하세요
4. **버전 관리**: 구성을 버전 관리 시스템에 커밋하세요
5. **모듈화**: 더 나은 구성을 위해 모듈 기능을 사용하세요

## 문제 해결

### 일반적인 문제

1. **권한 부족**
   - AWS 자격 증명에 충분한 권한이 있는지 확인하세요
   - 관리자 권한이 있는 프로필을 지정하려면 `--aws-profile`을 사용하세요

2. **요청 제한**
   ```bash
   # API 호출을 제한하기 위해 다음 플래그를 추가하세요
   --aws-max-retries 10 \
   --aws-http-timeout 60
   ```

3. **의존성 오류**
   - 리소스를 더 작은 배치로 가져와 보세요
   - 직접 가져오는 대신 `--import` 플래그를 사용하여 가져오기 명령을 생성하세요

### 도움 받기

- [GitHub 이슈](https://github.com/cycloidio/terracognita/issues)
- [공식 문서](https://github.com/cycloidio/terracognita#readme)
- [Cycloid 커뮤니티](https://discuss.cycloid.io/)

## 예제 워크플로우

1. **초기 가져오기**
   ```bash
   mkdir -p terraform/aws && cd terraform/aws
   terracognita aws --hcl . --module infrastructure \
     --aws-default-region ap-northeast-2 \
     --aws-profile production
   ```

2. **검토 및 편집**
   - 생성된 `*.tf` 파일 검토
   - 필요에 따라 리소스를 모듈로 구성
   - 변수와 출력값 추가

3. **초기화 및 계획**
   ```bash
   terraform init
   terraform plan
   ```

4. **변경사항 적용**
   ```bash
   terraform apply
   ```

## 실습 예제: 기존 리소스 가져오기 및 새 서브넷 추가하기

이 섹션에서는 Terracognita를 사용하여 기존 VPC 리소스를 가져오고 새 서브넷을 추가하는 전체 과정을 단계별로 안내합니다.

### 1단계: Terracognita 설치하기

```bash
# Homebrew를 사용한 설치 (macOS)
brew install terracognita

# 설치 확인
terracognita --version
```

### 2단계: AWS 자격 증명 설정

```bash
# 환경 변수로 AWS 자격 증명 설정
export AWS_ACCESS_KEY_ID="여러분의_액세스_키"
export AWS_SECRET_ACCESS_KEY="여러분의_시크릿_키"
export AWS_DEFAULT_REGION="ap-northeast-2"

# AWS 접근 확인
aws sts get-caller-identity
```

### 3단계: 기존 VPC와 서브넷 가져오기

```bash
# Terraform 설정을 위한 디렉토리 생성
mkdir -p ~/terraform-import && cd ~/terraform-import

# Terracognita로 VPC와 서브넷 가져오기
terracognita aws --hcl . \
  --include aws_vpc,aws_subnet,aws_route_table,aws_internet_gateway \
  --aws-default-region ap-northeast-2 \
  --aws-profile default

# 현재 디렉토리에 .tf 파일들이 생성됩니다
```

### 4단계: 생성된 파일 확인 및 정리

```bash
# 생성된 파일 목록 확인
ls -la

# 일반적인 출력:
# - vpc_virtual_private_cloud.tf
# - route_tables.tf
# - provider.tf
# - outputs.tf
```

### 5단계: Terraform 초기화

```bash
# Terraform 초기화
terraform init

# 현재 상태 확인
terraform state list
```

### 6단계: 새 서브넷 추가하기

`vpc_virtual_private_cloud.tf` 파일을 열어 새 서브넷을 추가합니다:

```hcl
# 기존 설정에 다음 내용 추가
resource "aws_subnet" "new_public_subnet_2c" {
  vpc_id                  = aws_vpc.your_vpc.id
  cidr_block             = "10.0.48.0/20"  # 사용 중이지 않은 CIDR 블록 선택
  availability_zone       = "ap-northeast-2c"
  map_public_ip_on_launch = true

  tags = {
    Name = "new-public-subnet-2c"
    "kubernetes.io/cluster/your-cluster-name" = "shared"  # EKS 사용 시
  }
}

# 새 서브넷을 라우트 테이블에 연결 (필요한 경우)
resource "aws_route_table_association" "new_subnet_association" {
  subnet_id      = aws_subnet.new_public_subnet_2c.id
  route_table_id = aws_route_table.public_route_table.id
}
```

### 7단계: 변경 사항 계획 및 적용

```bash
# 변경될 내용 확인
terraform plan

# 변경 사항 적용
terraform apply

# 새 서브넷 생성 확인
aws ec2 describe-subnets --filters "Name=tag:Name,Values=new-public-subnet-2c"
```

### 8단계: 인프라 업데이트 (NAT Gateway 추가 예제)

```hcl
# 새 서브넷에 NAT Gateway 추가
resource "aws_eip" "nat" {
  vpc = true
}

resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.new_public_subnet_2c.id
  
  tags = {
    Name = "nat-gw-new-subnet"
  }
}

# 프라이빗 라우트 테이블이 새 NAT Gateway를 사용하도록 업데이트
resource "aws_route" "private_nat_route" {
  route_table_id         = aws_route_table.private_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_gw.id
}
```

### 9단계: 정리 (완료 시)

```bash
# 새로 생성된 리소스만 삭제
terraform destroy -target=aws_nat_gateway.nat_gw
terraform destroy -target=aws_subnet.new_public_subnet_2c

# 또는 모든 리소스 삭제 (주의!)
# terraform destroy
```

## 프로덕션 환경을 위한 모범 사례

1. **버전 관리**
   ```bash
   git init
   echo ".terraform/" > .gitignore
   echo "*.tfstate*" >> .gitignore
   git add .
   git commit -m "Terraform 설정 초기화"
   ```

2. **원격 상태 관리**
   ```hcl
   # backend.tf
   terraform {
     backend "s3" {
       bucket = "여러분의-terraform-state-버킷"
       key    = "production/network/terraform.tfstate"
       region = "ap-northeast-2"
     }
   }
   ```

3. **작업 공간(Workspace) 사용**
   ```bash
   # 환경별 작업 공간 생성
   terraform workspace new dev
   terraform workspace new prod
   ```

## 자주 발생하는 문제 및 해결 방법

### 문제: "InvalidClientTokenId"
- AWS 자격 증명 확인
- 세션 만료 여부 확인 (MFA 사용 시 특히 중요)
- IAM 사용자에게 필요한 권한이 있는지 확인

### 문제: "리소스 가져오기 오류"
- 리소스를 작은 단위로 나누어 가져오기 시도
- `--target` 플래그를 사용하여 특정 리소스만 가져오기
- Terracognita 로그 파일 확인: `~/Library/Caches/terracognita/terracognita.log`

## Conclusion

Terracognita provides a robust way to import existing AWS infrastructure into Terraform configurations. Its focus on clean HCL generation and dependency management makes it an excellent choice for infrastructure as code workflows.
