# 🌐 barodream.com 도메인 설정 가이드

name.com에서 구매한 `barodream.com` 도메인을 AWS Route 53과 연결하여 GitOps 플랫폼에서 사용하는 완전한 가이드입니다.

## 📋 **설정 개요**

| 항목 | 현재 상태 | 목표 |
|------|-----------|------|
| **도메인 등록기관** | name.com | name.com (유지) |
| **DNS 관리** | name.com | AWS Route 53 |
| **SSL 인증서** | 없음 | AWS Certificate Manager |
| **애플리케이션 URL** | 없음 | bubblepool-dev.barodream.com<br>guestbook-dev.barodream.com |

## 🚀 **자동 설정 스크립트 실행**

가장 간단한 방법은 준비된 자동화 스크립트를 사용하는 것입니다:

```bash
# barodream.com 전용 설정 스크립트 실행
cd platform/aws/ap-northeast-2/terraform-codes
./scripts/setup-barodream.sh
```

이 스크립트는 다음을 자동으로 처리합니다:
- Route 53 호스팅 영역 생성
- SSL 인증서 요청
- GitOps 애플리케이션 Ingress 설정 업데이트
- DNS 레코드 생성 스크립트 생성

## 📝 **단계별 수동 설정 (상세)**

### **1단계: Route 53 호스팅 영역 생성**

```bash
# AWS CLI로 호스팅 영역 생성
aws route53 create-hosted-zone \
  --name barodream.com \
  --caller-reference "barodream-$(date +%s)"

# 생성된 호스팅 영역 ID 확인
aws route53 list-hosted-zones-by-name --dns-name barodream.com
```

### **2단계: Route 53 네임서버 확인**

```bash
# 네임서버 목록 확인
aws route53 get-hosted-zone --id /hostedzone/Z1234567890ABC \
  --query 'DelegationSet.NameServers' --output table
```

예상 결과:
```
ns-123.awsdns-12.com
ns-456.awsdns-45.net
ns-789.awsdns-78.org
ns-012.awsdns-01.co.uk
```

### **3단계: name.com에서 네임서버 변경**

1. **name.com 로그인**
   - https://www.name.com 접속
   - 계정 로그인

2. **도메인 관리 페이지 이동**
   - "My Domain" 또는 "도메인 관리" 클릭
   - `barodream.com` 선택

3. **네임서버 설정 변경**
   - "Nameservers" 또는 "DNS" 탭 클릭
   - "Custom Nameservers" 선택
   - Route 53에서 확인한 4개 네임서버 입력:
     ```
     ns-123.awsdns-12.com
     ns-456.awsdns-45.net
     ns-789.awsdns-78.org
     ns-012.awsdns-01.co.uk
     ```
   - 저장

### **4단계: SSL 인증서 요청**

```bash
# ACM에서 와일드카드 인증서 요청
aws acm request-certificate \
  --domain-name barodream.com \
  --subject-alternative-names "*.barodream.com" \
  --validation-method DNS \
  --region ap-northeast-2

# 요청된 인증서 ARN 확인
aws acm list-certificates --region ap-northeast-2
```

### **5단계: DNS 검증 레코드 추가**

```bash
# 검증 레코드 확인
aws acm describe-certificate \
  --certificate-arn arn:aws:acm:ap-northeast-2:123456789:certificate/abcd-1234 \
  --region ap-northeast-2 \
  --query 'Certificate.DomainValidationOptions'
```

검증 레코드를 Route 53에 자동으로 추가하거나 수동으로 추가합니다.

### **6단계: GitOps 설정 업데이트**

인증서 ARN을 사용하여 Ingress 설정을 업데이트합니다:

```bash
# 자동 업데이트 스크립트 사용 (terraform-codes 디렉토리에서)
cd platform/aws/ap-northeast-2/terraform-codes
./scripts/update-domain.sh barodream.com arn:aws:acm:ap-northeast-2:123456789:certificate/abcd-1234
```

## 🔍 **DNS 전파 확인**

### **전파 상태 확인**

```bash
# DNS 전파 확인
nslookup barodream.com
dig barodream.com NS

# 특정 네임서버에서 확인
dig @ns-123.awsdns-12.com barodream.com
```

### **전파 시간**
- **일반적**: 1-2시간
- **최대**: 48시간
- **실제 경험**: 보통 30분 내외

## 🚀 **애플리케이션 배포**

DNS 전파가 완료되고 SSL 인증서 검증이 끝나면 애플리케이션을 배포합니다:

```bash
# 1. EKS 클러스터 배포 (아직 안했다면)
cd platform/aws/ap-northeast-2/terraform-codes
./scripts/deploy.sh

# 2. ArgoCD 설치
cd ../../../../management/argo-cd
./scripts/setup.sh

# 3. 애플리케이션 배포
kubectl apply -f applications/projects/dev-apps.yaml

# 4. ALB 생성 확인 (2-3분 소요)
kubectl get ingress -n bubblepool-dev -w
kubectl get ingress -n guestbook-dev -w
```

## 🌐 **DNS 레코드 생성**

ALB가 생성되면 DNS 레코드를 추가합니다:

```bash
# 자동 DNS 설정 스크립트 실행
cd platform/aws/ap-northeast-2/terraform-codes
./scripts/setup-barodream-dns.sh
```

## ✅ **접속 테스트**

```bash
# SSL 인증서 확인
curl -I https://bubblepool-dev.barodream.com
curl -I https://guestbook-dev.barodream.com

# 브라우저에서 접속
echo "🫧 BubblePool: https://bubblepool-dev.barodream.com"
echo "📚 GuestBook: https://guestbook-dev.barodream.com"
```

## 🎯 **최종 결과**

설정이 완료되면 다음 URL로 접속할 수 있습니다:

| 애플리케이션 | URL | 특징 |
|-------------|-----|------|
| **🫧 BubblePool** | https://bubblepool-dev.barodream.com | 커스텀 애니메이션 UI |
| **📚 GuestBook** | https://guestbook-dev.barodream.com | 클래식 방명록 앱 |
| **🔍 ArgoCD** | port-forward로 접근 | GitOps 관리 대시보드 |

## 🔧 **문제 해결**

### **일반적인 문제들**

#### **1. DNS 전파가 안되는 경우**
```bash
# 현재 네임서버 확인
dig barodream.com NS

# name.com에서 올바른 네임서버가 설정되었는지 확인
# 48시간까지 대기 (보통 1-2시간)
```

#### **2. SSL 인증서 검증 실패**
```bash
# 인증서 상태 확인
aws acm describe-certificate --certificate-arn arn:aws:acm:... --region ap-northeast-2

# DNS 검증 레코드가 올바르게 추가되었는지 확인
aws route53 list-resource-record-sets --hosted-zone-id Z123456789
```

#### **3. ALB 생성 실패**
```bash
# ALB Controller 로그 확인
kubectl logs -n kube-system -l app.kubernetes.io/name=aws-load-balancer-controller

# Ingress 상태 확인
kubectl describe ingress bubblepool-ingress -n bubblepool-dev
```

#### **4. 접속 안되는 경우**
```bash
# DNS 레코드 확인
dig bubblepool-dev.barodream.com

# ALB 상태 확인
aws elbv2 describe-load-balancers

# 보안 그룹 확인
kubectl get ingress -n bubblepool-dev -o yaml
```

## 💰 **예상 비용**

### **Route 53 비용**
- **호스팅 영역**: $0.50/월
- **DNS 쿼리**: $0.40/백만 쿼리

### **기존 도메인 유지**
- **name.com 갱신**: 기존 계획대로 (변화 없음)

### **추가 AWS 비용**
- **ALB**: $16.43/월
- **ACM 인증서**: 무료
- **총 추가 비용**: 약 $17/월

## 📱 **모바일에서 name.com 설정**

모바일에서도 네임서버를 변경할 수 있습니다:

1. name.com 모바일 앱 또는 모바일 브라우저로 접속
2. 로그인 후 도메인 관리
3. barodream.com 선택
4. DNS 설정에서 네임서버 변경
5. Route 53 네임서버 4개 입력

## 🎉 **완료 체크리스트**

설정 완료를 위한 체크리스트:

- [ ] Route 53 호스팅 영역 생성
- [ ] name.com에서 네임서버 변경
- [ ] DNS 전파 확인 (1-2시간 대기)
- [ ] SSL 인증서 요청 및 검증
- [ ] GitOps Ingress 설정 업데이트
- [ ] EKS 클러스터 및 애플리케이션 배포
- [ ] ALB 생성 확인
- [ ] DNS 레코드 생성
- [ ] HTTPS 접속 테스트

## 🚀 **다음 단계**

도메인 설정이 완료되면:

1. **모니터링 설정**: Prometheus, Grafana 대시보드
2. **추가 환경**: staging, prod 서브도메인 추가
3. **보안 강화**: WAF, DDoS 보호 설정
4. **성능 최적화**: CloudFront CDN 연결
5. **백업**: Route 53 설정 백업 및 복원 계획

---

**💡 barodream.com은 좋은 도메인 이름이네요! "꿈을 꾸는 바로" 라는 의미로 해석할 수 있어서 개발 프로젝트에 아주 어울립니다.** ✨ 