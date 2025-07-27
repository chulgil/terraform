# 🎯 Argo Rollouts 고급 배포 전략

이 디렉토리는 Kubernetes에서 Blue/Green, Canary 등 고급 배포 전략을 구현하기 위한 Argo Rollouts 설정을 포함합니다.

## 📋 **목차**

- [개요](#개요)
- [디렉토리 구조](#디렉토리-구조)
- [설치 가이드](#설치-가이드)
- [배포 전략](#배포-전략)
- [사용법](#사용법)
- [예제](#예제)
- [모니터링](#모니터링)
- [트러블슈팅](#트러블슈팅)

## 🎯 **개요**

Argo Rollouts는 Kubernetes에서 고급 배포 전략을 제공하는 Progressive Delivery Controller입니다.

### **주요 특징**
- **🔄 Blue/Green 배포**: 무중단 배포 전략
- **📊 Canary 배포**: 점진적 트래픽 증가
- **📈 자동 분석**: 메트릭 기반 자동 판단
- **🔙 자동 롤백**: 실패 시 이전 버전으로 복구
- **🎛️ 대시보드**: 실시간 배포 상태 모니터링

### **지원하는 배포 전략**
- **Rolling Update**: 기본 Kubernetes 전략
- **Blue/Green**: 전체 교체 방식
- **Canary**: 점진적 배포 (가중치 기반)
- **Canary with Analysis**: 메트릭 분석 기반 Canary

## 📁 **디렉토리 구조**

```
management/argo-rollout/
├── base/                           # Base Kustomize 설정
│   ├── namespace.yaml             # argo-rollouts 네임스페이스
│   ├── install.yaml               # 공식 설치 매니페스트 참조
│   ├── configmap.yaml             # Argo Rollouts 설정
│   └── kustomization.yaml         # Base Kustomize 설정
├── overlays/                      # 환경별 Overlay
│   └── dev/                       # Dev 환경 설정
│       ├── kustomization.yaml     # Dev Kustomize 설정
│       ├── ingress.yaml           # Dashboard Ingress
│       └── patches/               # Dev 환경 패치
│           ├── controller-patch.yaml    # Controller 설정
│           ├── dashboard-patch.yaml     # Dashboard 배포
│           └── resource-limits.yaml     # 리소스 제한
├── scripts/                       # 유틸리티 스크립트
│   ├── setup.sh                  # 설치 스크립트
│   ├── dashboard.sh               # Dashboard 접속 스크립트
│   └── validate.sh                # 설정 검증 스크립트
├── examples-bluegreen.yaml        # Blue/Green 예제
└── README.md                      # 이 파일
```

## 🚀 **설치 가이드**

### **1. 빠른 설치**
```bash
# Argo Rollouts 설치 스크립트 실행
cd management/argo-rollout
./scripts/setup.sh
```

### **2. 수동 설치**
```bash
# 1. Kustomize로 설치
kubectl apply -k overlays/dev

# 2. 설치 확인
kubectl get pods -n argo-rollouts

# 3. kubectl 플러그인 설치
curl -LO https://github.com/argoproj/argo-rollouts/releases/latest/download/kubectl-argo-rollouts-linux-amd64
chmod +x kubectl-argo-rollouts-linux-amd64
sudo mv kubectl-argo-rollouts-linux-amd64 /usr/local/bin/kubectl-argo-rollouts
```

### **3. Dashboard 접속**
```bash
# Dashboard 스크립트 실행
./scripts/dashboard.sh

# 또는 직접 포트 포워드
kubectl port-forward svc/argo-rollouts-dashboard -n argo-rollouts 3100:3100
```

## 🎯 **배포 전략**

### **1. Blue/Green 배포**

완전히 새로운 환경을 구성한 후 트래픽을 전환하는 방식입니다.

```yaml
strategy:
  blueGreen:
    activeService: myapp-active
    previewService: myapp-preview
    autoPromotionEnabled: false
    scaleDownDelaySeconds: 30
    prePromotionAnalysis:
      templates:
        - templateName: success-rate
    postPromotionAnalysis:
      templates:
        - templateName: success-rate
```

**특징:**
- ✅ **빠른 롤백**: 문제 발생 시 즉시 이전 버전으로 전환
- ✅ **리스크 최소화**: 전체 테스트 후 전환
- ❌ **리소스 비용**: 2배의 리소스 필요

### **2. Canary 배포**

일부 트래픽만 새 버전으로 보내며 점진적으로 증가시키는 방식입니다.

```yaml
strategy:
  canary:
    steps:
      - setWeight: 10    # 10% 트래픽
      - pause: {duration: 2m}
      - setWeight: 20    # 20% 트래픽
      - pause: {duration: 2m}
      - setWeight: 50    # 50% 트래픽
      - analysis:
          templates:
            - templateName: success-rate
          startingStep: 2
      - setWeight: 100   # 100% 트래픽
```

**특징:**
- ✅ **리소스 효율적**: 점진적 리소스 사용
- ✅ **세밀한 제어**: 단계별 트래픽 조절
- ❌ **복잡성**: 설정 및 관리 복잡

### **3. 분석 기반 자동화**

메트릭을 기반으로 자동 승격/롤백을 수행합니다.

```yaml
analysis:
  templates:
    - templateName: http-success-rate
    - templateName: response-time
  args:
    - name: service-name
      value: myapp.production.svc.cluster.local
```

## 📱 **사용법**

### **1. Rollout 리소스 생성**

```yaml
apiVersion: argoproj.io/v1alpha1
kind: Rollout
metadata:
  name: myapp
  namespace: production
spec:
  replicas: 5
  strategy:
    canary:
      steps:
        - setWeight: 20
        - pause: {duration: 5m}
        - setWeight: 40
        - pause: {duration: 10m}
        - setWeight: 60
        - pause: {duration: 10m}
        - setWeight: 80
        - pause: {duration: 10m}
  selector:
    matchLabels:
      app: myapp
  template:
    metadata:
      labels:
        app: myapp
    spec:
      containers:
        - name: myapp
          image: myapp:v2.0.0
          ports:
            - containerPort: 8080
```

### **2. CLI 명령어**

```bash
# Rollout 상태 확인
kubectl argo rollouts get rollout myapp -n production

# 배포 일시정지
kubectl argo rollouts pause myapp -n production

# 배포 재개
kubectl argo rollouts promote myapp -n production

# 롤백
kubectl argo rollouts undo myapp -n production

# 배포 히스토리
kubectl argo rollouts history myapp -n production

# 실시간 모니터링
kubectl argo rollouts get rollout myapp -w -n production
```

### **3. 분석 템플릿 정의**

```yaml
apiVersion: argoproj.io/v1alpha1
kind: AnalysisTemplate
metadata:
  name: http-success-rate
spec:
  args:
    - name: service-name
  metrics:
    - name: success-rate
      interval: 1m
      count: 5
      successCondition: result[0] >= 0.95
      failureLimit: 3
      provider:
        prometheus:
          address: http://prometheus.monitoring.svc.cluster.local:9090
          query: |
            sum(rate(http_requests_total{service="{{args.service-name}}",status!~"5.."}[2m])) 
            / 
            sum(rate(http_requests_total{service="{{args.service-name}}"}[2m]))
```

## 📊 **예제**

### **Blue/Green 배포 예제**
```bash
# Blue/Green 예제 배포
kubectl apply -f examples-bluegreen.yaml

# 배포 상태 확인
kubectl argo rollouts get rollout example-bluegreen -n demo

# 수동 승격
kubectl argo rollouts promote example-bluegreen -n demo
```

### **Canary 배포 예제**
```yaml
# examples-canary.yaml
apiVersion: argoproj.io/v1alpha1
kind: Rollout
metadata:
  name: example-canary
  namespace: demo
spec:
  replicas: 5
  strategy:
    canary:
      canaryService: example-canary-canary
      stableService: example-canary-stable
      steps:
        - setWeight: 10
        - pause: {duration: 1m}
        - setWeight: 20
        - pause: {duration: 1m}
        - analysis:
            templates:
              - templateName: http-success-rate
            args:
              - name: service-name
                value: example-canary-canary.demo.svc.cluster.local
        - setWeight: 50
        - pause: {duration: 2m}
        - setWeight: 100
```

## 🔧 **고급 설정**

### **1. 트래픽 라우팅 (ALB)**

```yaml
strategy:
  canary:
    trafficRouting:
      alb:
        ingress: myapp-ingress
        servicePort: 80
        annotationPrefix: alb.ingress.kubernetes.io
    steps:
      - setWeight: 10
      - pause: {duration: 30s}
```

### **2. 메트릭 제공자**

```yaml
# Prometheus
provider:
  prometheus:
    address: http://prometheus.monitoring.svc.cluster.local:9090

# Datadog
provider:
  datadog:
    address: https://api.datadoghq.com
    apiKey:
      secretKeyRef:
        name: datadog-secret
        key: api-key

# New Relic
provider:
  newRelic:
    profile: my-profile
    query: "SELECT average(duration) FROM Transaction WHERE appName = 'myapp'"
```

## 📊 **모니터링**

### **1. Dashboard 기능**
- 실시간 배포 상태
- 트래픽 분산 시각화
- 메트릭 그래프
- 배포 히스토리

### **2. 주요 메트릭**
- **성공률**: HTTP 2xx, 3xx 응답 비율
- **응답 시간**: 평균/P95/P99 응답 시간
- **에러율**: HTTP 4xx, 5xx 응답 비율
- **처리량**: 초당 요청 수 (RPS)

### **3. 알림 설정**
```yaml
# Slack 알림
notifications:
  - name: rollout-updated
    when: "rollout.status.phase in ['Progressing', 'Healthy', 'Degraded']"
    slack:
      webhook: "https://hooks.slack.com/services/..."
      channel: "#deployments"
      message: "Rollout {{.rollout.metadata.name}} is {{.rollout.status.phase}}"
```

## 🚨 **트러블슈팅**

### **일반적인 문제들**

#### **1. 분석 실패**
```bash
# 분석 로그 확인
kubectl logs -n argo-rollouts deployment/argo-rollouts

# AnalysisRun 상태 확인
kubectl get analysisrun -n production

# 메트릭 쿼리 테스트
kubectl argo rollouts get rollout myapp --analysis -n production
```

#### **2. 트래픽 라우팅 문제**
```bash
# 서비스 확인
kubectl get services -n production

# Ingress 확인
kubectl describe ingress myapp-ingress -n production

# ALB 어노테이션 확인
kubectl get ingress myapp-ingress -o yaml -n production
```

#### **3. 리소스 부족**
```bash
# 리소스 사용량 확인
kubectl top pods -n argo-rollouts

# 리소스 제한 조정
kubectl patch rollout myapp -n production -p '{"spec":{"template":{"spec":{"containers":[{"name":"myapp","resources":{"requests":{"memory":"256Mi","cpu":"250m"}}}]}}}}'
```

## 🔗 **연동 도구**

### **1. ArgoCD 연동**
```yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: myapp-rollout
spec:
  source:
    repoURL: https://github.com/chulgil/myapp
    targetRevision: main
    path: k8s/rollout
  destination:
    namespace: production
  syncPolicy:
    automated:
      prune: true
      selfHeal: true
```

### **2. Prometheus 연동**
```yaml
# ServiceMonitor
apiVersion: monitoring.coreos.com/v1
kind: ServiceMonitor
metadata:
  name: argo-rollouts-metrics
spec:
  selector:
    matchLabels:
      app.kubernetes.io/name: argo-rollouts-metrics
  endpoints:
    - port: metrics
      path: /metrics
```

## 🎯 **베스트 프랙티스**

### **1. 배포 전략 선택**
- **Critical Services**: Blue/Green + 수동 승격
- **High Traffic Services**: Canary + 자동 분석
- **Internal Services**: Rolling Update

### **2. 분석 메트릭**
- **필수**: 성공률, 에러율
- **권장**: 응답 시간, 처리량
- **선택**: 비즈니스 메트릭

### **3. 설정 권장사항**
```yaml
# 안전한 기본 설정
strategy:
  canary:
    maxSurge: "25%"
    maxUnavailable: 0
    analysis:
      successfulRunHistoryLimit: 5
      unsuccessfulRunHistoryLimit: 3
    steps:
      - setWeight: 10
      - pause: {duration: 5m}
      - analysis:
          templates:
            - templateName: success-rate
          startingStep: 1
```

---

**Argo Rollouts로 안전하고 신뢰할 수 있는 배포를 구현하세요! 🎯** 