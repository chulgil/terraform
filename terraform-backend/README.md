

[테라폼협업문서참고](./AWS_CoWorking.md)

### 추출 IaC 코드를 활용한 Terraform 상태 및 형상 파일에 저장, 관리


#### 1. 로컬에 있는 Terraform 상태파일을 S3 Backend Bucket으로 업로드

```bash

# 특정 리전의 S3 버킷 목록 조회 (리전 지정)
AWS_REGION=ap-northeast-2 aws s3 ls

# 업로드
aws s3 cp terraform.state s3://<S3 Backend Bucket명>/<업로드할 파일명>

# 다운로드
aws s3 cp s3://<S3 Backend Bucket명>/terraform.tfstate .

```



### 2. 추출 IaC 코드를 활용한 2번째 EKS NodeGroup 생성 및 확인

```bash
# 1. 추출된 Terraform 상태파일 내 오브젝트 현황 확인
 terraform state list

# 2. 추출 Terraform 상태파일을 기존 Terraform Backend 상태파일에 Import 방법
terraform state mv -state-out=<기존 Terraform Backend 상태파일 저장 경로> <추출Terraform Object명> <Import되서 저장될 Terraform Object명>

```