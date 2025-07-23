# AWS EFS CSI Driver for EKS

이 문서는 Amazon EKS 1.33에서 EFS(Elastic File System) CSI(Container Storage Interface) 드라이버를 사용하는 방법에 대해 설명합니다.

## 아키텍처 개요

```
+---------------------------------------------------+
|                  EKS Cluster 1.33                |
|  +----------------+        +------------------+  |
|  |   Pod 1        |        |   Pod 2          |  |
|  | +------------+ |        | +--------------+ |  |
|  | | Container  | |        | | Container    | |  |
|  | +------------+ |        | +--------------+ |  |
|  |                |        |                  |  |
|  |   Volume       |        |   Volume         |  |
|  |   Mount        |        |   Mount          |  |
|  +-------+--------+        +--------+---------+  |
|          |                          |            |
|          +------------+  +----------+            |
|                       |  |                       |
|          +------------v--v---------+            |
|          |  EFS CSI Driver         |            |
|          +------------+------------+            |
|                       |                         |
+-----------------------|-------------------------+
                        |
                        v
+---------------------------------------------------+
|               AWS EFS                             |
|  +-------------------------------------------+   |
|  |              EFS File System              |   |
|  +-------------------------------------------+   |
+---------------------------------------------------+
```

## 구성 요소

1. **EFS CSI Driver**: 쿠버네티스와 AWS EFS 간의 인터페이스를 제공하는 CSI 드라이버
2. **StorageClass**: 동적 프로비저닝을 위한 스토리지 클래스
3. **PersistentVolumeClaim (PVC)**: 스토리지 요청을 정의하는 리소스
4. **Pod**: EFS 볼륨을 마운트하는 애플리케이션 파드

## 사전 요구 사항

1. EKS 1.33 클러스터
2. EFS 파일 시스템이 생성되어 있어야 함
3. EFS 파일 시스템이 EKS 노드와 통신할 수 있도록 보안 그룹이 구성되어 있어야 함
4. EKS 노드에 EFS 마운트 헬퍼가 설치되어 있어야 함

## 매니페스트 파일 설명

### 1. StorageClass (storageclass.yaml)

```yaml
kind: StorageClass
apiVersion: storage.k8s.io/v1
metadata:
  name: efs-sc
provisioner: efs.csi.aws.com
parameters:
  provisioningMode: efs-ap  # EFS Access Point를 사용한 동적 프로비저닝
  fileSystemId: "fs-12345678"  # EFS 파일 시스템 ID로 교체 필요
  directoryPerms: "700"
  gidRangeStart: "1000"
  gidRangeEnd: "2000"
  basePath: "/dynamic_provisioning"  # 동적 프로비저닝을 위한 기본 경로
```

### 2. PersistentVolumeClaim (efs-pv-claim.yaml)

```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: efs-pv-claim
  namespace: test-csi-file-pv
spec:
  accessModes:
    - ReadWriteMany
  storageClassName: efs-sc
  resources:
    requests:
      storage: 5Gi
```

### 3. Pod 1 (deploy-pod1.yaml)

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: deploy-pod1
  namespace: test-csi-file-pv
spec:
  containers:
  - name: app
    image: centos
    command: ["/bin/sh"]
    args: ["-c", "while true; do echo $(date -u) >> /dpod1/out; sleep 5; done"]
    volumeMounts:
    - name: persistent-storage1
      mountPath: /dpod1
  volumes:
  - name: persistent-storage1
    persistentVolumeClaim:
      claimName: efs-pv-claim
```

### 4. Pod 2 (deploy-pod2.yaml)

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: deploy-pod2
  namespace: test-csi-file-pv
spec:
  containers:
  - name: app
    image: centos
    command: ["/bin/sh"]
    args: ["-c", "while true; do echo $(date -u) >> /dpod2/out; sleep 5; done"]
    volumeMounts:
    - name: persistent-storage2
      mountPath: /dpod2
  volumes:
  - name: persistent-storage2
    persistentVolumeClaim:
      claimName: efs-pv-claim
```

## 배포 단계

1. **네임스페이스 생성**
   ```bash
   kubectl create namespace dev-csi-file-pv
   ```

2. **EFS CSI 드라이버 설치 (EKS Add-on으로 설치)**
   ```bash
   eksctl create addon --name aws-efs-csi-driver --cluster <cluster-name> --region <region> --force
   ```

3. **EFS 파일 시스템 ID 확인**
   ```bash
   aws efs describe-file-systems --query "FileSystems[*].FileSystemId" --output text
   ```

4. **StorageClass 수정**
   - `storageclass.yaml` 파일에서 `fileSystemId`를 실제 EFS 파일 시스템 ID로 업데이트

5. **리소스 배포**
   ```bash
   kubectl apply -f storageclass.yaml
   kubectl apply -f efs-pv-claim.yaml
   kubectl apply -f deploy-pod1.yaml
   kubectl apply -f deploy-pod2.yaml
   ```

6. **배포 확인**
   ```bash
   # 파드 상태 확인
   kubectl get pods -n dev-csi-file-pv
   
   # PVC 상태 확인
   kubectl get pvc -n dev-csi-file-pv
   
   # PV 상태 확인
   kubectl get pv
   
   # 파드 로그 확인
   kubectl logs -f deploy-pod1 -n dev-csi-file-pv
   kubectl logs -f deploy-pod2 -n dev-csi-file-pv
   ```

## 주의사항

1. **보안 그룹 설정**: EKS 노드의 보안 그룹이 EFS 파일 시스템의 보안 그룹으로부터 NFS 트래픽(포트 2049)을 허용해야 합니다.

2. **IAM 역할**: EKS 노드에 EFS에 접근할 수 있는 IAM 정책이 연결되어 있어야 합니다.

3. **EFS 성능 모드**: 워크로드에 따라 적절한 EFS 성능 모드(범용 또는 최대 I/O)를 선택하세요.

4. **동시 접근**: 여러 파드에서 동시에 EFS에 접근하는 경우, 애플리케이션 수준에서 파일 잠금을 구현하는 것이 좋습니다.

5. **백업**: EFS의 데이터는 자동으로 여러 가용 영역에 복제되지만, 추가적인 백업 전략을 고려하는 것이 좋습니다.

## 문제 해결

1. **마운트 오류 발생 시**
   - EKS 노드에서 EFS 마운트 포인트에 접근 가능한지 확인
   - 보안 그룹 규칙이 올바르게 설정되었는지 확인
   - EFS 파일 시스템의 네트워크 ACL이 올바르게 설정되었는지 확인

2. **액세스 거부 오류 발생 시**
   - IAM 역할에 필요한 권한이 있는지 확인
   - EFS 파일 시스템의 파일 시스템 정책이 올바르게 설정되었는지 확인

3. **성능 이슈 발생 시**
   - EFS 성능 모드 확인 (범용 vs 최대 I/O)
   - EFS 처리량 모드 확인 (버스팅 vs 프로비저닝됨)
   - EFS 인프라가 애플리케이션의 I/O 요구 사항을 충족하는지 확인
