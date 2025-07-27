#!/bin/bash

# 🌐 GitOps 플랫폼 도메인 설정 스크립트
# 사용법: ./update-domain.sh 도메인명 인증서ARN
# 예시: ./update-domain.sh myproject.com arn:aws:acm:ap-northeast-2:123456789:certificate/abcd-1234

set -e

# 컬러 출력 설정
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # 색상 없음

# 출력 함수들
print_info() {
    echo -e "${GREEN}[정보]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[경고]${NC} $1"
}

print_error() {
    echo -e "${RED}[오류]${NC} $1"
}

print_step() {
    echo -e "${BLUE}[단계]${NC} $1"
}

# 필수 매개변수 확인
if [ $# -lt 2 ]; then
    print_error "사용법: $0 <도메인> <인증서ARN>"
    print_error "예시: $0 myproject.com arn:aws:acm:ap-northeast-2:123456789:certificate/abcd-1234"
    exit 1
fi

DOMAIN=$1
CERT_ARN=$2

print_step "🌐 GitOps 플랫폼 도메인 설정: $DOMAIN"

# 인증서 ARN 형식 검증
if [[ ! $CERT_ARN =~ ^arn:aws:acm: ]]; then
    print_error "잘못된 인증서 ARN 형식입니다"
    exit 1
fi

print_info "도메인: $DOMAIN"
print_info "인증서 ARN: $CERT_ARN"

# 프로젝트 루트 경로 설정 (terraform-codes에서 4단계 위로)
PROJECT_ROOT="../../../../"

# 원본 파일 백업
print_step "📋 백업 생성 중..."
backup_dir="${PROJECT_ROOT}backups/$(date +%Y%m%d_%H%M%S)"
mkdir -p "$backup_dir"

if [ -f "${PROJECT_ROOT}service/bubblepool/k8s/overlays/dev/ingress.yaml" ]; then
    cp "${PROJECT_ROOT}service/bubblepool/k8s/overlays/dev/ingress.yaml" "$backup_dir/bubblepool-ingress.yaml.bak"
else
    print_warning "BubblePool Ingress 파일을 찾을 수 없습니다"
fi

if [ -f "${PROJECT_ROOT}service/guestbook/k8s/overlays/dev/ingress.yaml" ]; then
    cp "${PROJECT_ROOT}service/guestbook/k8s/overlays/dev/ingress.yaml" "$backup_dir/guestbook-ingress.yaml.bak"
else
    print_warning "GuestBook Ingress 파일을 찾을 수 없습니다"
fi

print_info "백업이 $backup_dir 에 생성되었습니다"

# BubblePool Ingress 업데이트
print_step "🫧 BubblePool Ingress 업데이트 중..."
if [ -f "${PROJECT_ROOT}service/bubblepool/k8s/overlays/dev/ingress.yaml" ]; then
    sed -i.tmp "s/bubblepool-dev\.your-domain\.com/bubblepool-dev.$DOMAIN/g" "${PROJECT_ROOT}service/bubblepool/k8s/overlays/dev/ingress.yaml"
    sed -i.tmp "s|arn:aws:acm:ap-northeast-2:ACCOUNT_ID:certificate/CERTIFICATE_ID|$CERT_ARN|g" "${PROJECT_ROOT}service/bubblepool/k8s/overlays/dev/ingress.yaml"
    rm -f "${PROJECT_ROOT}service/bubblepool/k8s/overlays/dev/ingress.yaml.tmp"
else
    print_error "BubblePool Ingress 파일을 찾을 수 없습니다"
    exit 1
fi

# GuestBook Ingress 업데이트
print_step "📚 GuestBook Ingress 업데이트 중..."
if [ -f "${PROJECT_ROOT}service/guestbook/k8s/overlays/dev/ingress.yaml" ]; then
    sed -i.tmp "s/guestbook-dev\.your-domain\.com/guestbook-dev.$DOMAIN/g" "${PROJECT_ROOT}service/guestbook/k8s/overlays/dev/ingress.yaml"
    sed -i.tmp "s|arn:aws:acm:ap-northeast-2:ACCOUNT_ID:certificate/CERTIFICATE_ID|$CERT_ARN|g" "${PROJECT_ROOT}service/guestbook/k8s/overlays/dev/ingress.yaml"
    rm -f "${PROJECT_ROOT}service/guestbook/k8s/overlays/dev/ingress.yaml.tmp"
else
    print_error "GuestBook Ingress 파일을 찾을 수 없습니다"
    exit 1
fi

# Kustomize 빌드 검증
print_step "🔍 Kustomize 설정 검증 중..."
if kubectl kustomize "${PROJECT_ROOT}service/bubblepool/k8s/overlays/dev" > /dev/null 2>&1; then
    print_info "BubblePool Kustomize 검증 통과"
else
    print_error "BubblePool Kustomize 검증 실패"
    exit 1
fi

if kubectl kustomize "${PROJECT_ROOT}service/guestbook/k8s/overlays/dev" > /dev/null 2>&1; then
    print_info "GuestBook Kustomize 검증 통과"
else
    print_error "GuestBook Kustomize 검증 실패"
    exit 1
fi

# 변경사항 요약
print_step "📋 변경사항 요약:"
echo "BubblePool URL: https://bubblepool-dev.$DOMAIN"
echo "GuestBook URL: https://guestbook-dev.$DOMAIN"
echo "인증서 ARN: $CERT_ARN"

# DNS 레코드 설정 스크립트 생성
print_step "📝 DNS 설정 스크립트 생성 중..."
cat > ./setup-dns.sh << EOF
#!/bin/bash
# $DOMAIN 도메인을 위한 DNS 레코드 설정

# ALB DNS 이름 가져오기
echo "🔍 ALB DNS 이름 확인 중..."
ALB_DNS=\$(kubectl get ingress bubblepool-ingress -n bubblepool-dev -o jsonpath='{.status.loadBalancer.ingress[0].hostname}' 2>/dev/null || echo "ALB_NOT_READY")

if [ "\$ALB_DNS" = "ALB_NOT_READY" ]; then
    echo "❌ ALB가 아직 준비되지 않았습니다. 먼저 애플리케이션을 배포하세요."
    echo "실행: kubectl apply -f management/argo-cd/applications/projects/dev-apps.yaml"
    exit 1
fi

echo "📋 ALB DNS: \$ALB_DNS"

# 호스팅 영역 ID 가져오기
ZONE_ID=\$(aws route53 list-hosted-zones-by-name --dns-name "$DOMAIN" --query 'HostedZones[0].Id' --output text | cut -d'/' -f3)

if [ "\$ZONE_ID" = "None" ]; then
    echo "❌ $DOMAIN 도메인의 호스팅 영역을 찾을 수 없습니다"
    exit 1
fi

echo "🎯 호스팅 영역 ID: \$ZONE_ID"

# DNS 레코드 생성
echo "📝 DNS 레코드 생성 중..."

# BubblePool CNAME 레코드
aws route53 change-resource-record-sets --hosted-zone-id \$ZONE_ID --change-batch '{
    "Changes": [{
        "Action": "UPSERT",
        "ResourceRecordSet": {
            "Name": "bubblepool-dev.$DOMAIN",
            "Type": "CNAME",
            "TTL": 300,
            "ResourceRecords": [{"Value": "'\$ALB_DNS'"}]
        }
    }]
}'

# GuestBook CNAME 레코드
aws route53 change-resource-record-sets --hosted-zone-id \$ZONE_ID --change-batch '{
    "Changes": [{
        "Action": "UPSERT",
        "ResourceRecordSet": {
            "Name": "guestbook-dev.$DOMAIN",
            "Type": "CNAME", 
            "TTL": 300,
            "ResourceRecords": [{"Value": "'\$ALB_DNS'"}]
        }
    }]
}'

echo "✅ DNS 레코드가 성공적으로 생성되었습니다!"
echo "🌐 접속 URL:"
echo "   BubblePool: https://bubblepool-dev.$DOMAIN"
echo "   GuestBook:  https://guestbook-dev.$DOMAIN"
echo ""
echo "⏰ DNS 전파에 5-10분 정도 소요될 수 있습니다"
EOF

chmod +x ./setup-dns.sh
print_info "DNS 설정 스크립트가 생성되었습니다: ./setup-dns.sh"

# Git 커밋 옵션
print_step "💾 Git 커밋"
echo "변경사항을 커밋하시겠습니까? (y/n)"
read -r commit_choice

if [ "$commit_choice" = "y" ] || [ "$commit_choice" = "Y" ]; then
    # 프로젝트 루트로 이동해서 Git 작업
    cd "$PROJECT_ROOT"
    git add service/*/k8s/overlays/dev/ingress.yaml platform/aws/ap-northeast-2/terraform-codes/scripts/setup-dns.sh
    git commit -m "feat: $DOMAIN 도메인으로 GitOps 애플리케이션 구성

🌐 도메인 설정:
- 도메인: $DOMAIN  
- 인증서: $CERT_ARN
- BubblePool: https://bubblepool-dev.$DOMAIN
- GuestBook: https://guestbook-dev.$DOMAIN

🔧 업데이트 내용:
- 두 애플리케이션의 Ingress 호스트명 업데이트
- SSL 인증서 ARN 설정
- DNS 설정 자동화 스크립트 생성
- Kustomize 설정 검증 완료

📝 다음 단계:
1. 애플리케이션 배포: kubectl apply -f management/argo-cd/applications/projects/dev-apps.yaml
2. DNS 설정: ./scripts/setup-dns.sh
3. SSL 확인: curl -I https://bubblepool-dev.$DOMAIN"
    
    print_info "변경사항이 Git에 커밋되었습니다"
else
    print_warning "변경사항이 커밋되지 않았습니다. 수동으로 커밋하는 것을 잊지 마세요."
fi

print_step "🎉 도메인 설정이 완료되었습니다!"
echo ""
echo "📋 다음 단계:"
echo "1. 🚀 애플리케이션 배포 (아직 배포하지 않은 경우):"
echo "   kubectl apply -f management/argo-cd/applications/projects/dev-apps.yaml"
echo ""
echo "2. 🌐 DNS 레코드 설정:"
echo "   ./scripts/setup-dns.sh"
echo ""
echo "3. ✅ 배포 확인:"
echo "   curl -I https://bubblepool-dev.$DOMAIN"
echo "   curl -I https://guestbook-dev.$DOMAIN"
echo ""
echo "4. 🔍 ArgoCD 모니터링:"
echo "   kubectl port-forward -n argocd svc/argocd-server 8080:80"
echo "   브라우저에서 http://localhost:8080 열기" 