# 🚀 Service Applications - Hybrid Pattern

이 디렉토리는 **하이브리드 GitOps 패턴**으로 구성된 애플리케이션들을 포함합니다.

## 📋 **구조 개요**

```
service/
├── bubblepool/           # BubblePool 애플리케이션
│   ├── k8s/
│   │   ├── base/         # 기본 Kubernetes 매니페스트
│   │   └── overlays/     # 환경별 Kustomize 오버레이
│   │       ├── dev/      # 개발 환경
│   │       ├── staging/  # 스테이징 환경 (예정)
│   │       └── prod/     # 프로덕션 환경 (예정)
│   └── src/              # 소스 코드 (선택적)
├── guestbook/            # GuestBook 애플리케이션
│   ├── k8s/
│   │   ├── base/
│   │   └── overlays/
│   │       └── dev/
│   └── src/
└── README.md            # 이 파일
```

## 🎯 **하이브리드 패턴의 특징**

### **✅ 장점**
- 📦 **단일 저장소**: 모든 것을 하나의 저장소에서 관리
- 🔄 **일관된 설정**: 공통 설정과 정책의 쉬운 적용
- 🚀 **빠른 시작**: 초기 설정과 배포가 간단
- 📊 **통합 관리**: ArgoCD App of Apps 패턴으로 중앙 관리

### **⚖️ 고려사항**
- 🔐 **권한 관리**: 세밀한 접근 제어 제한
- 📈 **확장성**: 팀/프로젝트 증가 시 복잡도 증가

## 🛠️ **애플리케이션 목록**

| 애플리케이션 | 설명 | 환경 | 상태 |
|-------------|------|------|------|
| **BubblePool** | 데모 웹 애플리케이션 | dev | ✅ Ready |
| **GuestBook** | 전통적인 방명록 앱 | dev | ✅ Ready |

## 🚀 **배포 방법**

### **1. ArgoCD를 통한 자동 배포**
```bash
# App of Apps 패턴으로 모든 애플리케이션 배포
kubectl apply -f management/argo-cd/applications/app-of-apps.yaml

# 개별 애플리케이션 배포
kubectl apply -f management/argo-cd/applications/projects/dev-apps.yaml
```

### **2. 수동 배포 (테스트용)**
```bash
# BubblePool 배포
kubectl kustomize service/bubblepool/k8s/overlays/dev | kubectl apply -f -

# GuestBook 배포  
kubectl kustomize service/guestbook/k8s/overlays/dev | kubectl apply -f -
```

## 🔍 **애플리케이션 접근**

### **BubblePool**
- **Namespace**: `bubblepool-dev`
- **Service**: `bubblepool.bubblepool-dev.svc.cluster.local:80`
- **Ingress**: `bubblepool-dev.your-domain.com` (설정 필요)

### **GuestBook**
- **Namespace**: `guestbook-dev`
- **Service**: `guestbook.guestbook-dev.svc.cluster.local:80`
- **Ingress**: `guestbook-dev.your-domain.com` (설정 필요)

## 📊 **환경별 설정**

### **Dev 환경 특징**
- 🔧 **리소스 최소화**: CPU/Memory 제한으로 비용 절약
- 🐛 **디버그 모드**: 상세 로깅 및 디버깅 정보
- 🚧 **자동 동기화**: Git 변경사항 즉시 반영
- 🔄 **빠른 반복**: 개발자 친화적 설정

## 🔧 **Kustomize 구조**

각 애플리케이션은 다음과 같은 Kustomize 구조를 따릅니다:

```yaml
# base/kustomization.yaml
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization
resources:
- deployment.yaml
- service.yaml
- configmap.yaml

# overlays/dev/kustomization.yaml  
bases:
- ../../base
patchesStrategicMerge:
- deployment-patch.yaml
- configmap-patch.yaml
```

## 🎭 **Argo Rollouts 지원**

### **고급 배포 전략**
- 🔄 **Blue/Green**: 무중단 배포
- 📈 **Canary**: 점진적 배포
- 📊 **Analysis**: 자동 성능 분석

### **예시**
```bash
# Rollout 리소스 생성 (향후)
kubectl apply -f service/bubblepool/k8s/rollouts/blue-green.yaml
```

## 🔍 **모니터링 및 관찰성**

### **Prometheus 메트릭**
- 모든 Pod에 `prometheus.io/scrape: "true"` 어노테이션
- HTTP 메트릭 자동 수집

### **로깅**
- 환경별 로그 레벨 설정
- CloudWatch 연동 (ALB 로그)

## 🔄 **CI/CD 통합**

### **GitOps 워크플로우**
1. 🔧 **개발**: 로컬에서 코드 수정
2. 📝 **커밋**: Git에 매니페스트 변경사항 푸시
3. 🚀 **자동 배포**: ArgoCD가 변경사항 감지 및 배포
4. ✅ **검증**: Health Check 및 동기화 상태 확인

## 🆘 **트러블슈팅**

### **일반적인 문제**

#### **Kustomize 빌드 오류**
```bash
# 매니페스트 검증
kubectl kustomize service/bubblepool/k8s/overlays/dev --dry-run
```

#### **ArgoCD 동기화 실패**
```bash
# ArgoCD 앱 상태 확인
kubectl get applications -n argocd
kubectl describe application bubblepool-dev -n argocd
```

#### **Pod 시작 실패**
```bash
# Pod 로그 확인
kubectl logs -n bubblepool-dev -l app=bubblepool
kubectl describe pod -n bubblepool-dev -l app=bubblepool
```

## 🎯 **다음 단계**

### **단기 목표**
- [ ] Staging/Prod 환경 오버레이 추가
- [ ] Argo Rollouts 배포 전략 구현
- [ ] 모니터링 대시보드 설정

### **장기 목표**
- [ ] 개별 저장소로 마이그레이션 고려
- [ ] 멀티 클러스터 배포 지원
- [ ] 고급 보안 정책 적용

---

**💡 하이브리드 패턴은 GitOps 여정의 첫 단계로 최적입니다. 팀이 성장하면 개별 저장소 패턴으로 진화할 수 있습니다!** 