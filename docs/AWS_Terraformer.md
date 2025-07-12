# AWS Terraformer

## Terraformer란 무엇인가?

Terraformer는 이미 AWS, Google Cloud, Azure 등 클라우드 제공업체에 배포되어 있는 기존 리소스(예: EC2 인스턴스, S3 버킷, VPC 등)를 Terraform 코드로 자동으로 가져오는(import) 도구입니다.

클라우드 환경의 현재 상태를 스캔하여 해당 상태를 나타내는 Terraform HCL(HashiCorp Configuration Language) 코드를 생성합니다.

## Terraformer를 사용하는 이유

Terraformer를 사용하는 주된 이유는 다음과 같습니다:

1.  **기존 인프라의 코드화**: 이미 수동으로 또는 다른 방법으로 구축된 클라우드 인프라를 Terraform으로 관리하고 싶을 때 유용합니다. Terraformer를 사용하면 현재 상태의 인프라를 Terraform 코드로 생성하여, 이후부터는 코드로 인프라를 관리할 수 있게 됩니다.
2.  **IaC(Infrastructure as Code) 도입 가속화**: 처음부터 모든 인프라를 코드로 작성하는 것은 시간이 많이 소요될 수 있습니다. Terraformer는 시작점을 제공하여 IaC 도입 과정을 빠르게 진행할 수 있도록 돕습니다.
3.  **문서화 및 가시성 확보**: 현재 클라우드 환경에 어떤 리소스가 배포되어 있는지 코드를 통해 파악할 수 있게 되어, 인프라의 현재 상태를 문서화하고 가시성을 확보하는 데 도움이 됩니다.

## 사용 예제 및 자주 사용하는 명령어 (AWS 기준)

Terraformer 명령어는 일반적으로 `terraformer import` 명령어를 사용하며, 가져올 클라우드 제공업체, 서비스, 리전 등을 지정합니다.

## MAC OS 설치 방법

Homebrew를 사용하여 Terraformer를 설치할 수 있습니다.

```bash
brew install terraformer
```

### 기본 사용법

```bash
terraformer import <provider> --resources <resource_type1,resource_type2,...> --regions <region1,region2,...>
```

### AWS 리소스 가져오기 예제

#### 특정 리전의 모든 EC2 인스턴스 가져오기

```bash
terraformer import aws --resources ec2_instance --regions ap-northeast-2
```

#### 특정 리전의 모든 VPC 및 서브넷 가져오기

```bash
terraformer import aws --resources vpc,subnet --regions ap-northeast-2
```

#### 특정 리전의 모든 S3 버킷 가져오기

```bash
terraformer import aws --resources s3 --regions ap-northeast-2
```

#### 여러 리전에서 여러 종류의 리소스 가져오기

```bash
terraformer import aws --resources vpc,subnet,ec2_instance,s3 --regions us-east-1,ap-northeast-2
```

#### 모든 지원 리소스 가져오기 (주의: 시간이 오래 걸리고 많은 코드를 생성할 수 있습니다)

```bash
terraformer import aws --resources all --regions ap-northeast-2
```

### 추가 옵션

*   `--path-pattern`: 생성될 파일의 경로 형식을 지정합니다.
*   `--output`: 출력을 파일 대신 표준 출력으로 보냅니다.
*   `--filter`: 특정 태그, ID 등으로 리소스를 필터링합니다.

Terraformer 사용 전, AWS 자격 증명 및 기본 설정이 완료되어 있어야 합니다. (예: `aws configure`)

Terraformer 실행 후 생성된 `.tf` 파일들을 확인하고, 필요한 경우 수동으로 코드를 정리하거나 수정하여 Terraform 프로젝트에 통합할 수 있습니다.
