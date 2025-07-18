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

echo "Testing $ENV environment..."

# Terraform 초기화
echo "Initializing Terraform..."
cd "environments/$ENV"
terraform init

# Terraform 검증
echo "Validating Terraform configuration..."
if ! terraform validate; then
  echo "Terraform validation failed!"
  exit 1
fi

# tflint 설치 확인 및 실행
echo "Running tflint..."
if command -v tflint &> /dev/null; then
  tflint --recursive ..
  if [ $? -ne 0 ]; then
    echo "tflint found issues in the code!"
    exit 1
  fi
else
  echo "tflint is not installed. Skipping..."
  echo "Install with: brew install tflint"
fi

echo "All tests passed successfully!"
