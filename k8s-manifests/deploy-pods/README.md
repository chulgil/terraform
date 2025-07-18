# Kubernetes Manifests for Application Deployment

이 디렉토리는 쿠버네티스 클러스터에 애플리케이션을 배포하기 위한 매니페스트 파일들을 포함하고 있습니다.

## 파일 구조

```
deploy-pods/
├── nginx-deployment.yaml    # Nginx 웹 서버 배포용 Deployment
├── fluentd-daemonset.yaml  # 로그 수집을 위한 Fluentd DaemonSet
├── fluentd-configmap.yaml  # Fluentd 설정을 위한 ConfigMap
└── fluentd-rbac.yaml       # Fluentd가 필요한 권한을 위한 RBAC 설정
```

## 1. Nginx Deployment (`nginx-deployment.yaml`)

Nginx 웹 서버를 배포하기 위한 Deployment 리소스입니다.

### 주요 특징:
- **복제본 수**: 3개 (replicas: 3)
- **이미지**: nginx:1.25.3 (최신 안정 버전)
- **리소스 제한**:
  - CPU: 100m 요청 / 500m 제한
  - 메모리: 128Mi 요청 / 512Mi 제한
- **보안 설정**:
  ```yaml
  securityContext:
    allowPrivilegeEscalation: false
    runAsNonRoot: true
    seccompProfile:
      type: RuntimeDefault
  ```
  - 권한 상승 방지
  - root가 아닌 사용자로 실행
  - seccomp 프로필 적용

## 2. Fluentd DaemonSet (`fluentd-daemonset.yaml`)

모든 노드에서 로그를 수집하기 위한 DaemonSet입니다.

### 주요 특징:
- **이미지**: fluent/fluentd-kubernetes-daemonset
- **네임스페이스**: kube-system
- **볼륨 마운트**:
  - /var/log (호스트 로그 디렉토리)
  - /var/lib/docker/containers (도커 컨테이너 로그)
- **리소스 제한**:
  - CPU: 100m 요청
  - 메모리: 200Mi 요청 / 400Mi 제한

## 3. Fluentd ConfigMap (`fluentd-configmap.yaml`)

Fluentd의 설정을 정의하는 ConfigMap입니다.

### 주요 구성:
- 로그 수집 소스 설정
- Elasticsearch 출력 구성
- 버퍼 및 재시도 정책

## 4. Fluentd RBAC (`fluentd-rbac.yaml`)

Fluentd가 필요한 권한을 부여하기 위한 RBAC 설정입니다.

### 구성 요소:
- **ServiceAccount**: fluentd
- **ClusterRole**: 파드와 네임스페이스 조회 권한
- **ClusterRoleBinding**: 서비스 계정과 역할 연결

## 배포 방법

```bash
# 1. Fluentd RBAC 설정 적용
kubectl apply -f fluentd-rbac.yaml

# 2. Fluentd ConfigMap 적용
kubectl apply -f fluentd-configmap.yaml

# 3. Fluentd DaemonSet 적용
kubectl apply -f fluentd-daemonset.yaml

# 4. Nginx Deployment 적용
kubectl apply -f nginx-deployment.yaml
```

## 모니터링 및 문제 해결

### 파드 상태 확인
```bash
kubectl get pods -A
```

### 로그 확인 (Fluentd)
```bash
kubectl logs -n kube-system -l k8s-app=fluentd-logging
```

### 로그 확인 (Nginx)
```bash
kubectl logs -l app=nginx
```

### 이벤트 로그 확인
```bash
kubectl get events --sort-by='.metadata.creationTimestamp'
```

## 보안 고려사항

1. **이미지 버전**: 항상 최신의 안정 버전 사용
2. **리소스 제한**: 모든 컨테이너에 적절한 리소스 제한 설정
3. **보안 컨텍스트**: 최소 권한 원칙에 따라 보안 컨텍스트 설정
4. **네트워크 정책**: 필요한 경우 NetworkPolicy를 사용한 네트워크 트래픽 제한
