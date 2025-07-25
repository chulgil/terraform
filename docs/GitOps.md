# GitOps 가이드

## 개요

**GitOps**는 Git을 단일 진실 공급원(Single Source of Truth)으로 사용하여 인프라와 애플리케이션을 선언적으로 관리하는 운영 모델입니다. GitOps는 개발자 경험을 향상시키고, 보안을 강화하며, 배포 속도와 안정성을 높이는 현대적인 DevOps 접근 방식입니다.

## GitOps의 핵심 원칙

### 1. **선언적 (Declarative)**
- 시스템의 원하는 상태를 선언적으로 정의
- "어떻게"가 아닌 "무엇을" 원하는지 명시
- Kubernetes 매니페스트, Terraform 코드 등 사용

```yaml
# 선언적 예시: Kubernetes Deployment
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-app
spec:
  replicas: 3  # 원하는 상태: 3개의 replica
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
```

### 2. **버전 관리 (Versioned and Immutable)**
- 모든 설정이 Git에서 버전 관리됨
- 변경 사항은 Git 커밋으로 추적 가능
- 불변성(Immutability) 보장

```bash
# Git 히스토리로 모든 변경사항 추적
git log --oneline
a1b2c3d feat: increase nginx replicas to 5
d4e5f6g fix: update nginx image to 1.21.1
g7h8i9j feat: add health check configuration
```

### 3. **자동으로 풀링 (Automatically Pulled)**
- GitOps 에이전트가 Git 저장소를 지속적으로 모니터링
- 변경사항을 자동으로 감지하고 클러스터에 적용
- Push 모델이 아닌 Pull 모델 사용

```mermaid
graph LR
    A[Developer] --> B[Git Repository]
    C[GitOps Agent] --> B
    C --> D[Kubernetes Cluster]
    B -.-> C
```

### 4. **지속적으로 조정 (Continuously Reconciled)**
- 실제 상태와 원하는 상태 간의 차이를 지속적으로 감지
- 드리프트(Drift) 자동 수정
- 자가 치유(Self-healing) 시스템

## GitOps 아키텍처

### 1. **기본 구조**

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Developer     │    │  Git Repository │    │ Kubernetes      │
│                 │    │                 │    │ Cluster         │
│  ┌───────────┐  │    │  ┌───────────┐  │    │  ┌───────────┐  │
│  │   Code    │  │───▶│  │ App Code  │  │    │  │    App    │  │
│  └───────────┘  │    │  └───────────┘  │    │  └───────────┘  │
│                 │    │                 │    │                 │
│  ┌───────────┐  │    │  ┌───────────┐  │    │  ┌───────────┐  │
│  │  Config   │  │───▶│  │  Config   │  │◀───│  │  GitOps   │  │
│  └───────────┘  │    │  └───────────┘  │    │  │  Agent    │  │
└─────────────────┘    └─────────────────┘    │  └───────────┘  │
                                              └─────────────────┘
```

### 2. **GitOps 도구들**

#### **ArgoCD**
- Kubernetes 네이티브 GitOps 도구
- 웹 UI 제공
- 멀티 클러스터 지원

#### **Flux**
- CNCF 프로젝트
- Kubernetes Operator 기반
- Helm과 Kustomize 지원

#### **Jenkins X**
- CI/CD와 GitOps 통합
- Kubernetes 네이티브 CI/CD

## GitOps 워크플로우

### 1. **애플리케이션 배포 워크플로우**

```mermaid
sequenceDiagram
    participant Dev as Developer
    participant Git as Git Repository
    participant CI as CI Pipeline
    participant Reg as Container Registry
    participant GitOps as GitOps Agent
    participant K8s as Kubernetes

    Dev->>Git: 1. Push application code
    Git->>CI: 2. Trigger CI pipeline
    CI->>Reg: 3. Build & push image
    CI->>Git: 4. Update image tag in config
    GitOps->>Git: 5. Poll for changes
    GitOps->>K8s: 6. Apply changes
    K8s->>K8s: 7. Deploy application
```

### 2. **인프라 관리 워크플로우**

```mermaid
sequenceDiagram
    participant Ops as Platform Team
    participant Git as Git Repository
    participant GitOps as GitOps Agent
    participant K8s as Kubernetes
    participant AWS as AWS

    Ops->>Git: 1. Update infrastructure config
    GitOps->>Git: 2. Poll for changes
    GitOps->>K8s: 3. Apply Terraform/Crossplane
    K8s->>AWS: 4. Provision infrastructure
    AWS->>K8s: 5. Return resource info
    K8s->>GitOps: 6. Update status
```

## 실습: ArgoCD를 이용한 GitOps 구축

### 1. **ArgoCD 설치**

```bash
# ArgoCD 네임스페이스 생성
kubectl create namespace argocd

# ArgoCD 설치
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# ArgoCD 서버 접근을 위한 포트 포워딩
kubectl port-forward svc/argocd-server -n argocd 8080:443

# 초기 admin 비밀번호 확인
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
```

### 2. **GitOps 저장소 구조**

```
gitops-repo/
├── applications/
│   ├── nginx-app/
│   │   ├── base/
│   │   │   ├── deployment.yaml
│   │   │   ├── service.yaml
│   │   │   └── kustomization.yaml
│   │   └── overlays/
│   │       ├── dev/
│   │       │   ├── kustomization.yaml
│   │       │   └── patch.yaml
│   │       └── prod/
│   │           ├── kustomization.yaml
│   │           └── patch.yaml
│   └── cluster-autoscaler/
│       ├── base/
│       └── overlays/
├── infrastructure/
│   ├── namespaces/
│   ├── rbac/
│   └── network-policies/
└── argocd/
    ├── applications/
    └── projects/
```

### 3. **ArgoCD Application 정의**

```yaml
# argocd/applications/nginx-app-dev.yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: nginx-app-dev
  namespace: argocd
  finalizers:
    - resources-finalizer.argocd.argoproj.io
spec:
  project: default
  source:
    repoURL: https://github.com/company/gitops-repo
    targetRevision: HEAD
    path: applications/nginx-app/overlays/dev
  destination:
    server: https://kubernetes.default.svc
    namespace: nginx-dev
  syncPolicy:
    automated:
      prune: true
      selfHeal: true
    syncOptions:
      - CreateNamespace=true
  revisionHistoryLimit: 10
```

### 4. **애플리케이션 매니페스트**

```yaml
# applications/nginx-app/base/deployment.yaml
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

```yaml
# applications/nginx-app/overlays/dev/kustomization.yaml
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization

resources:
- ../../base

namePrefix: dev-

replicas:
- name: nginx-app
  count: 2

images:
- name: nginx
  newTag: 1.21-alpine

patchesStrategicMerge:
- patch.yaml
```

## CI/CD와 GitOps 통합

### 1. **GitHub Actions 예시**

```yaml
# .github/workflows/ci-cd.yml
name: CI/CD Pipeline

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

env:
  REGISTRY: ghcr.io
  IMAGE_NAME: ${{ github.repository }}

jobs:
  build-and-push:
    runs-on: ubuntu-latest
    permissions:
      contents: read
      packages: write

    steps:
    - name: Checkout repository
      uses: actions/checkout@v3

    - name: Log in to Container Registry
      uses: docker/login-action@v2
      with:
        registry: ${{ env.REGISTRY }}
        username: ${{ github.actor }}
        password: ${{ secrets.GITHUB_TOKEN }}

    - name: Extract metadata
      id: meta
      uses: docker/metadata-action@v4
      with:
        images: ${{ env.REGISTRY }}/${{ env.IMAGE_NAME }}
        tags: |
          type=ref,event=branch
          type=ref,event=pr
          type=sha,prefix={{branch}}-

    - name: Build and push Docker image
      uses: docker/build-push-action@v4
      with:
        context: .
        push: true
        tags: ${{ steps.meta.outputs.tags }}
        labels: ${{ steps.meta.outputs.labels }}

  update-gitops:
    needs: build-and-push
    runs-on: ubuntu-latest
    if: github.ref == 'refs/heads/main'

    steps:
    - name: Checkout GitOps repository
      uses: actions/checkout@v3
      with:
        repository: company/gitops-repo
        token: ${{ secrets.GITOPS_TOKEN }}
        path: gitops

    - name: Update image tag
      run: |
        cd gitops
        NEW_TAG="${{ github.sha }}"
        sed -i "s|newTag:.*|newTag: main-${NEW_TAG:0:7}|" applications/nginx-app/overlays/prod/kustomization.yaml
        
    - name: Commit and push changes
      run: |
        cd gitops
        git config --local user.email "action@github.com"
        git config --local user.name "GitHub Action"
        git add .
        git commit -m "Update nginx-app image to main-${{ github.sha }}"
        git push
```

### 2. **Jenkins Pipeline 예시**

```groovy
// Jenkinsfile
pipeline {
    agent any
    
    environment {
        DOCKER_REGISTRY = 'your-registry.com'
        IMAGE_NAME = 'nginx-app'
        GITOPS_REPO = 'https://github.com/company/gitops-repo.git'
    }
    
    stages {
        stage('Build') {
            steps {
                script {
                    def image = docker.build("${DOCKER_REGISTRY}/${IMAGE_NAME}:${BUILD_NUMBER}")
                    docker.withRegistry('https://' + DOCKER_REGISTRY, 'docker-registry-credentials') {
                        image.push()
                        image.push('latest')
                    }
                }
            }
        }
        
        stage('Update GitOps') {
            when {
                branch 'main'
            }
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'gitops-credentials', usernameVariable: 'GIT_USERNAME', passwordVariable: 'GIT_PASSWORD')]) {
                        sh """
                            git clone https://${GIT_USERNAME}:${GIT_PASSWORD}@github.com/company/gitops-repo.git
                            cd gitops-repo
                            sed -i 's|newTag:.*|newTag: ${BUILD_NUMBER}|' applications/nginx-app/overlays/prod/kustomization.yaml
                            git config user.email "jenkins@company.com"
                            git config user.name "Jenkins"
                            git add .
                            git commit -m "Update nginx-app image to ${BUILD_NUMBER}"
                            git push origin main
                        """
                    }
                }
            }
        }
    }
}
```

## 보안 고려사항

### 1. **Git 저장소 보안**

```yaml
# .gitignore
# 민감한 정보는 Git에 저장하지 않음
secrets/
*.key
*.pem
.env
config/secrets.yaml

# 대신 Sealed Secrets 또는 External Secrets 사용
apiVersion: bitnami.com/v1alpha1
kind: SealedSecret
metadata:
  name: mysecret
  namespace: default
spec:
  encryptedData:
    password: AgBy3i4OJSWK+PiTySYZZA9rO43cGDEQAx...
```

### 2. **RBAC 설정**

```yaml
# ArgoCD RBAC 설정
apiVersion: v1
kind: ConfigMap
metadata:
  name: argocd-rbac-cm
  namespace: argocd
data:
  policy.default: role:readonly
  policy.csv: |
    p, role:admin, applications, *, */*, allow
    p, role:admin, clusters, *, *, allow
    p, role:admin, repositories, *, *, allow
    p, role:developer, applications, get, */*, allow
    p, role:developer, applications, sync, */*, allow
    g, company:platform-team, role:admin
    g, company:dev-team, role:developer
```

### 3. **네트워크 보안**

```yaml
# ArgoCD를 위한 Network Policy
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: argocd-network-policy
  namespace: argocd
spec:
  podSelector:
    matchLabels:
      app.kubernetes.io/part-of: argocd
  policyTypes:
  - Ingress
  - Egress
  ingress:
  - from:
    - namespaceSelector:
        matchLabels:
          name: ingress-nginx
    ports:
    - protocol: TCP
      port: 8080
  egress:
  - to: []
    ports:
    - protocol: TCP
      port: 443  # Git HTTPS
    - protocol: TCP
      port: 22   # Git SSH
```

## 모니터링 및 관찰성

### 1. **ArgoCD 메트릭**

```yaml
# Prometheus ServiceMonitor for ArgoCD
apiVersion: monitoring.coreos.com/v1
kind: ServiceMonitor
metadata:
  name: argocd-metrics
  namespace: argocd
spec:
  selector:
    matchLabels:
      app.kubernetes.io/component: metrics
      app.kubernetes.io/name: argocd-metrics
  endpoints:
  - port: metrics
    interval: 30s
    path: /metrics
```

### 2. **Grafana 대시보드**

```json
{
  "dashboard": {
    "title": "ArgoCD Overview",
    "panels": [
      {
        "title": "Application Health",
        "type": "stat",
        "targets": [
          {
            "expr": "argocd_app_health_status"
          }
        ]
      },
      {
        "title": "Sync Status",
        "type": "stat",
        "targets": [
          {
            "expr": "argocd_app_sync_total"
          }
        ]
      }
    ]
  }
}
```

### 3. **알림 설정**

```yaml
# ArgoCD Notification Configuration
apiVersion: v1
kind: ConfigMap
metadata:
  name: argocd-notifications-cm
  namespace: argocd
data:
  service.slack: |
    token: $slack-token
  template.app-deployed: |
    message: |
      {{if eq .serviceType "slack"}}:white_check_mark:{{end}} Application {{.app.metadata.name}} is now running new version.
  trigger.on-deployed: |
    - description: Application is synced and healthy
      send:
      - app-deployed
      when: app.status.operationState.phase in ['Succeeded'] and app.status.health.status == 'Healthy'
```

## 현재 프로젝트에 GitOps 적용

### 1. **Cluster Autoscaler GitOps 구조**

```
gitops-repo/
├── infrastructure/
│   ├── cluster-autoscaler/
│   │   ├── base/
│   │   │   ├── deployment.yaml
│   │   │   ├── rbac.yaml
│   │   │   ├── service-account.yaml
│   │   │   └── kustomization.yaml
│   │   └── overlays/
│   │       ├── dev/
│   │       │   ├── kustomization.yaml
│   │       │   └── patch.yaml
│   │       └── prod/
│   │           ├── kustomization.yaml
│   │           └── patch.yaml
└── argocd/
    └── applications/
        └── cluster-autoscaler.yaml
```

### 2. **ArgoCD Application for Cluster Autoscaler**

```yaml
# argocd/applications/cluster-autoscaler.yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: cluster-autoscaler
  namespace: argocd
spec:
  project: default
  source:
    repoURL: https://github.com/company/gitops-repo
    targetRevision: HEAD
    path: infrastructure/cluster-autoscaler/overlays/prod
  destination:
    server: https://kubernetes.default.svc
    namespace: kube-system
  syncPolicy:
    automated:
      prune: true
      selfHeal: true
    syncOptions:
      - CreateNamespace=false  # kube-system already exists
  revisionHistoryLimit: 10
```

### 3. **Terraform과 GitOps 통합**

```hcl
# terraform/gitops.tf
resource "kubernetes_namespace" "argocd" {
  metadata {
    name = "argocd"
  }
}

resource "helm_release" "argocd" {
  name       = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  namespace  = kubernetes_namespace.argocd.metadata[0].name

  values = [
    yamlencode({
      server = {
        service = {
          type = "LoadBalancer"
        }
        config = {
          "application.instanceLabelKey" = "argocd.argoproj.io/instance"
          "url" = "https://argocd.${var.domain_name}"
        }
      }
      configs = {
        secret = {
          argocdServerAdminPassword = bcrypt(var.argocd_admin_password)
        }
      }
    })
  ]

  depends_on = [module.eks]
}
```

## 모범 사례

### 1. **저장소 구조**
- **단일 저장소 vs 다중 저장소**: 조직 규모에 따라 선택
- **환경별 분리**: dev, staging, prod 환경 분리
- **인프라와 애플리케이션 분리**: 책임 분리

### 2. **브랜치 전략**
- **Main 브랜치**: Production 환경
- **Develop 브랜치**: Development 환경
- **Feature 브랜치**: 기능 개발

### 3. **보안**
- **최소 권한 원칙**: 필요한 최소 권한만 부여
- **Secret 관리**: Sealed Secrets, External Secrets 사용
- **네트워크 정책**: 트래픽 제한

### 4. **모니터링**
- **메트릭 수집**: Prometheus, Grafana 활용
- **알림 설정**: Slack, Email 통합
- **로그 관리**: 중앙화된 로깅

## 문제 해결

### 1. **일반적인 문제들**

#### **동기화 실패**
```bash
# ArgoCD 애플리케이션 상태 확인
kubectl get applications -n argocd

# 동기화 강제 실행
argocd app sync nginx-app --force

# 로그 확인
kubectl logs -n argocd deployment/argocd-application-controller
```

#### **권한 문제**
```bash
# RBAC 확인
kubectl auth can-i create deployments --as=system:serviceaccount:argocd:argocd-application-controller

# ServiceAccount 권한 확인
kubectl describe clusterrolebinding argocd-application-controller
```

### 2. **디버깅 도구**
```bash
# ArgoCD CLI 설치
curl -sSL -o /usr/local/bin/argocd https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
chmod +x /usr/local/bin/argocd

# ArgoCD 로그인
argocd login argocd-server.argocd.svc.cluster.local

# 애플리케이션 상태 확인
argocd app get nginx-app
argocd app history nginx-app
argocd app diff nginx-app
```

## 결론

**GitOps**는 현대적인 클라우드 네이티브 환경에서 인프라와 애플리케이션을 관리하는 효과적인 방법입니다. 주요 이점:

### **장점**
- ✅ **선언적 관리**: 원하는 상태 기반 관리
- ✅ **버전 관리**: 모든 변경사항 추적 가능
- ✅ **자동화**: 수동 개입 최소화
- ✅ **보안**: Pull 기반 모델로 보안 강화
- ✅ **롤백**: 빠른 롤백 가능
- ✅ **감사**: 완전한 변경 이력

### **고려사항**
- ❌ **학습 곡선**: 새로운 도구와 프로세스 학습 필요
- ❌ **복잡성**: 초기 설정 복잡
- ❌ **도구 의존성**: GitOps 도구에 대한 의존성

### **적용 권장 상황**
- Kubernetes 환경
- 다중 환경 관리
- 팀 협업 중요
- 보안 및 컴플라이언스 요구사항
- 자동화된 배포 파이프라인

현재 프로젝트에서는 **Terraform + GitOps 하이브리드** 접근을 권장합니다:
- **Terraform**: 인프라 프로비저닝 (EKS, VPC, IAM)
- **GitOps**: 애플리케이션 및 Kubernetes 리소스 관리

---

**작성일**: 2025-07-25  
**버전**: 1.0  
**작성자**: CGLee
