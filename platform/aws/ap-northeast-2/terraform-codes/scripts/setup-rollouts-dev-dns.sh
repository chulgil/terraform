#!/bin/bash
# Argo Rollouts Dev 환경용 DNS 레코드 생성

ZONE_ID="Z0561332FUOKCAPSBXM1"
ALB_DNS=$(kubectl get ingress argo-rollouts-dashboard-ingress -n argo-rollouts -o jsonpath='{.status.loadBalancer.ingress[0].hostname}' 2>/dev/null)

if [ -z "$ALB_DNS" ]; then
    echo "❌ ALB DNS를 찾을 수 없습니다. Ingress를 먼저 배포하세요."
    exit 1
fi

echo "🌐 Argo Rollouts Dev DNS 레코드 생성 중..."
echo "ALB DNS: $ALB_DNS"

# Argo Rollouts Dev CNAME 레코드 생성
aws route53 change-resource-record-sets --hosted-zone-id $ZONE_ID --change-batch "{
    \"Changes\": [{
        \"Action\": \"UPSERT\",
        \"ResourceRecordSet\": {
            \"Name\": \"rollouts-dev.barodream.com\",
            \"Type\": \"CNAME\",
            \"TTL\": 300,
            \"ResourceRecords\": [{\"Value\": \"$ALB_DNS\"}]
        }
    }]
}"

echo "✅ rollouts-dev.barodream.com DNS 레코드 생성 완료" 