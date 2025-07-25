# Helm 가이드

## 개요

**Helm**은 Kubernetes용 패키지 매니저로, 복잡한 Kubernetes 애플리케이션을 쉽게 정의, 설치, 업그레이드할 수 있게 해주는 도구입니다. Helm은 "Charts"라는 패키지 형태로 Kubernetes 리소스를 관리합니다.

## 핵심 개념

### 1. **Chart (차트)**
- Kubernetes 애플리케이션을 정의하는 패키지
- 템플릿, 값, 메타데이터를 포함
- 재사용 가능하고 버전 관리 가능

### 2. **Release (릴리스)**
- 클러스터에 설치된 Chart의 인스턴스
- 각 릴리스는 고유한 이름을 가짐
- 업그레이드, 롤백 가능

### 3. **Repository (저장소)**
- Chart들이 저장되고 공유되는 곳
- 공식 저장소, 커뮤니티 저장소, 프라이빗 저장소

### 4. **Values (값)**
- Chart의 기본 설정을 오버라이드하는 설정 파일
- YAML 형태로 정의

## Helm 설치

### 1. **macOS**
```bash
# Homebrew 사용
brew install helm

# 직접 다운로드
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
```

### 2. **Linux**
```bash
# 스크립트 사용
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

# 패키지 매니저 사용 (Ubuntu)
curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null
sudo apt-get install apt-transport-https --yes
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
sudo apt-get update
sudo apt-get install helm
```

### 3. **설치 확인**
```bash
helm version
```

## 기본 명령어

### 1. **저장소 관리**
```bash
# 저장소 추가
helm repo add stable https://charts.helm.sh/stable
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx

# 저장소 목록 확인
helm repo list

# 저장소 업데이트
helm repo update

# 저장소 제거
helm repo remove stable
```

### 2. **Chart 검색 및 정보**
```bash
# Chart 검색
helm search repo nginx
helm search hub wordpress

# Chart 정보 확인
helm show chart bitnami/nginx
helm show values bitnami/nginx
helm show readme bitnami/nginx

# Chart 다운로드
helm pull bitnami/nginx
helm pull bitnami/nginx --untar
```

### 3. **릴리스 관리**
```bash
# 설치
helm install my-nginx bitnami/nginx

# 값 파일과 함께 설치
helm install my-nginx bitnami/nginx -f values.yaml

# 명령행에서 값 설정
helm install my-nginx bitnami/nginx --set service.type=NodePort

# 릴리스 목록 확인
helm list
helm list --all-namespaces

# 릴리스 상태 확인
helm status my-nginx

# 업그레이드
helm upgrade my-nginx bitnami/nginx -f values.yaml

# 롤백
helm rollback my-nginx 1

# 삭제
helm uninstall my-nginx
```

## Chart 생성 실습

### 1. **새 Chart 생성**
```bash
# Chart 스캐폴딩 생성
helm create my-app

# 생성된 구조 확인
tree my-app/
```

### 2. **Chart 구조**
```
my-app/
├── Chart.yaml          # Chart 메타데이터
├── values.yaml         # 기본 설정 값
├── charts/             # 의존성 Chart들
├── templates/          # Kubernetes 매니페스트 템플릿
│   ├── deployment.yaml
│   ├── service.yaml
│   ├── ingress.yaml
│   ├── serviceaccount.yaml
│   ├── NOTES.txt
│   ├── _helpers.tpl    # 템플릿 헬퍼
│   └── tests/
│       └── test-connection.yaml
└── .helmignore         # 패키징 시 제외할 파일
```

### 3. **Chart.yaml 설정**
```yaml
apiVersion: v2
name: my-app
description: A Helm chart for my application
type: application
version: 0.1.0
appVersion: "1.0.0"
home: https://github.com/company/my-app
sources:
  - https://github.com/company/my-app
maintainers:
  - name: CGLee
    email: cglee@company.com
keywords:
  - web
  - nginx
  - application
annotations:
  category: Application
dependencies:
  - name: postgresql
    version: 12.x.x
    repository: https://charts.bitnami.com/bitnami
    condition: postgresql.enabled
```

### 4. **values.yaml 기본 설정**
```yaml
# 기본 설정
replicaCount: 1

image:
  repository: nginx
  pullPolicy: IfNotPresent
  tag: "1.21"

imagePullSecrets: []
nameOverride: ""
fullnameOverride: ""

serviceAccount:
  create: true
  annotations: {}
  name: ""

podAnnotations: {}

podSecurityContext:
  fsGroup: 2000

securityContext:
  capabilities:
    drop:
    - ALL
  readOnlyRootFilesystem: true
  runAsNonRoot: true
  runAsUser: 1000

service:
  type: ClusterIP
  port: 80

ingress:
  enabled: false
  className: ""
  annotations: {}
  hosts:
    - host: chart-example.local
      paths:
        - path: /
          pathType: Prefix
  tls: []

resources:
  limits:
    cpu: 100m
    memory: 128Mi
  requests:
    cpu: 100m
    memory: 128Mi

autoscaling:
  enabled: false
  minReplicas: 1
  maxReplicas: 100
  targetCPUUtilizationPercentage: 80

nodeSelector: {}
tolerations: []
affinity: {}

# 환경별 설정
env:
  - name: ENV
    value: "production"
  - name: DEBUG
    value: "false"

# 의존성 설정
postgresql:
  enabled: true
  auth:
    postgresPassword: "secretpassword"
    database: "myapp"
```

## 환경별 배포

### 1. **환경별 Values 파일**

#### **values-dev.yaml**
```yaml
replicaCount: 1

image:
  tag: "latest"

service:
  type: NodePort

ingress:
  enabled: true
  className: "nginx"
  annotations:
    nginx.ingress.kubernetes.io/rewrite-target: /
  hosts:
    - host: my-app-dev.local
      paths:
        - path: /
          pathType: Prefix

resources:
  limits:
    cpu: 200m
    memory: 256Mi
  requests:
    cpu: 100m
    memory: 128Mi

env:
  - name: ENV
    value: "development"
  - name: DEBUG
    value: "true"

postgresql:
  enabled: true
  auth:
    postgresPassword: "devpassword"
    database: "myapp_dev"
```

#### **values-prod.yaml**
```yaml
replicaCount: 3

image:
  tag: "1.0.0"

service:
  type: ClusterIP

ingress:
  enabled: true
  className: "alb"
  annotations:
    kubernetes.io/ingress.class: alb
    alb.ingress.kubernetes.io/scheme: internet-facing
    alb.ingress.kubernetes.io/target-type: ip
  hosts:
    - host: my-app.company.com
      paths:
        - path: /
          pathType: Prefix
  tls:
    - secretName: my-app-tls
      hosts:
        - my-app.company.com

resources:
  limits:
    cpu: 500m
    memory: 512Mi
  requests:
    cpu: 250m
    memory: 256Mi

autoscaling:
  enabled: true
  minReplicas: 3
  maxReplicas: 10
  targetCPUUtilizationPercentage: 70

env:
  - name: ENV
    value: "production"
  - name: DEBUG
    value: "false"

postgresql:
  enabled: false  # 외부 RDS 사용

nodeSelector:
  node-type: "application"

tolerations:
  - key: "application"
    operator: "Equal"
    value: "true"
    effect: "NoSchedule"
```

### 2. **배포 명령어**
```bash
# 개발 환경 배포
helm install my-app-dev ./my-app -f values-dev.yaml -n development

# 프로덕션 환경 배포
helm install my-app-prod ./my-app -f values-prod.yaml -n production

# 업그레이드
helm upgrade my-app-prod ./my-app -f values-prod.yaml -n production

# 드라이런 테스트
helm install my-app-test ./my-app -f values-prod.yaml --dry-run --debug
```

## 고급 기능

### 1. **조건부 리소스**
```yaml
# templates/configmap.yaml
{{- if .Values.configMap.enabled }}
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ include "my-app.fullname" . }}-config
data:
  {{- range $key, $value := .Values.configMap.data }}
  {{ $key }}: {{ $value | quote }}
  {{- end }}
{{- end }}
```

### 2. **반복문 사용**
```yaml
# templates/secrets.yaml
{{- range $name, $value := .Values.secrets }}
---
apiVersion: v1
kind: Secret
metadata:
  name: {{ include "my-app.fullname" $ }}-{{ $name }}
type: Opaque
data:
  {{- range $key, $val := $value }}
  {{ $key }}: {{ $val | b64enc }}
  {{- end }}
{{- end }}
```

### 3. **함수 사용**
```yaml
# 다양한 Helm 함수 사용 예시
metadata:
  name: {{ include "my-app.fullname" . | lower }}
  labels:
    version: {{ .Chart.Version | quote }}
    date: {{ now | date "2006-01-02" }}
    random: {{ randAlphaNum 10 | lower }}
data:
  config.yaml: |
    {{- .Values.config | toYaml | nindent 4 }}
  encoded: {{ .Values.secret | b64enc }}
  default: {{ .Values.optional | default "default-value" }}
```

## 현재 프로젝트에 적용

### **Cluster Autoscaler를 Helm Chart로 변환**

#### **1. Chart 구조**
```bash
charts/cluster-autoscaler/
├── Chart.yaml
├── values.yaml
├── values-dev.yaml
├── values-prod.yaml
└── templates/
    ├── deployment.yaml
    ├── rbac.yaml
    ├── service-account.yaml
    └── _helpers.tpl
```

#### **2. Chart.yaml**
```yaml
apiVersion: v2
name: cluster-autoscaler
description: A Helm chart for Kubernetes Cluster Autoscaler
type: application
version: 0.1.0
appVersion: "1.28.2"
home: https://github.com/kubernetes/autoscaler
sources:
  - https://github.com/kubernetes/autoscaler/tree/master/cluster-autoscaler
maintainers:
  - name: CGLee
    email: cglee@company.com
keywords:
  - autoscaling
  - cluster-autoscaler
  - kubernetes
```

#### **3. values.yaml**
```yaml
image:
  repository: registry.k8s.io/autoscaling/cluster-autoscaler
  tag: v1.28.2
  pullPolicy: Always

replicaCount: 1

cluster:
  name: ""
  region: ap-northeast-2

aws:
  region: ap-northeast-2

serviceAccount:
  create: true
  annotations: {}
  name: cluster-autoscaler

rbac:
  create: true

resources:
  limits:
    cpu: 100m
    memory: 600Mi
  requests:
    cpu: 100m
    memory: 600Mi

nodeSelector:
  kubernetes.io/os: linux

tolerations:
  - key: node.kubernetes.io/not-ready
    operator: Exists
    effect: NoExecute
    tolerationSeconds: 300

autoscaler:
  expander: least-waste
  scaleDownDelayAfterAdd: 10m
  scaleDownUnneededTime: 10m
  skipNodesWithLocalStorage: false
  skipNodesWithSystemPods: false
```

## Helm vs Kustomize 비교

| 특징 | Helm | Kustomize |
|------|------|-----------|
| **템플릿 엔진** | Go 템플릿 | 템플릿 없음 |
| **패키지 관리** | Chart 저장소 | Git 기반 |
| **복잡성** | 높음 | 낮음 |
| **학습 곡선** | 가파름 | 완만함 |
| **조건부 로직** | 강력함 | 제한적 |
| **버전 관리** | Chart 버전 | Git 태그 |
| **롤백** | 내장 지원 | Git 기반 |
| **의존성 관리** | 자동 | 수동 |
| **커뮤니티** | 대규모 | 중간 |

## 모범 사례

### 1. **Chart 구조**
- 명확한 디렉토리 구조 유지
- 템플릿과 헬퍼 분리
- 의미 있는 파일명 사용

### 2. **Values 설계**
- 환경별 values 파일 분리
- 기본값 제공
- 문서화된 설정

### 3. **템플릿 작성**
- 조건부 리소스 활용
- 헬퍼 함수 재사용
- 적절한 들여쓰기

### 4. **보안**
- RBAC 적용
- 보안 컨텍스트 설정
- Secret 암호화

## 문제 해결

### 1. **일반적인 오류**

#### **템플릿 렌더링 오류**
```bash
# 오류: template: my-app/templates/deployment.yaml:10:14: executing "my-app/templates/deployment.yaml" at <.Values.image.tag>: nil pointer evaluating interface {}.tag

# 해결: 기본값 설정
image:
  tag: {{ .Values.image.tag | default .Chart.AppVersion }}
```

#### **의존성 오류**
```bash
# 오류: found in Chart.yaml, but missing in charts/ directory

# 해결: 의존성 업데이트
helm dependency update
```

### 2. **디버깅 명령어**
```bash
# 템플릿 렌더링 확인
helm template my-app ./my-app --debug

# 값 확인
helm get values my-app

# 매니페스트 확인
helm get manifest my-app

# 히스토리 확인
helm history my-app
```

## 결론

**Helm**은 Kubernetes 애플리케이션 배포를 위한 강력한 도구입니다. 특히:

### **장점**
- ✅ 강력한 템플릿 엔진
- ✅ 패키지 관리 및 버전 관리
- ✅ 풍부한 생태계
- ✅ 롤백 및 업그레이드 지원
- ✅ 의존성 관리

### **단점**
- ❌ 높은 학습 곡선
- ❌ 복잡한 템플릿
- ❌ 보안 고려사항
- ❌ 상태 관리 복잡성

### **적용 권장 상황**
- 복잡한 애플리케이션 배포
- 다양한 환경 관리
- 패키지 재사용성 중요
- 강력한 템플릿 기능 필요

현재 프로젝트에서는 **Terraform + Helm 하이브리드** 접근도 고려해볼 수 있습니다:
- **Terraform**: 인프라 (EKS, IAM, VPC)
- **Helm**: 애플리케이션 배포 (Cluster Autoscaler, 앱)

---

**작성일**: 2025-07-25  
**버전**: 1.0  
**작성자**: CGLee
