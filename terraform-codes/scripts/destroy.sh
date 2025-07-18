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

# 사용자 확인
echo "WARNING: This will destroy all resources in the $ENV environment!"
read -p "Are you sure you want to continue? (y/n) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
  echo "Destruction cancelled by user."
  exit 0
fi

# Terraform 초기화
echo "Initializing Terraform..."
cd "environments/$ENV"
terraform init

# Terraform 파괴
echo "Destroying $ENV environment..."
terraform destroy

echo "Destruction completed successfully!"
