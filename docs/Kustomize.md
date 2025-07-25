# Kustomize 가이드

## 개요

**Kustomize**는 Kubernetes 매니페스트 파일을 템플릿 없이 커스터마이징할 수 있는 도구입니다. Kubernetes 1.14부터 `kubectl`에 내장되어 있으며, 환경별로 다른 설정을 적용할 때 매우 유용합니다.

## 핵심 개념

### 1. **Base (기본 구성)**
- 모든 환경에서 공통으로 사용되는 기본 Kubernetes 매니페스트
- 재사용 가능한 리소스 정의

### 2. **Overlay (환경별 구성)**
- Base를 기반으로 환경별 차이점만 정의
- dev, staging, production 등 환경별 커스터마이징

### 3. **Patch (부분 수정)**
- 기존 리소스의 특정 부분만 수정
- Strategic Merge Patch 또는 JSON Patch 사용

## 디렉토리 구조

```
k8s-manifests/
├── base/                           # 기본 구성
│   ├── deployment.yaml
│   ├── service.yaml
│   ├── configmap.yaml
│   └── kustomization.yaml
├── overlays/                       # 환경별 구성
│   ├── dev/
│   │   ├── kustomization.yaml
│   │   ├── replica-patch.yaml
│   │   └── dev-configmap.yaml
│   ├── staging/
│   │   ├── kustomization.yaml
│   │   └── staging-patch.yaml
│   └── prod/
│       ├── kustomization.yaml
│       ├── prod-patch.yaml
│       └── hpa.yaml
└── components/                     # 재사용 가능한 컴포넌트
    ├── monitoring/
    └── security/
```

## 실습 예제: Nginx 애플리케이션

### 1단계: Base 구성 생성

#### **base/deployment.yaml**
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-app
  labels:
    app: nginx
spec:
  replicas: 1
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:1.21
        ports:
        - containerPort: 80
        resources:
          requests:
            cpu: 100m
            memory: 128Mi
          limits:
            cpu: 200m
            memory: 256Mi
```

#### **base/service.yaml**
```yaml
apiVersion: v1
kind: Service
metadata:
  name: nginx-service
spec:
  selector:
    app: nginx
  ports:
  - protocol: TCP
    port: 80
    targetPort: 80
  type: ClusterIP
```

#### **base/configmap.yaml**
```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: nginx-config
data:
  nginx.conf: |
    server {
        listen 80;
        location / {
            return 200 'Hello from Base Environment!';
            add_header Content-Type text/plain;
        }
    }
```

#### **base/kustomization.yaml**
```yaml
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization

metadata:
  name: nginx-base

resources:
- deployment.yaml
- service.yaml
- configmap.yaml

commonLabels:
  app: nginx
  version: v1.0.0

commonAnnotations:
  managed-by: kustomize
```

### 2단계: Dev 환경 Overlay

#### **overlays/dev/kustomization.yaml**
```yaml
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization

metadata:
  name: nginx-dev

resources:
- ../../base

namePrefix: dev-
nameSuffix: -v1

replicas:
- name: nginx-app
  count: 2

images:
- name: nginx
  newTag: 1.21-alpine

commonLabels:
  environment: dev

configMapGenerator:
- name: nginx-config
  behavior: replace
  literals:
  - nginx.conf=|
      server {
          listen 80;
          location / {
              return 200 'Hello from DEV Environment!';
              add_header Content-Type text/plain;
          }
      }

patchesStrategicMerge:
- replica-patch.yaml

patchesJson6902:
- target:
    version: v1
    kind: Service
    name: nginx-service
  patch: |-
    - op: replace
      path: /spec/type
      value: NodePort
```

#### **overlays/dev/replica-patch.yaml**
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-app
spec:
  template:
    spec:
      containers:
      - name: nginx
        resources:
          requests:
            cpu: 50m
            memory: 64Mi
          limits:
            cpu: 100m
            memory: 128Mi
```

### 3단계: Production 환경 Overlay

#### **overlays/prod/kustomization.yaml**
```yaml
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization

metadata:
  name: nginx-prod

resources:
- ../../base
- hpa.yaml
- ingress.yaml

namePrefix: prod-

replicas:
- name: nginx-app
  count: 5

images:
- name: nginx
  newTag: 1.21

commonLabels:
  environment: prod
  tier: frontend

configMapGenerator:
- name: nginx-config
  behavior: replace
  literals:
  - nginx.conf=|
      server {
          listen 80;
          location / {
              return 200 'Hello from PRODUCTION Environment!';
              add_header Content-Type text/plain;
          }
          location /health {
              return 200 'OK';
              add_header Content-Type text/plain;
          }
      }

patchesStrategicMerge:
- prod-patch.yaml
```

#### **overlays/prod/prod-patch.yaml**
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-app
spec:
  template:
    spec:
      containers:
      - name: nginx
        resources:
          requests:
            cpu: 200m
            memory: 256Mi
          limits:
            cpu: 500m
            memory: 512Mi
        livenessProbe:
          httpGet:
            path: /health
            port: 80
          initialDelaySeconds: 30
          periodSeconds: 10
        readinessProbe:
          httpGet:
            path: /health
            port: 80
          initialDelaySeconds: 5
          periodSeconds: 5
```

#### **overlays/prod/hpa.yaml**
```yaml
apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler
metadata:
  name: nginx-hpa
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: nginx-app
  minReplicas: 3
  maxReplicas: 10
  metrics:
  - type: Resource
    resource:
      name: cpu
      target:
        type: Utilization
        averageUtilization: 70
  - type: Resource
    resource:
      name: memory
      target:
        type: Utilization
        averageUtilization: 80
```

## 실습 명령어

### 1. **매니페스트 생성 및 확인**

```bash
# Dev 환경 매니페스트 생성
kubectl kustomize overlays/dev/

# Production 환경 매니페스트 생성
kubectl kustomize overlays/prod/

# 파일로 출력
kubectl kustomize overlays/dev/ > dev-manifests.yaml
kubectl kustomize overlays/prod/ > prod-manifests.yaml
```

### 2. **배포 및 관리**

```bash
# Dev 환경 배포
kubectl apply -k overlays/dev/

# Production 환경 배포
kubectl apply -k overlays/prod/

# 배포 상태 확인
kubectl get all -l environment=dev
kubectl get all -l environment=prod

# 삭제
kubectl delete -k overlays/dev/
kubectl delete -k overlays/prod/
```

### 3. **디버깅 및 검증**

```bash
# 생성될 리소스 미리 확인
kubectl kustomize overlays/dev/ | kubectl apply --dry-run=client -f -

# 차이점 확인
kubectl diff -k overlays/dev/

# 특정 리소스만 확인
kubectl kustomize overlays/dev/ | grep -A 20 "kind: Deployment"
```

## 고급 기능

### 1. **Generators (생성기)**

#### **Secret Generator**
```yaml
# kustomization.yaml
secretGenerator:
- name: mysql-secret
  literals:
  - username=admin
  - password=secretpassword
  type: Opaque

- name: tls-secret
  files:
  - tls.crt=cert.pem
  - tls.key=key.pem
  type: kubernetes.io/tls
```

#### **ConfigMap Generator**
```yaml
# kustomization.yaml
configMapGenerator:
- name: app-config
  files:
  - config.properties
  - application.yaml

- name: env-config
  literals:
  - ENV=production
  - DEBUG=false
  - LOG_LEVEL=info

- name: script-config
  files:
  - init.sh
  options:
    disableNameSuffixHash: true
```

### 2. **Transformers (변환기)**

#### **Namespace Transformer**
```yaml
# kustomization.yaml
namespace: my-namespace

resources:
- deployment.yaml
- service.yaml
```

#### **Name Transformer**
```yaml
# kustomization.yaml
namePrefix: frontend-
nameSuffix: -v2

resources:
- deployment.yaml
```

#### **Label/Annotation Transformer**
```yaml
# kustomization.yaml
commonLabels:
  app: myapp
  version: v1.0.0
  environment: prod

commonAnnotations:
  managed-by: kustomize
  deployed-by: ci-cd-pipeline
  contact: devops@company.com
```

### 3. **Components (컴포넌트)**

#### **components/monitoring/kustomization.yaml**
```yaml
apiVersion: kustomize.config.k8s.io/v1alpha1
kind: Component

resources:
- servicemonitor.yaml
- prometheusrule.yaml

patchesStrategicMerge:
- monitoring-patch.yaml
```

#### **사용 예시**
```yaml
# overlays/prod/kustomization.yaml
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization

resources:
- ../../base

components:
- ../../components/monitoring
- ../../components/security
```

## Kustomize vs Helm 비교

| 특징 | Kustomize | Helm |
|------|-----------|------|
| **템플릿** | 템플릿 없음 | Go 템플릿 사용 |
| **학습 곡선** | 낮음 | 중간 |
| **복잡성** | 단순함 | 복잡함 |
| **패키지 관리** | 없음 | Chart 저장소 |
| **조건부 로직** | 제한적 | 강력함 |
| **버전 관리** | Git 기반 | Chart 버전 |
| **롤백** | Git 기반 | Helm 기반 |
| **의존성 관리** | 수동 | 자동 |

## 모범 사례

### 1. **디렉토리 구조**
```bash
# 권장 구조
k8s-manifests/
├── base/                    # 공통 리소스
├── overlays/               # 환경별 설정
│   ├── dev/
│   ├── staging/
│   └── prod/
├── components/             # 재사용 컴포넌트
└── docs/                   # 문서
```

### 2. **네이밍 규칙**
```yaml
# 일관된 네이밍
namePrefix: ${environment}-
nameSuffix: -${version}

# 예: dev-nginx-app-v1
```

### 3. **라벨링 전략**
```yaml
commonLabels:
  app.kubernetes.io/name: nginx
  app.kubernetes.io/instance: nginx-prod
  app.kubernetes.io/version: "1.21"
  app.kubernetes.io/component: frontend
  app.kubernetes.io/part-of: web-app
  app.kubernetes.io/managed-by: kustomize
```

### 4. **보안 고려사항**
```yaml
# Secret은 별도 관리
secretGenerator:
- name: app-secrets
  env: secrets.env
  options:
    disableNameSuffixHash: true

# 민감한 정보는 외부 도구 사용
# - Sealed Secrets
# - External Secrets Operator
# - AWS Secrets Manager
```

## GitOps와 Kustomize

### 1. **ArgoCD와 연동**
```yaml
# argocd-application.yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: nginx-app
  namespace: argocd
spec:
  project: default
  source:
    repoURL: https://github.com/company/k8s-manifests
    targetRevision: HEAD
    path: overlays/prod
  destination:
    server: https://kubernetes.default.svc
    namespace: nginx
  syncPolicy:
    automated:
      prune: true
      selfHeal: true
```

### 2. **Flux와 연동**
```yaml
# flux-kustomization.yaml
apiVersion: kustomize.toolkit.fluxcd.io/v1beta2
kind: Kustomization
metadata:
  name: nginx-app
  namespace: flux-system
spec:
  interval: 5m
  path: "./overlays/prod"
  prune: true
  sourceRef:
    kind: GitRepository
    name: k8s-manifests
  targetNamespace: nginx
```

## 문제 해결

### 1. **일반적인 오류**

#### **리소스 중복**
```bash
# 오류: 같은 이름의 리소스가 여러 번 정의됨
Error: accumulating resources: accumulation err='accumulating resources from 'deployment.yaml': already registered id: ~G_v1_Deployment|default|nginx-app'

# 해결: namePrefix나 nameSuffix 사용
namePrefix: env-
```

#### **패치 실패**
```bash
# 오류: 패치 대상을 찾을 수 없음
Error: unable to find one or more patches

# 해결: 패치 대상의 이름과 네임스페이스 확인
```

### 2. **디버깅 명령어**
```bash
# 생성될 매니페스트 확인
kubectl kustomize . --enable-alpha-plugins

# 특정 리소스만 확인
kubectl kustomize . | yq eval 'select(.kind == "Deployment")'

# 변수 치환 확인
kubectl kustomize . --load-restrictor=none
```

## 실무 적용 시나리오

### 1. **마이크로서비스 환경**
```bash
services/
├── user-service/
│   ├── base/
│   └── overlays/
├── order-service/
│   ├── base/
│   └── overlays/
└── shared/
    ├── ingress/
    ├── monitoring/
    └── security/
```

### 2. **멀티 클러스터 배포**
```bash
clusters/
├── aws-us-east-1/
│   ├── dev/
│   ├── staging/
│   └── prod/
├── aws-eu-west-1/
│   └── prod/
└── gcp-us-central1/
    └── dr/
```

## 현재 프로젝트에 적용

### **Cluster Autoscaler를 Kustomize로 변환**

#### **1. Base 구성**
```bash
k8s-manifests/cluster-autoscaler/
├── base/
│   ├── deployment.yaml
│   ├── rbac.yaml
│   ├── service-account.yaml
│   └── kustomization.yaml
└── overlays/
    ├── dev/
    └── prod/
```

#### **2. 환경별 설정**
```yaml
# overlays/dev/kustomization.yaml
resources:
- ../../base

patchesStrategicMerge:
- cluster-autoscaler-patch.yaml

images:
- name: cluster-autoscaler
  newTag: v1.28.2

replicas:
- name: cluster-autoscaler
  count: 1
```

## 결론

**Kustomize**는 Kubernetes 매니페스트 관리를 위한 강력하고 간단한 도구입니다. 특히:

### **장점**
- ✅ 템플릿 없는 단순함
- ✅ Kubernetes 네이티브
- ✅ GitOps 친화적
- ✅ 환경별 관리 용이

### **단점**
- ❌ 복잡한 로직 제한
- ❌ 패키지 관리 부족
- ❌ 의존성 관리 어려움

### **적용 권장 상황**
- 환경별 차이가 적은 경우
- GitOps 워크플로우 사용
- 단순한 배포 파이프라인
- Kubernetes 매니페스트 우선 접근

현재 프로젝트에서는 **Terraform + Kustomize 하이브리드** 접근도 고려해볼 수 있습니다:
- **Terraform**: 인프라 (EKS, IAM, VPC)
- **Kustomize**: 애플리케이션 배포 (Cluster Autoscaler, 앱)

---

**작성일**: 2025-07-25  
**버전**: 1.0  
**작성자**: CGLee
