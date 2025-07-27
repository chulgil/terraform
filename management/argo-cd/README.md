# 🚀 ArgoCD GitOps 관리

이 디렉토리는 Kubernetes 환경에서 GitOps를 구현하기 위한 ArgoCD 설정을 포함합니다.

## 📋 **목차**

- [개요](#개요)
- [디렉토리 구조](#디렉토리-구조)
- [사전 요구사항](#사전-요구사항)
- [설치 가이드](#설치-가이드)
- [설정 관리](#설정-관리)
- [사용법](#사용법)
- [트러블슈팅](#트러블슈팅)

## 🎯 **개요**

ArgoCD는 Kubernetes용 선언적 GitOps CD(Continuous Delivery) 도구입니다.

### **주요 특징**
- **📦 App of Apps 패턴**: 계층적 애플리케이션 관리
- **🔄 자동 동기화**: Git 저장소 변경 시 자동 배포
- **🎛️ 웹 UI**: 직관적인 관리 인터페이스
- **🔐 RBAC**: 역할 기반 접근 제어
- **📊 멀티 환경**: dev, staging, prod 환경 분리

### **지원하는 배포 전략**
- Rolling Update (기본)
- Blue/Green (Argo Rollouts 연동)
- Canary (Argo Rollouts 연동)

## 📁 **디렉토리 구조**

```
management/argo-cd/
├── base/                           # Base Kustomize 설정
│   ├── namespace.yaml             # argocd 네임스페이스
│   ├── install.yaml               # 공식 설치 매니페스트 참조
│   ├── configmap.yaml             # ArgoCD 핵심 설정
│   ├── rbac-config.yaml           # RBAC 정책 설정
│   └── kustomization.yaml         # Base Kustomize 설정
├── overlays/                      # 환경별 Overlay
│   └── dev/                       # Dev 환경 설정
│       ├── kustomization.yaml     # Dev Kustomize 설정
│       ├── ingress.yaml           # ALB Ingress (Web UI)
│       └── patches/               # Dev 환경 패치
│           ├── server-patch.yaml  # ArgoCD Server 설정
│           └── resource-limits.yaml # 리소스 제한
├── applications/                  # ArgoCD 애플리케이션 정의
│   └── app-of-apps.yaml          # App of Apps 루트
└── scripts/                       # 유틸리티 스크립트
    ├── setup.sh                  # 설치 스크립트
    ├── port-forward.sh            # Port Forward 스크립트
    └── validate.sh                # 설정 검증 스크립트
```

## 🔧 **사전 요구사항**

### **필수 도구**
- `kubectl` (v1.25+)
- `kustomize` (v4.0+)
- `helm` (v3.0+) - optional

### **Kubernetes 환경**
- EKS/GKE/AKS 클러스터 (v1.25+)
- ALB Controller (AWS 환경)
- Cert-Manager (SSL 인증서)

### **네트워크 요구사항**
- 인터넷 연결 (GitHub/DockerHub 접근)
- ALB/Ingress 설정 (Web UI 접근)

## 🚀 **설치 가이드**

### **1. 빠른 설치**
```bash
# ArgoCD 설치 스크립트 실행
cd management/argo-cd
./scripts/setup.sh
```

### **2. 수동 설치**
```bash
# 1. Kustomize로 설치
kubectl apply -k overlays/dev

# 2. 설치 확인
kubectl get pods -n argocd

# 3. 초기 비밀번호 확인
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
```

### **3. Web UI 접속**
```bash
# Port Forward 방식
./scripts/port-forward.sh

# 또는 Ingress 접속
# https://argocd-dev.your-domain.com
```

## ⚙️ **설정 관리**

### **핵심 설정 파일**

#### **1. ArgoCD ConfigMap (`base/configmap.yaml`)**
```yaml
# 주요 설정 항목
- repositories: Git 저장소 설정
- application.instanceLabelKey: 애플리케이션 라벨링
- server.insecure: HTTP 허용 (dev 전용)
- url: 외부 접속 URL
```

#### **2. RBAC 설정 (`base/rbac-config.yaml`)**
```yaml
# 역할 정의
- Admin: 모든 권한
- Developer: dev 환경 권한
- ReadOnly: 읽기 전용
```

#### **3. 환경별 패치 (`overlays/dev/patches/`)**
- 리소스 제한
- 보안 설정  
- 로그 레벨

### **환경별 설정**

| 환경 | 네임스페이스 | 접속 방식 | 특징 |
|------|-------------|-----------|------|
| **dev** | argocd | Ingress/NodePort | 디버그 모드, 낮은 리소스 |
| **staging** | argocd-staging | Ingress | 프로덕션 유사 설정 |
| **prod** | argocd | Ingress + TLS | 고가용성, 보안 강화 |

## 📱 **사용법**

### **1. 애플리케이션 생성**

#### **App of Apps 패턴**
```yaml
# applications/app-of-apps.yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: dev-root-app
  namespace: argocd
spec:
  source:
    repoURL: https://github.com/your-org/platform
    targetRevision: dev
    path: management/argo-cd/applications
  destination:
    namespace: argocd
    server: https://kubernetes.default.svc
```

#### **개별 애플리케이션**
```yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: bubblepool-dev
  namespace: argocd
spec:
  source:
    repoURL: https://github.com/your-org/bubblepool
    targetRevision: dev
    path: k8s/overlays/dev
  destination:
    namespace: bubblepool
    server: https://kubernetes.default.svc
  syncPolicy:
    automated:
      prune: true
      selfHeal: true
```

### **2. CLI 사용법**
```bash
# 로그인
argocd login argocd-dev.your-domain.com

# 애플리케이션 목록
argocd app list

# 애플리케이션 상태
argocd app get bubblepool-dev

# 수동 동기화
argocd app sync bubblepool-dev

# 롤백
argocd app rollback bubblepool-dev
```

### **3. 브랜치 전략**
```bash
# 환경별 브랜치
dev branch      → dev 환경 자동 배포
staging branch  → staging 환경 자동 배포  
main branch     → prod 환경 수동 승인 후 배포
```

## 🎛️ **주요 기능**

### **1. 자동 동기화**
- Git 저장소 변경 감지
- 자동 배포 (설정 가능)
- 충돌 해결 정책

### **2. 멀티 소스**
- 여러 Git 저장소 지원
- Helm 차트 저장소 지원
- OCI 레지스트리 지원

### **3. 보안**
- RBAC 통합
- Secret 관리
- 네트워크 정책

### **4. 모니터링**
- 애플리케이션 상태 추적
- 배포 히스토리
- 메트릭 수집 (Prometheus)

## 🔧 **트러블슈팅**

### **일반적인 문제들**

#### **1. 동기화 실패**
```bash
# 로그 확인
kubectl logs -n argocd deployment/argocd-application-controller

# 수동 리프레시
argocd app get bubblepool-dev --refresh
```

#### **2. UI 접속 불가**
```bash
# 포트 포워드로 임시 접속
./scripts/port-forward.sh

# Ingress 상태 확인
kubectl get ingress -n argocd
kubectl describe ingress argocd-server-ingress -n argocd
```

#### **3. RBAC 권한 문제**
```bash
# 현재 사용자 확인
argocd account get --auth-token $ARGOCD_AUTH_TOKEN

# 권한 확인
kubectl get configmap argocd-rbac-cm -n argocd -o yaml
```

#### **4. 리소스 부족**
```bash
# 리소스 사용량 확인
kubectl top pods -n argocd

# 리소스 제한 조정
kubectl patch deployment argocd-server -n argocd -p '{"spec":{"template":{"spec":{"containers":[{"name":"argocd-server","resources":{"requests":{"memory":"256Mi","cpu":"250m"}}}]}}}}'
```

### **성능 최적화**

#### **1. 대용량 리포지토리**
```yaml
# configmap 설정
data:
  timeout.reconciliation: 300s
  timeout.hard.reconciliation: 0
```

#### **2. 리소스 튜닝**
```yaml
# 환경별 리소스 설정
resources:
  limits:
    cpu: 1000m
    memory: 1Gi
  requests:
    cpu: 500m
    memory: 512Mi
```

## 📊 **모니터링 및 알림**

### **메트릭 수집**
- Prometheus 통합
- 사용자 정의 메트릭
- Grafana 대시보드

### **알림 설정**
- Slack 통합
- 이메일 알림
- Webhook 지원

## 🔗 **관련 리소스**

- [ArgoCD 공식 문서](https://argo-cd.readthedocs.io/)
- [GitOps 가이드](../docs/GitOps.md)
- [Argo Rollouts 연동](../argo-rollout/README.md)
- [Kubernetes 매니페스트](../k8s/README.md)

## 🤝 **기여하기**

1. 새로운 환경 추가: `overlays/new-env/` 생성
2. 스크립트 개선: `scripts/` 디렉토리
3. 문서 업데이트: README 및 예제 개선

---

**ArgoCD로 안전하고 신뢰할 수 있는 GitOps를 구현하세요! 🚀** 