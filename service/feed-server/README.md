# 🍽️ Feed Server Application

**Spring Boot 3.1 + Java 21 기반 Argo Rollouts Blue/Green 배포 애플리케이션**

![Kubernetes](https://img.shields.io/badge/kubernetes-326CE5?style=for-the-badge&logo=kubernetes&logoColor=white)
![Argo](https://img.shields.io/badge/argo-EF7B4D?style=for-the-badge&logo=argo&logoColor=white)
![GitOps](https://img.shields.io/badge/GitOps-4285F4?style=for-the-badge&logo=git&logoColor=white)

## 📋 **개요**

Feed Server는 Spring Boot 3.1과 Java 21을 기반으로 하며, Argo Rollouts를 활용한 고급 배포 전략(Blue/Green, Canary)을 구현한 데모 애플리케이션입니다. 

### **🎯 주요 특징**
- **☕ Java 21**: 최신 LTS 버전 사용
- **🌱 Spring Boot 3.1**: 최신 Spring Boot 프레임워크
- **✅ Argo Rollouts**: Blue/Green 배포 전략
- **🔄 GitOps**: ArgoCD 연동 자동 배포
- **🌐 HTTPS**: AWS ACM 인증서 기반 보안 통신
- **📊 모니터링**: 배포 상태 실시간 추적
- **🚀 무중단 배포**: 트래픽 손실 없는 업데이트
- **🏥 Health Check**: Spring Actuator 기반 헬스체크
- **⚙️ ConfigMap**: 환경별 설정 관리

---

## 🏗️ **아키텍처**

```mermaid
graph TB
    subgraph "External Access"
        User[👤 User] --> ALB[🌐 AWS ALB]
        ALB --> |HTTPS| Ingress[📡 K8s Ingress]
    end
    
    subgraph "Kubernetes Cluster"
        Ingress --> Service[🔄 Active Service]
        Service --> |Blue/Green| Rollout[🎯 Argo Rollout]
        
        subgraph "Blue/Green Deployment"
            Rollout --> Blue[🔵 Blue Pods]
            Rollout --> Green[🟢 Green Pods]
            Preview[👁️ Preview Service] --> Green
        end
        
        subgraph "Configuration"
            ConfigMap[📋 ConfigMap] --> Rollout
            ConfigMap --> |application-dev.yml| App[🍽️ Feed Server App]
        end
        
        subgraph "GitOps"
            ArgoCD[🔧 ArgoCD] --> |Watch| Git[📝 Git Repo]
            ArgoCD --> |Deploy| Rollout
        end
    end
    
    subgraph "Monitoring"
        Dashboard[📊 Rollouts Dashboard] --> Rollout
    end
```

---

## 🚀 **빠른 시작**

### **1. 전체 배포 (한번에 적용)**

```bash
# 1. 개발 환경 배포
kubectl apply -k service/feed-server/k8s/overlays/dev

# 2. 배포 상태 확인
kubectl argo rollouts get rollout feed-server-rollout -n feed-server-dev

# 3. 웹 대시보드 접속
open https://rollouts-dev.barodream.com/rollouts/
```

### **2. Blue/Green 배포 테스트**

```bash
# 새 버전 배포 (이미지 변경)
kubectl argo rollouts set image feed-server-rollout \
  -n feed-server-dev \
  feed-server=421114334882.dkr.ecr.ap-northeast-2.amazonaws.com/feed-server:latest

# 배포 진행 상황 실시간 확인
kubectl argo rollouts get rollout feed-server-rollout \
  -n feed-server-dev --watch

# 수동 프로모션 (Blue → Green 전환)
kubectl argo rollouts promote feed-server-rollout \
  -n feed-server-dev
```

---

## 📁 **프로젝트 구조**

```
service/feed-server/
├── README.md                          # 📖 이 문서
├── Dockerfile                         # 🐳 Docker 이미지 빌드
├── .dockerignore                      # 🚫 Docker 빌드 제외 파일
├── src/                               # 🔧 소스코드
│   ├── build.gradle                   # 📦 Gradle 빌드 설정
│   ├── gradle/                        # 🎯 Gradle Wrapper
│   └── src/                           # 💻 애플리케이션 소스
└── k8s/                               # ☸️ Kubernetes 매니페스트
    ├── base/                          # 📦 기본 리소스
    │   ├── kustomization.yaml         # 📋 Base 설정
    │   ├── rollout.yaml               # 🎯 Argo Rollout 정의
    │   ├── service.yaml               # 🔄 Active Service
    │   ├── service-preview.yaml       # 👁️ Preview Service
    │   └── configmap.yaml             # 📋 기본 ConfigMap
    └── overlays/                      # 🌍 환경별 설정
        └── dev/                       # 🔧 개발 환경
            ├── kustomization.yaml     # 📋 Dev 설정
            ├── namespace.yaml         # 📂 네임스페이스
            ├── ingress.yaml           # 🌐 HTTPS 인그레스
            ├── rollout-patch.yaml     # 🔧 Dev 환경 Rollout 패치
            └── configmap-patch.yaml   # 🔧 Dev 환경 ConfigMap 패치
```

---

## ⚙️ **설정 상세**

### **🎯 Rollout 전략 (Blue/Green)**

```yaml
# Blue/Green 배포 설정
strategy:
  blueGreen:
    activeService: feed-server         # 활성 트래픽
    previewService: feed-server-preview # 미리보기 서비스
    autoPromotionEnabled: true         # 자동 승인 (개발 환경)
    scaleDownDelaySeconds: 10          # 정리 지연 시간 (개발 환경)
```

### **📋 ConfigMap 설정**

#### **Base ConfigMap** (`base/configmap.yaml`)
```yaml
data:
  application.yml: |
    spring:
      application:
        name: feed-server
      # 기본 설정들...
```

#### **Dev ConfigMap Patch** (`overlays/dev/configmap-patch.yaml`)
```yaml
data:
  application-dev.yml: |
    spring:
      profiles:
        active: dev
      # 개발 환경 전용 설정들...
```

### **🌐 도메인 및 SSL**

| 환경 | 도메인 | 용도 | SSL |
|------|--------|------|-----|
| **Dev** | `feed-dev.barodream.com` | 활성 서비스 | ✅ AWS ACM |
| **Preview** | 내부 서비스 | Blue/Green 테스트 | ✅ 클러스터 내 |

### **📊 모니터링 대시보드**

- **URL**: https://rollouts-dev.barodream.com/rollouts/
- **네임스페이스**: `feed-server-dev`
- **Rollout**: `feed-server-rollout`

---

## 🔧 **운영 가이드**

### **💻 주요 명령어**

```bash
# 📊 상태 확인
kubectl argo rollouts get rollout feed-server-rollout -n feed-server-dev
kubectl argo rollouts list rollouts -n feed-server-dev

# 🚀 배포 관리
kubectl argo rollouts set image feed-server-rollout -n feed-server-dev feed-server=<new-image>
kubectl argo rollouts promote feed-server-rollout -n feed-server-dev  # 승인
kubectl argo rollouts abort feed-server-rollout -n feed-server-dev    # 중단
kubectl argo rollouts retry feed-server-rollout -n feed-server-dev    # 재시도

# 🔍 히스토리 확인
kubectl argo rollouts history rollout feed-server-rollout -n feed-server-dev
kubectl argo rollouts undo feed-server-rollout -n feed-server-dev     # 롤백

# 📋 ConfigMap 확인
kubectl get configmap feed-server-config -n feed-server-dev -o yaml
kubectl describe configmap feed-server-config -n feed-server-dev
```

### **🐛 트러블슈팅**

<details>
<summary><strong>🔧 일반적인 문제 해결</strong></summary>

#### **1. Rollout이 Degraded 상태**
```bash
# 원인 확인
kubectl describe rollout feed-server-rollout -n feed-server-dev

# Service selector 문제인 경우
kubectl get service feed-server -n feed-server-dev -o yaml | grep selector -A 5
```

#### **2. 이미지 Pull 실패**
```bash
# Pod 상태 확인
kubectl get pods -n feed-server-dev
kubectl describe pod <pod-name> -n feed-server-dev
```

#### **3. ConfigMap 마운트 문제**
```bash
# ConfigMap 존재 확인
kubectl get configmap -n feed-server-dev

# Pod에서 ConfigMap 마운트 확인
kubectl exec -it <pod-name> -n feed-server-dev -- ls -la /app/config/
```

#### **4. 인그레스 접속 불가**
```bash
# ALB 상태 확인
kubectl get ingress -n feed-server-dev
kubectl describe ingress feed-server-ingress -n feed-server-dev

# DNS 확인
nslookup feed-dev.barodream.com
```

</details>

---

## 🎮 **배포 시나리오 예제**

### **🟢 시나리오 1: 정상 Blue/Green 배포**

```bash
# 1. 현재 상태 확인
kubectl argo rollouts get rollout feed-server-rollout -n feed-server-dev

# 2. 새 버전 배포
kubectl argo rollouts set image feed-server-rollout \
  -n feed-server-dev \
  feed-server=421114334882.dkr.ecr.ap-northeast-2.amazonaws.com/feed-server:latest

# 3. Preview 서비스에서 테스트
kubectl port-forward svc/feed-server-preview -n feed-server-dev 8080:8080
# http://localhost:8080 접속하여 테스트

# 4. 테스트 통과 시 승인 (자동 승인 설정됨)
# kubectl argo rollouts promote feed-server-rollout -n feed-server-dev

# 5. 결과 확인
kubectl argo rollouts get rollout feed-server-rollout -n feed-server-dev
```

### **🔴 시나리오 2: 문제 발생 시 롤백**

```bash
# 1. 문제가 있는 배포 중단
kubectl argo rollouts abort feed-server-rollout -n feed-server-dev

# 2. 이전 버전으로 롤백
kubectl argo rollouts undo rollout feed-server-rollout -n feed-server-dev

# 3. 상태 확인
kubectl argo rollouts get rollout feed-server-rollout -n feed-server-dev
```

### **🔧 시나리오 3: ConfigMap 설정 변경**

```bash
# 1. ConfigMap 패치 파일 수정
# service/feed-server/k8s/overlays/dev/configmap-patch.yaml

# 2. 변경사항 적용
kubectl apply -k service/feed-server/k8s/overlays/dev

# 3. Pod 재시작 (필요시)
kubectl rollout restart rollout feed-server-rollout -n feed-server-dev
```

---

## 🔗 **관련 리소스**

| 리소스 | 링크 | 설명 |
|--------|------|------|
| **Argo Rollouts** | [공식 문서](https://argoproj.github.io/argo-rollouts/) | 고급 배포 전략 |
| **Kustomize** | [공식 문서](https://kustomize.io/) | Kubernetes 설정 관리 |
| **ArgoCD** | [프로젝트 페이지](../../../management/argo-cd/) | GitOps 플랫폼 |
| **Rollouts Dashboard** | https://rollouts-dev.barodream.com | 배포 모니터링 |

---

## 📈 **확장 계획**

### **🎯 단기 계획**
- [ ] **Canary 배포** 전략 추가
- [ ] **메트릭 기반 자동 승인** (Prometheus 연동)
- [ ] **알림 시스템** (Slack/Discord)
- [ ] **환경별 ConfigMap** (staging, prod)

### **🚀 장기 계획**
- [ ] **멀티 클러스터** 배포
- [ ] **A/B 테스트** 프레임워크
- [ ] **성능 테스트** 자동화
- [ ] **Secret 관리** (AWS Secrets Manager 연동)

---

## 👥 **기여하기**

1. **Fork** 이 저장소
2. **Feature branch** 생성 (`git checkout -b feature/amazing-feature`)
3. **변경사항 커밋** (`git commit -m 'Add some amazing feature'`)
4. **브랜치에 Push** (`git push origin feature/amazing-feature`)
5. **Pull Request** 생성

---

## 📄 **라이센스**

이 프로젝트는 **MIT 라이센스** 하에 배포됩니다. 자세한 내용은 `LICENSE` 파일을 참조하세요.

---

## 📞 **지원**

- **📧 이메일**: [admin@barodream.com](mailto:admin@barodream.com)
- **💬 슬랙**: `#devops-support`
- **📋 이슈**: [GitHub Issues](https://github.com/chulgil/terraform/issues)

---

<div align="center">

**🚀 Made with ❤️ using Argo Rollouts & Kubernetes**

[![Argo Rollouts](https://img.shields.io/badge/Argo-Rollouts-orange)](https://argoproj.github.io/argo-rollouts/)
[![Kubernetes](https://img.shields.io/badge/Kubernetes-326CE5)](https://kubernetes.io/)
[![GitOps](https://img.shields.io/badge/GitOps-Ready-green)](https://www.gitops.tech/)

</div> 