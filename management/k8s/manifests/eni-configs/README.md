# AWS EKS ENI Configuration

이 디렉토리는 Amazon EKS 클러스터에서 사용할 ENI(Elastic Network Interface) 구성을 위한 매니페스트 파일들을 포함하고 있습니다.

## 파일 구조

```
eni-configs/
├── updated-crd.yaml        # ENI Config를 위한 Custom Resource Definition
├── updated-eniconfig.yaml  # 각 가용 영역별 ENI 설정
└── README.md              # 이 문서
```

## ENI와 CNI 개요

### 구성 시점과 관계

| 구성 요소 | 구성 시점 | 필수 여부 | 설명 |
|----------|-----------|-----------|------|
| **CNI** | EKS 클러스터 생성 시 자동 설치 | 필수 | 기본 네트워킹 계층 제공 |
| **ENI Config** | CNI 설치 후 수동 구성 | 선택 | 특정 AZ에 대한 고급 네트워킹 설정 |

### CNI (Container Network Interface)
- **정의**: 컨테이너 런타임과 네트워크 구현 사이의 표준 인터페이스
- **구성 시점**: EKS 클러스터 생성 시 자동으로 설치됨
- **주요 특징**:
  - 파드 간 통신을 위한 기본 네트워킹 계층 제공
  - VPC 네트워크와 파드 네트워크 연결
  - `aws-node` DaemonSet으로 배포됨

### ENI (Elastic Network Interface)
- **정의**: AWS VPC 내에서 EC2 인스턴스에 연결되는 가상 네트워크 인터페이스
- **주요 특징**:
  - 인스턴스당 여러 개의 ENI 연결 가능
  - 각 ENI는 독립적인 IP 주소, 보안 그룹, MAC 주소 보유
  - VPC 네트워크와 직접 통신 가능
### CNI (Container Network Interface)
- **정의**: 컨테이너 런타임과 네트워크 구현 사이의 표준 인터페이스
- **AWS CNI 플러그인**:
  - 파드에 VPC IP 주소 직접 할당
  - ENI를 동적으로 관리
  - 보안 그룹을 파드 수준에서 적용 가능
  - EKS 클러스터 생성 시 자동으로 설치됨 (관리형 애드온)

## ENI Config (ENIConfig)

### 목적
- 특정 가용 영역(AZ)에서 파드가 사용할 서브넷과 보안 그룹 지정
- 다중 AZ 클러스터에서 유용하게 사용
- 기본 CNI 설정을 특정 AZ에서만 오버라이드할 때 사용

### 언제 필요한가요?
- 특정 AZ에서만 다른 서브넷을 사용해야 할 때
- 특정 AZ에서만 다른 보안 그룹을 적용해야 할 때
- 기본 CNI 설정을 특정 AZ에서만 변경하고 싶을 때

### 설정 예시
```yaml
apiVersion: crd.k8s.amazonaws.com/v1alpha1
kind: ENIConfig
metadata:
  name: ap-northeast-2a  # 가용 영역 이름과 일치해야 함
spec:
  securityGroups:
    - sg-039b070d300ef2fa0  # EKS 클러스터 보안 그룹
  subnet: subnet-079691f73b04a014b  # 해당 가용 영역의 서브넷
```

## 파일 설명

### 1. updated-crd.yaml
ENI Config를 위한 Custom Resource Definition(CRD)을 정의합니다.

### 2. updated-eniconfig.yaml
각 가용 영역별 ENI 설정을 정의합니다. 다음 항목들을 반드시 수정해야 합니다:
- `metadata.name`: 가용 영역 이름 (예: ap-northeast-2a)
- `spec.securityGroups`: 사용할 보안 그룹 ID
- `spec.subnet`: 해당 가용 영역의 서브넷 ID

## 적용 방법

1. CRD 적용:
```bash
kubectl apply -f updated-crd.yaml
```

2. ENI Config 적용:
```bash
kubectl apply -f updated-eniconfig.yaml
```

## 최적화 팁

1. **Warm ENI Target 설정** (선택사항):
   ```bash
   kubectl set env daemonset aws-node -n kube-system WARM_ENI_TARGET=2
   ```
   - 미리 준비해둘 ENI 수를 지정하여 파드 생성 지연 시간 감소

2. **보안 그룹 관리**:
   - 필요한 최소한의 보안 그룹 규칙만 적용
   - 노드 보안 그룹과 파드 보안 그룹 분리 고려

3. **서브넷 계획**:
   - 충분한 IP 주소 공간 확보 (파드당 1개의 IP 필요)
   - 가용 영역별로 균등하게 서브넷 분배

## 문제 해결

### ENI 할당 실패 시 확인 사항
1. 서브넷에 사용 가능한 IP 주소가 충분한지 확인
2. 보안 그룹이 올바르게 구성되었는지 확인
3. IAM 역할에 필요한 권한이 부여되었는지 확인

### 로그 확인
```bash
# CNI 플러그인 로그 확인
kubectl logs -n kube-system -l k8s-app=aws-node
```

## 참고 자료
- [Amazon EKS CNI Plugin](https://github.com/aws/amazon-vpc-cni-k8s)
- [EKS Networking](https://docs.aws.amazon.com/eks/latest/userguide/networking.html)
- [ENI Configuration](https://docs.aws.amazon.com/eks/latest/userguide/cni-eni.html)
