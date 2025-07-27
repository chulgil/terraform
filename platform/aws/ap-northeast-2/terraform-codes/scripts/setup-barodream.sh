#!/bin/bash

# 🌐 barodream.com 도메인 설정 스크립트
# name.com에서 구매한 도메인을 AWS Route 53과 연결

set -e

# 컬러 출력 설정
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

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

print_step "🌐 barodream.com 도메인 설정 시작"

# 1단계: Route 53 호스팅 영역 생성/확인
print_step "1️⃣ Route 53 호스팅 영역 확인"

ZONE_ID=$(aws route53 list-hosted-zones-by-name --dns-name barodream.com --query 'HostedZones[0].Id' --output text 2>/dev/null | cut -d'/' -f3)

if [ "$ZONE_ID" = "None" ] || [ -z "$ZONE_ID" ]; then
    print_info "호스팅 영역이 없습니다. 새로 생성합니다..."
    
    RESULT=$(aws route53 create-hosted-zone \
        --name barodream.com \
        --caller-reference "barodream-$(date +%s)" \
        --query 'HostedZone.Id' \
        --output text)
    
    ZONE_ID=$(echo $RESULT | cut -d'/' -f3)
    print_info "호스팅 영역이 생성되었습니다: $ZONE_ID"
else
    print_info "기존 호스팅 영역을 사용합니다: $ZONE_ID"
fi

# 2단계: 네임서버 정보 확인
print_step "2️⃣ 네임서버 정보 확인"

echo "🎯 barodream.com의 Route 53 네임서버:"
aws route53 get-hosted-zone --id "/hostedzone/$ZONE_ID" \
    --query 'DelegationSet.NameServers' \
    --output table

print_warning "이 네임서버들을 name.com에서 설정해야 합니다!"

# 3단계: SSL 인증서 요청
print_step "3️⃣ SSL 인증서 요청"

# 기존 인증서 확인
CERT_ARN=$(aws acm list-certificates --region ap-northeast-2 \
    --query 'CertificateSummaryList[?DomainName==`barodream.com`].CertificateArn' \
    --output text)

if [ -z "$CERT_ARN" ] || [ "$CERT_ARN" = "None" ]; then
    print_info "SSL 인증서를 요청합니다..."
    
    CERT_ARN=$(aws acm request-certificate \
        --domain-name barodream.com \
        --subject-alternative-names "*.barodream.com" \
        --validation-method DNS \
        --region ap-northeast-2 \
        --query 'CertificateArn' \
        --output text)
    
    print_info "인증서가 요청되었습니다: $CERT_ARN"
    print_warning "DNS 검증이 필요합니다. ACM 콘솔에서 확인하세요!"
else
    print_info "기존 인증서를 사용합니다: $CERT_ARN"
fi

# 4단계: DNS 검증 레코드 확인
print_step "4️⃣ DNS 검증 레코드 확인"

echo "🔍 DNS 검증을 위해 다음 명령어로 검증 레코드를 확인하세요:"
echo "aws acm describe-certificate --certificate-arn $CERT_ARN --region ap-northeast-2 --query 'Certificate.DomainValidationOptions'"

# 5단계: GitOps 설정 업데이트
print_step "5️⃣ GitOps 애플리케이션 설정 업데이트"

print_info "인증서 ARN: $CERT_ARN"

# 프로젝트 루트로 이동 (terraform-codes에서 4단계 위로)
PROJECT_ROOT="../../../../"

# 백업 생성
backup_dir="${PROJECT_ROOT}backups/barodream-$(date +%Y%m%d_%H%M%S)"
mkdir -p "$backup_dir"

if [ -f "${PROJECT_ROOT}service/bubblepool/k8s/overlays/dev/ingress.yaml" ]; then
    cp "${PROJECT_ROOT}service/bubblepool/k8s/overlays/dev/ingress.yaml" "$backup_dir/bubblepool-ingress.yaml.bak"
fi

if [ -f "${PROJECT_ROOT}service/guestbook/k8s/overlays/dev/ingress.yaml" ]; then
    cp "${PROJECT_ROOT}service/guestbook/k8s/overlays/dev/ingress.yaml" "$backup_dir/guestbook-ingress.yaml.bak"
fi

print_info "백업이 생성되었습니다: $backup_dir"

# BubblePool Ingress 업데이트
print_info "BubblePool Ingress 업데이트 중..."
if [ -f "${PROJECT_ROOT}service/bubblepool/k8s/overlays/dev/ingress.yaml" ]; then
    sed -i.tmp "s/bubblepool-dev\.your-domain\.com/bubblepool-dev.barodream.com/g" "${PROJECT_ROOT}service/bubblepool/k8s/overlays/dev/ingress.yaml"
    sed -i.tmp "s|arn:aws:acm:ap-northeast-2:ACCOUNT_ID:certificate/CERTIFICATE_ID|$CERT_ARN|g" "${PROJECT_ROOT}service/bubblepool/k8s/overlays/dev/ingress.yaml"
    rm -f "${PROJECT_ROOT}service/bubblepool/k8s/overlays/dev/ingress.yaml.tmp"
    print_info "BubblePool Ingress 업데이트 완료"
else
    print_warning "BubblePool Ingress 파일을 찾을 수 없습니다: ${PROJECT_ROOT}service/bubblepool/k8s/overlays/dev/ingress.yaml"
fi

# GuestBook Ingress 업데이트
print_info "GuestBook Ingress 업데이트 중..."
if [ -f "${PROJECT_ROOT}service/guestbook/k8s/overlays/dev/ingress.yaml" ]; then
    sed -i.tmp "s/guestbook-dev\.your-domain\.com/guestbook-dev.barodream.com/g" "${PROJECT_ROOT}service/guestbook/k8s/overlays/dev/ingress.yaml"
    sed -i.tmp "s|arn:aws:acm:ap-northeast-2:ACCOUNT_ID:certificate/CERTIFICATE_ID|$CERT_ARN|g" "${PROJECT_ROOT}service/guestbook/k8s/overlays/dev/ingress.yaml"
    rm -f "${PROJECT_ROOT}service/guestbook/k8s/overlays/dev/ingress.yaml.tmp"
    print_info "GuestBook Ingress 업데이트 완료"
else
    print_warning "GuestBook Ingress 파일을 찾을 수 없습니다: ${PROJECT_ROOT}service/guestbook/k8s/overlays/dev/ingress.yaml"
fi

# 6단계: DNS 레코드 설정 스크립트 생성
print_step "6️⃣ DNS 설정 스크립트 생성"

cat > ./setup-barodream-dns.sh << 'EOF'
#!/bin/bash
# barodream.com DNS 레코드 설정

set -e

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${GREEN}[정보]${NC} barodream.com DNS 레코드 설정 시작"

# ALB DNS 이름 확인
echo "🔍 ALB DNS 이름 확인 중..."
ALB_DNS=$(kubectl get ingress bubblepool-ingress -n bubblepool-dev -o jsonpath='{.status.loadBalancer.ingress[0].hostname}' 2>/dev/null || echo "ALB_NOT_READY")

if [ "$ALB_DNS" = "ALB_NOT_READY" ]; then
    echo -e "${RED}[오류]${NC} ALB가 아직 준비되지 않았습니다."
    echo "먼저 애플리케이션을 배포하세요:"
    echo "kubectl apply -f ../../../../management/argo-cd/applications/projects/dev-apps.yaml"
    exit 1
fi

echo "📋 ALB DNS: $ALB_DNS"

# 호스팅 영역 ID 확인
ZONE_ID=$(aws route53 list-hosted-zones-by-name --dns-name barodream.com --query 'HostedZones[0].Id' --output text | cut -d'/' -f3)

if [ "$ZONE_ID" = "None" ]; then
    echo -e "${RED}[오류]${NC} barodream.com 호스팅 영역을 찾을 수 없습니다"
    exit 1
fi

echo "🎯 호스팅 영역 ID: $ZONE_ID"

# BubblePool CNAME 레코드 생성
echo "📝 BubblePool DNS 레코드 생성 중..."
aws route53 change-resource-record-sets --hosted-zone-id $ZONE_ID --change-batch "{
    \"Changes\": [{
        \"Action\": \"UPSERT\",
        \"ResourceRecordSet\": {
            \"Name\": \"bubblepool-dev.barodream.com\",
            \"Type\": \"CNAME\",
            \"TTL\": 300,
            \"ResourceRecords\": [{\"Value\": \"$ALB_DNS\"}]
        }
    }]
}"

# GuestBook CNAME 레코드 생성
echo "📝 GuestBook DNS 레코드 생성 중..."
aws route53 change-resource-record-sets --hosted-zone-id $ZONE_ID --change-batch "{
    \"Changes\": [{
        \"Action\": \"UPSERT\",
        \"ResourceRecordSet\": {
            \"Name\": \"guestbook-dev.barodream.com\",
            \"Type\": \"CNAME\",
            \"TTL\": 300,
            \"ResourceRecords\": [{\"Value\": \"$ALB_DNS\"}]
        }
    }]
}"

echo -e "${GREEN}✅ DNS 레코드가 성공적으로 생성되었습니다!${NC}"
echo ""
echo "🌐 접속 URL:"
echo "   BubblePool: https://bubblepool-dev.barodream.com"
echo "   GuestBook:  https://guestbook-dev.barodream.com"
echo ""
echo "⏰ DNS 전파에 5-10분 정도 소요될 수 있습니다"
echo ""
echo "🔍 접속 테스트:"
echo "curl -I https://bubblepool-dev.barodream.com"
echo "curl -I https://guestbook-dev.barodream.com"
EOF

chmod +x ./setup-barodream-dns.sh
print_info "DNS 설정 스크립트가 생성되었습니다: ./setup-barodream-dns.sh"

# 결과 요약
print_step "🎉 barodream.com 설정 완료!"

echo ""
echo "📋 완료된 작업:"
echo "✅ Route 53 호스팅 영역: $ZONE_ID"
echo "✅ SSL 인증서: $CERT_ARN"
echo "✅ Ingress 설정 업데이트 완료"
echo "✅ DNS 설정 스크립트 생성"
echo ""
echo "📝 다음 단계:"
echo "1. 🌐 name.com에서 네임서버 변경:"
echo "   - name.com 로그인 → 도메인 관리 → Nameservers"
echo "   - 위에 표시된 Route 53 네임서버 4개로 변경"
echo ""
echo "2. ⏰ DNS 전파 대기 (최대 48시간, 보통 1-2시간)"
echo ""
echo "3. 🔐 SSL 인증서 DNS 검증:"
echo "   aws acm describe-certificate --certificate-arn $CERT_ARN --region ap-northeast-2"
echo ""
echo "4. 🚀 애플리케이션 배포:"
echo "   kubectl apply -f ../../../../management/argo-cd/applications/projects/dev-apps.yaml"
echo ""
echo "5. 🌐 DNS 레코드 설정:"
echo "   ./setup-barodream-dns.sh"
echo ""
echo "6. ✅ 접속 테스트:"
echo "   https://bubblepool-dev.barodream.com"
echo "   https://guestbook-dev.barodream.com"
echo ""
echo "💡 변경사항을 Git에 커밋하려면 수동으로 진행하세요:"
echo "   cd ../../../../"
echo "   git add service/*/k8s/overlays/dev/ingress.yaml"
echo "   git add platform/aws/ap-northeast-2/terraform-codes/scripts/setup-barodream-dns.sh"
echo "   git commit -m 'feat: barodream.com 도메인 설정 완료'"
echo "   git push origin main"
