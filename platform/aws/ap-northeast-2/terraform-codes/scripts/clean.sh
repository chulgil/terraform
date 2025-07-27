#!/bin/bash

# 스크립트 설명: 테라폼 환경을 정리하고 초기화하는 스크립트
# 사용법: ./scripts/clean-and-init.sh [환경명: dev|prod] [옵션: --force]
#   --force 옵션은 모든 확인 단계를 건너뜁니다.

set -e

# 색상 정의
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# 스크립트 경로 설정
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

# 기본값 설정
ENVIRONMENT=""
FORCE=false

# 인자 파싱
while [[ $# -gt 0 ]]; do
    case $1 in
        dev|prod)
            ENVIRONMENT="$1"
            shift
            ;;
        --force)
            FORCE=true
            shift
            ;;
        *)
            echo -e "${RED}오류: 알 수 없는 인자: $1${NC}"
            echo "사용법: $0 [환경명: dev|prod] [--force]"
            exit 1
            ;;
    esac
done

# 환경 확인
if [ -z "$ENVIRONMENT" ]; then
    echo -e "${YELLOW}환경이 지정되지 않았습니다. 기본값으로 'dev'를 사용합니다.${NC}"
    ENVIRONMENT="dev"
fi

# 환경 디렉토리 확인
ENV_DIR="$PROJECT_ROOT/environments/$ENVIRONMENT"
if [ ! -d "$ENV_DIR" ]; then
    echo -e "${RED}오류: $ENV_DIR 디렉토리를 찾을 수 없습니다.${NC}"
    exit 1
fi

# 함수 정의
print_section() {
    echo -e "\n${GREEN}### $1${NC}"
}

confirm() {
    if [ "$FORCE" = true ]; then
        return 0
    fi
    
    local prompt="$1 [y/N] "
    read -p "$prompt" -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "작업이 취소되었습니다."
        exit 0
    fi
}

# 메인 실행
clear
echo -e "${GREEN}=== 테라폼 환경 정리 및 초기화 스크립트 ===${NC}"
echo -e "환경: ${YELLOW}${ENVIRONMENT}${NC}"

# 1. .terraform 디렉토리 삭제
print_section ".terraform 디렉토리 정리 중..."
if [ -d "$ENV_DIR/.terraform" ]; then
    echo "$ENV_DIR/.terraform 디렉토리를 삭제합니다."
    confirm "정말 삭제하시겠습니까?"
    rm -rf "$ENV_DIR/.terraform"
    echo -e "✅ ${GREEN}.terraform 디렉토리가 정리되었습니다.${NC}"
else
    echo -e "ℹ️  .terraform 디렉토리를 찾을 수 없습니다."
fi

# 2. .terraform.lock.hcl 파일 삭제
print_section ".terraform.lock.hcl 파일 정리 중..."
if [ -f "$ENV_DIR/.terraform.lock.hcl" ]; then
    echo "$ENV_DIR/.terraform.lock.hcl 파일을 삭제합니다."
    confirm "정말 삭제하시겠습니까?"
    rm -f "$ENV_DIR/.terraform.lock.hcl"
    echo -e "✅ ${GREEN}.terraform.lock.hcl 파일이 정리되었습니다.${NC}"
else
    echo -e "ℹ️  .terraform.lock.hcl 파일을 찾을 수 없습니다."
fi

# 3. 테라폼 상태 파일 확인 및 삭제
print_section "테라폼 상태 파일 확인 중..."
STATE_FILES=$(find "$ENV_DIR" -name "terraform.tfstate*" | wc -l)

if [ "$STATE_FILES" -gt 0 ]; then
    echo -e "⚠️  ${YELLOW}테라폼 상태 파일 $STATE_FILES개를 발견했습니다.${NC}"
    find "$ENV_DIR" -name "terraform.tfstate*" -exec ls -la {} \;
    
    confirm "위 상태 파일들을 삭제하시겠습니까?"
    
    find "$ENV_DIR" -name "terraform.tfstate*" -delete
    echo -e "✅ ${GREEN}테라폼 상태 파일이 정리되었습니다.${NC}"
else
    echo -e "ℹ️  테라폼 상태 파일을 찾을 수 없습니다."
fi

# 4. 글로벌 플러그인 캐시 정리
print_section "글로벌 플러그인 캐시 정리 중..."
if [ -d "$HOME/.terraform.d/plugin-cache" ]; then
    echo "$HOME/.terraform.d/plugin-cache 디렉토리를 정리합니다."
    confirm "정말 정리하시겠습니까?"
    rm -rf "$HOME/.terraform.d/plugin-cache"
    echo -e "✅ ${GREEN}글로벌 플러그인 캐시가 정리되었습니다.${NC}"
else
    echo -e "ℹ️  글로벌 플러그인 캐시를 찾을 수 없습니다."
fi

# 5. 테라폼 초기화
print_section "테라폼 초기화 중..."
echo -e "디렉토리: ${YELLOW}$ENV_DIR${NC}"
cd "$ENV_DIR" || exit 1

echo -e "\n${GREEN}테라폼 초기화를 시작합니다...${NC}"
terraform init -upgrade

# 6. 테라폼 버전 및 프로바이더 상태 표시
echo -e "\n${GREEN}🔍 테라폼 환경 상태:${NC}"
echo "--------------------------------------------"
echo -e "${YELLOW}테라폼 버전:${NC}"
terraform version

echo -e "\n${YELLOW}초기화된 프로바이더:${NC}"
terraform providers

echo -e "\n✅ ${GREEN}정리 및 초기화가 완료되었습니다!${NC}"
echo -e "'${YELLOW}terraform plan${NC}' 명령어로 구성을 확인하실 수 있습니다."
