# Amazon EFS CSI Driver 구성 가이드

이 디렉토리에는 Amazon EFS(Elastic File System)를 Kubernetes에서 영구 스토리지로 사용하기 위한 CSI(Container Storage Interface) 드라이버 구성 파일들이 포함되어 있습니다. 이 문서에서는 각 컴포넌트의 역할, 상호 관계, 그리고 전체적인 아키텍처에 대해 상세히 설명합니다.

## EKS 스토리지 아키텍처 개요

EKS에서 EFS를 영구 스토리지로 사용하기 위해서는 다음과 같은 컴포넌트들이 필요합니다:

1. **CSI 드라이버**: Kubernetes와 AWS EFS 간의 통신을 담당
2. **StorageClass**: 동적 프로비저닝을 위한 스토리지 클래스 정의
3. **PersistentVolume (PV)**: 실제 스토리지 리소스를 추상화한 오브젝트
4. **PersistentVolumeClaim (PVC)**: 파드가 스토리지를 요청하기 위한 오브젝트
5. **Pod**: 애플리케이션을 실행하는 컨테이너 그룹

## 정적 프로비저닝 vs 동적 프로비저닝

이 디렉토리에는 두 가지 방식의 예제가 포함되어 있습니다:

- **정적 프로비저닝 (Static Provisioning)**: `static-pv.yaml`
  - 관리자가 미리 PV를 수동으로 생성
  - EFS 파일 시스템이 이미 존재해야 함
  - 세밀한 제어가 필요할 때 유용

- **동적 프로비저닝 (Dynamic Provisioning):** `storageclass.yaml` + `efs-pv-claim.yaml`
  - PVC 생성 시 자동으로 PV가 프로비저닝됨
  - StorageClass를 통해 프로비저닝 방식을 정의
  - 유연하고 관리가 용이

## 컴포넌트 관계도

```
+------------------+       +------------------+       +------------------+
|  storageclass.yaml       efs-pv-claim.yaml        deploy-pod1/2.yaml  |
|  (스토리지 클래스)        (영구 볼륨 클레임)        (애플리케이션 파드)    |
+--------+--------+       +--------+--------+       +---------+---------+
         |                         |                          |
         | 1. 참조                 | 2. 바인딩                | 3. 마운트
         |                         |                          |
         v                         v                          v
+--------+-------------------------+--------------------------+---------+
|                                                                      |
|                     AWS EFS CSI Driver                                |
|                                                                      |
+----------------------------------+-------------------------------------+
                                   |
                                   | 4. EFS 마운트
                                   |
                          +--------v--------+
                          |                 |
                          |  AWS EFS        |
                          |  (파일 시스템)    |
                          |                 |
                          +-----------------+
```

## 1. 정적 프로비저닝 (Static Provisioning)

### `static-pv.yaml`
- **역할**: 미리 프로비저닝된 EFS 볼륨을 Kubernetes 리소스로 정의합니다.
- **주요 설정**:
  - `capacity.storage`: 볼륨 크기 (EFS는 실제로는 프로비저닝된 용량에 제한되지 않음)
  - `accessModes: ReadWriteMany`: 다중 노드에서 동시 읽기/쓰기 가능
  - `storageClassName: efs-sc`: 사용할 스토리지 클래스 지정
  - `csi.driver: efs.csi.aws.com`: EFS CSI 드라이버 사용
  - `csi.volumeHandle`: EFS 파일 시스템 ID
- **동작 방식**:
  1. 관리자가 EFS 파일 시스템을 미리 생성
  2. PV 리소스를 생성하여 EFS 파일 시스템을 참조
  3. PVC가 생성되면 이 PV에 바인딩됨
  4. 파드는 PVC를 통해 EFS 볼륨에 접근

## 2. 동적 프로비저닝 (Dynamic Provisioning)

### `storageclass.yaml`
- **역할**: 동적 프로비저닝을 위한 스토리지 클래스를 정의합니다.
- **주요 설정**:
  - `provisioner: efs.csi.aws.com`: EFS CSI 드라이버 사용
  - `provisioningMode: efs-ap`: EFS Access Point를 사용한 동적 프로비저닝
  - `fileSystemId`: 사용할 EFS 파일 시스템 ID
  - `directoryPerms`: 생성될 디렉토리 권한
  - `gidRangeStart/End`: 그룹 ID 범위
  - `basePath`: EFS 내 기본 경로
- **동작 방식**:
  1. PVC가 생성되면 StorageClass에 정의된 설정으로 EFS Access Point가 자동 생성됨
  2. EFS Access Point는 지정된 디렉토리 권한과 UID/GID를 가짐
  3. PV가 자동으로 생성되어 EFS Access Point에 연결됨
  4. PVC는 이 PV에 바인딩됨

### `efs-pv-claim.yaml`
- **역할**: 파드가 스토리지를 요청하기 위한 클레임을 정의합니다.
- **주요 설정**:
  - `storageClassName: efs-sc`: 사용할 스토리지 클래스 지정
  - `accessModes: [ReadWriteMany]`: 다중 노드에서 읽기/쓰기 가능
  - `resources.requests.storage`: 요청할 스토리지 크기 (EFS는 프로비저닝된 용량에 제한되지 않음)
- **동작 방식**:
  1. PVC가 생성되면 지정된 StorageClass를 사용하여 PV가 자동으로 프로비저닝됨
  2. PVC는 파드에 마운트되어 EFS 스토리지에 접근

## 3. 애플리케이션 파드

### `deploy-pod1.yaml`
- **역할**: EFS에 데이터를 쓰는 애플리케이션 파드를 정의합니다.
- **주요 설정**:
  - `volumeMounts.mountPath: /dpod1`: EFS가 마운트될 경로
  - `readOnly: false`: 쓰기 가능 모드로 마운트
  - `command`: 주기적으로 날짜를 파일에 기록
- **관계**:
  - `efs-pv-claim.yaml`에 정의된 PVC를 마운트합니다.

### `deploy-pod2.yaml`
- **역할**: EFS에서 데이터를 읽는 애플리케이션 파드를 정의합니다.
- **주요 설정**:
  - `volumeMounts.mountPath: /dpod2`: EFS가 마운트될 경로
  - `readOnly: true`: 읽기 전용 모드로 마운트
  - `command`: 주기적으로 파일 내용을 읽어 출력
- **관계**:
  - `efs-pv-claim.yaml`에 정의된 동일한 PVC를 마운트합니다.
  - `deploy-pod1.yaml`이 쓴 파일을 읽을 수 있습니다.

## 4. 배포 및 운영 가이드

### 배포 흐름

1. **스토리지 클래스 생성**
   - EFS CSI 드라이버가 사용할 스토리지 클래스를 정의합니다.
   ```bash
   kubectl apply -f storageclass.yaml
   ```

2. **PVC 생성**
   - EFS 스토리지 클래스를 사용하는 PVC를 생성합니다.
   ```bash
   kubectl apply -f efs-pv-claim.yaml
   ```

3. **파드 배포**
   - EFS 볼륨을 사용하는 파드들을 배포합니다.
   ```bash
   kubectl apply -f deploy-pod1.yaml
   kubectl apply -f deploy-pod2.yaml
   ```

### 검증 방법

1. **파드 상태 확인**
   ```bash
   kubectl get pods -n dev-csi-file-pv
   ```

2. **PVC/PV 상태 확인**
   ```bash
   kubectl get pvc,pv -n dev-csi-file-pv
   ```

3. **데이터 쓰기/읽기 확인**
   - Pod1이 데이터를 쓰고 있는지 확인:
     ```bash
     kubectl logs -f deploy-pod1 -n dev-csi-file-pv
     ```
   - Pod2가 데이터를 읽고 있는지 확인:
     ```bash
     kubectl logs -f deploy-pod2 -n dev-csi-file-pv
     ```

## Static PV 방식 배포 (동적 프로비저닝 문제 시)

동적 프로비저닝에서 "failed to get target node: resource name may not be empty" 에러가 발생하는 경우, Static PV 방식을 사용할 수 있습니다.

### 📋 Static PV 적용 가이드

#### **1단계: 기존 리소스 정리**
```bash
# 기존 Pod들 삭제
kubectl delete pod deploy-pod1 deploy-pod2 -n dev-csi-file-pv

# 기존 PVC 삭제 (동적 프로비저닝 방식)
kubectl delete pvc efs-pv-claim -n dev-csi-file-pv
```

#### **2단계: StorageClass 적용**
```bash
kubectl apply -f storageclass.yaml
```

#### **3단계: Static PV와 PVC 적용**
```bash
kubectl apply -f static-pv.yaml
```

#### **4단계: PV와 PVC 상태 확인**
```bash
# PV 상태 확인 (Available → Bound로 변경되어야 함)
kubectl get pv

# PVC 상태 확인 (Pending → Bound로 변경되어야 함)
kubectl get pvc -n dev-csi-file-pv
```

#### **5단계: Pod 생성**
PVC가 `Bound` 상태가 되면:
```bash
kubectl apply -f deploy-pod1.yaml
kubectl apply -f deploy-pod2.yaml
```

#### **6단계: 최종 상태 확인**
```bash
kubectl get pods -n dev-csi-file-pv
kubectl get pvc -n dev-csi-file-pv
```

#### **7단계: EFS 마운트 테스트**
Pod들이 Running 상태가 되면:
```bash
kubectl exec -it deploy-pod1 -n dev-csi-file-pv -- ls -la /dpod1
kubectl exec -it deploy-pod2 -n dev-csi-file-pv -- cat /dpod2/out
```

### 🔍 Static PV vs 동적 프로비저닝 차이점

| 구분 | 동적 프로비저닝 | Static PV |
|------|----------------|----------|
| **EFS Access Point** | 자동 생성 | 사용하지 않음 |
| **볼륨 바인딩** | CSI 드라이버가 처리 | 수동으로 PV 생성 |
| **디렉터리 격리** | Access Point별 격리 | EFS 루트 공유 |
| **권한 관리** | Access Point 정책 | 파일시스템 권한 |
| **문제 해결** | CSI 드라이버 의존 | 직접 EFS 마운트 |

## 주의사항

1. **EFS 파일 시스템 ID**: `storageclass.yaml`과 `static-pv.yaml`의 `fileSystemId`를 실제 EFS 파일 시스템 ID로 반드시 업데이트해야 합니다.
2. **보안 그룹**: EKS 노드의 보안 그룹이 EFS 파일 시스템의 보안 그룹으로부터 NFS 트래픽(포트 2049)을 허용해야 합니다.
3. **IAM 역할**: EKS 노드에 EFS에 접근할 수 있는 IAM 정책이 연결되어 있어야 합니다.
4. **Static PV 사용 시**: 여러 Pod가 같은 EFS 루트 디렉터리를 공유하므로 파일 경로 충돌에 주의해야 합니다.
