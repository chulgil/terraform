#!/bin/bash

# 스크립트 실행 디렉토리로 이동
cd "$(dirname "$0")/.."

# 환경 변수 확인
ENV=${1:-dev}

# 환경 디렉토리 확인
if [ ! -d "environments/$ENV" ]; then
  echo "Error: Environment '$ENV' not found."
  echo "Available environments: $(ls -m environments)"
  exit 1
fi

echo "Deploying to $ENV environment..."

# terraform.tfvars 파일 확인
if [ ! -f "environments/$ENV/terraform.tfvars" ]; then
  echo "Error: terraform.tfvars not found in environments/$ENV/"
  echo "Please create terraform.tfvars from terraform.tfvars.example"
  exit 1
fi

# Terraform 초기화
echo "Initializing Terraform..."
cd "environments/$ENV"
terraform init

# Terraform 플랜 실행
echo "Running terraform plan..."
terraform plan -out=tfplan

# 사용자 확인
read -p "Do you want to apply these changes? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  # Terraform 적용
  echo "Applying Terraform changes..."
  terraform apply tfplan
  
  # kubeconfig 업데이트
  echo "Updating kubeconfig..."
  aws eks update-kubeconfig \
    --region $(terraform output -raw region) \
    --name $(terraform output -raw cluster_name)
  
  echo "Deployment completed successfully!"
else
  echo "Deployment cancelled by user."
  exit 0
fi
