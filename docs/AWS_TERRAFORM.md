## AWS Terraform 설치방법


### MAC OS

```bash

# 1. HashiCorp tap 추가
brew tap hashicorp/tap

# 2. Terraform 설치
brew install hashicorp/tap/terraform

```

### 기본 명령어

```bash

# 1. 초기화
terraform init

# 2. 프로비저닝 코드 검증 (Dry Run)
terraform plan

# 3. 프로비저닝 수행 (Run)
terraform apply

```

### 기본 명령어 ( 삭제 )

```bash

# 1. 프로비저닝 삭제 코드 검증 (Dry Run)
terraform plan --destroy

# 2. 프로비저닝 삭제 수행 (Run)
terraform destroy

```

### AWS Configure

  - [AWS Config](./AWS_CONFIG.md)

