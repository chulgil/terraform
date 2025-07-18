# AWS API Gateway 서비스 디스커버리 및 모니터링 가이드

## 1. 서비스 디스커리 개요

AWS API Gateway는 자체적으로 서비스 디스커리 UI를 제공하지 않지만, 다음과 같은 AWS 서비스 및 오픈소스 도구들과 연동하여 구현할 수 있습니다.

## 2. AWS 서비스 조합을 통한 구현

### 2.1 AWS App Mesh + AWS Cloud Map

**개요**
- **App Mesh**: 서비스 메시 솔루션으로 서비스 디스커버리 기능 제공
- **Cloud Map**: 클라우드 리소스 검색 및 등록 서비스

**설치 및 구성**

1. App Mesh 컨트롤러 설치:
   ```bash
   # App Mesh 컨트롤러 설치
   helm repo add eks https://aws.github.io/eks-charts
   helm install appmesh-controller eks/appmesh-controller -n appmesh-system
   ```

2. 서비스 메시 정의:
   ```yaml
   apiVersion: appmesh.k8s.aws/v1beta2
   kind: Mesh
   metadata:
     name: my-mesh
   spec:
     namespaceSelector:
       matchLabels:
         mesh: my-mesh
   ```

3. 가상 서비스 정의:
   ```yaml
   apiVersion: appmesh.k8s.aws/v1beta2
   kind: VirtualService
   metadata:
     name: my-service
   spec:
     awsName: my-service.default.svc.cluster.local
     provider:
       virtualRouter:
         virtualRouterName: my-service-router
   ```

## 3. 서드파티 도구 연동

### 3.1 Kubernetes Dashboard

**설치**
```bash
# 대시보드 설치
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.7.0/aio/deploy/recommended.yaml

# 대시보드 접속
kubectl proxy
```

**특징**
- 클러스터 리소스 시각화
- 네임스페이스별 리소스 모니터링
- 로그 및 쉘 접근 기능

### 3.2 Lens IDE

**주요 기능**
- 쿠버네티스 클러스터 시각화
- 실시간 모니터링
- 통합 터미널
- 리소스 편집기

## 4. API Gateway Developer Portal

**주요 기능**
- API 문서화
- 개발자 셀프 서비스 포털
- API 키 관리
- 사용량 계획 관리

**활성화 방법**
1. API Gateway 콘솔 접속
2. "Developer Portal" 선택
3. 사용자 정의 테마 및 브랜딩 설정
4. API 문서 자동 생성

## 5. 모니터링 및 관측성

### 5.1 Grafana + Prometheus 스택

**설치**
```bash
# kube-prometheus-stack 설치
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm install kube-prometheus-stack prometheus-community/kube-prometheus-stack
```

**주요 대시보드**
- 서비스별 트래픽 모니터링
- 지연 시간 및 오류율 추적
- 자원 사용량 모니터링
- 사용자 정의 경고 설정

### 5.2 AWS X-Ray

**통합 방법**
1. X-Ray 데몬 사이드카 컨테이너 추가
2. 애플리케이션에 X-Ray SDK 통합
3. IAM 역할에 X-Ray 권한 추가

**주요 기능**
- 분산 트레이싱
- 서비스 맵 시각화
- 성능 문제 진단

## 6. 권장 아키텍처

```
[API Gateway] → [ALB Ingress] → [App Mesh] → [마이크로서비스]
       ↑               ↑              ↑
 [CloudWatch] ← [X-Ray]    [Cloud Map]
       ↓               ↓
  [Grafana]      [AWS Console]
```

## 7. 모범 사례

1. **서비스 디스커버리**
   - App Mesh와 Cloud Map을 조합한 서비스 메시 구현
   - 서비스 간 통신은 서비스 디스커버리를 통해 관리

2. **모니터링**
   - CloudWatch와 X-Ray를 통한 종합 모니터링
   - 사용자 정의 지표 및 대시보드 구성

3. **보안**
   - IAM 역할을 통한 세분화된 접근 제어
   - WAF 연동을 통한 보안 강화

4. **확장성**
   - Auto Scaling 그룹을 통한 자동 확장
   - 지역 간 부하 분산 구성

## 8. 문제 해결

### 8.1 일반적인 이슈
- **서비스 검색 실패**: 네임스페이스 라벨 확인
- **지연 시간 증가**: X-Ray 트레이스 분석
- **인증 오류**: IAM 역할 및 정책 점검

### 8.2 로그 확인
```bash
# App Mesh 컨트롤러 로그
kubectl logs -n appmesh-system -l app.kubernetes.io/name=appmesh-controller

# Envoy 프록시 로그
kubectl logs <pod-name> -c envoy
```

## 9. 추가 자료
- [AWS App Mesh 공식 문서](https://docs.aws.amazon.com/app-mesh/)
- [Kubernetes 대시보드 가이드](https://kubernetes.io/ko/docs/tasks/access-application-cluster/web-ui-dashboard/)
- [Grafana 대시보드 템플릿](https://grafana.com/grafana/dashboards/)
