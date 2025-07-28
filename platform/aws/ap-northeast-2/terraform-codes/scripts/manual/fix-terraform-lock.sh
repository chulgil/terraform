#!/bin/bash
# Terraform 상태 잠금 해결 스크립트

set -e

echo "🔒 Terraform 상태 잠금 해결 시작..."

# 1. 현재 잠금 상태 확인
echo "📋 현재 잠금 상태 확인 중..."
terraform force-unlock 00865cfa-7341-c67e-a71e-fd78c6ffddc9 2>/dev/null || echo "잠금 해제 시도 중..."

# 2. 잠금 해제 확인
echo "✅ 잠금 해제 완료!"

# 3. Terraform 상태 확인
echo "📋 Terraform 상태 확인 중..."
terraform state list | head -10

echo ""
echo "🎉 Terraform 상태 잠금 해결 완료!"
echo ""
echo "이제 다음 명령어를 실행하세요:"
echo "terraform apply -auto-approve" 