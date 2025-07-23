# EBS CSI Driver Storage 가이드

## 📋 목차
1. [StorageClass, PVC, POD 개요](#storageclass-pvc-pod-개요)
2. [Block Storage PV 이해](#block-storage-pv-이해)
3. [StorageClass 설정](#storageclass-설정)
4. [PVC 사용법](#pvc-사용법)
5. [POD 스토리지 활용](#pod-스토리지-활용)
6. [데이터베이스 아키텍처 패턴](#데이터베이스-아키텍처-패턴)
7. [문제 해결 가이드](#문제-해결-가이드)

## StorageClass, PVC, POD 개요

### 🔄 관계도
```
StorageClass (스토리지 정책) 
    ↓ 
PVC (스토리지 요청)
    ↓
POD (실제 사용)
```

### 📖 각 구성 요소의 역할

#### StorageClass
- **역할**: 스토리지의 "타입"과 "정책"을 정의
- **기능**: 동적 프로비저닝 설정, 성능 파라미터 지정
- **관리자**: 클러스터 관리자가 미리 생성

#### PVC (PersistentVolumeClaim)
- **역할**: 사용자(개발자)가 스토리지를 "요청"
- **기능**: 필요한 용량, 접근 모드, StorageClass 지정
- **생성자**: 개발자/애플리케이션 배포자

#### POD
- **역할**: PVC를 마운트하여 실제 스토리지 사용
- **기능**: 볼륨을 컨테이너 파일시스템에 연결
- **생성자**: 개발자/애플리케이션

## Block Storage PV 이해

### 📊 스토리지 타입 비교

| 타입 | 특징 | 사용 사례 | AWS 서비스 | Access Mode |
|------|------|-----------|------------|-------------|
| **Block Storage** | 블록 단위, 고성능, 단일 연결 | 데이터베이스, OS | EBS | ReadWriteOnce |
| **File Storage** | 파일 시스템, 다중 연결 | 공유 파일 | EFS | ReadWriteMany |
| **Object Storage** | HTTP API, 무제한 확장 | 백업, 정적 파일 | S3 | - |

### ✅ Block Storage PV 장점
- **고성능**: 낮은 지연시간, 높은 IOPS
- **일관성**: 블록 레벨 일관성 보장
- **부팅 가능**: OS 설치 및 부팅 지원
- **스냅샷**: 블록 레벨 스냅샷 지원

### ❌ Block Storage PV 제한사항
- **단일 연결**: ReadWriteOnce만 지원 (한 번에 하나의 파드만)
- **노드 종속**: 특정 AZ에 종속됨
- **크기 제한**: 볼륨 크기에 제한 있음

## StorageClass 설정

### 🔧 기본 gp3 StorageClass
```yaml
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: gp3
  annotations:
    storageclass.kubernetes.io/is-default-class: "true"
provisioner: ebs.csi.aws.com
parameters:
  type: gp3
  iops: "3000"
  throughput: "125"
  encrypted: "true"
allowVolumeExpansion: true
volumeBindingMode: WaitForFirstConsumer
reclaimPolicy: Delete
```

### ⚡ 고성능 StorageClass
```yaml
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: fast-ssd
provisioner: ebs.csi.aws.com
parameters:
  type: gp3
  iops: "10000"        # 고성능 IOPS
  throughput: "500"    # 고성능 처리량
  encrypted: "true"
allowVolumeExpansion: true
volumeBindingMode: WaitForFirstConsumer
reclaimPolicy: Retain  # 삭제 시 볼륨 보존
```

### 📊 EBS 볼륨 타입별 특징

| 볼륨 타입 | 용도 | 기본 성능 | 최대 성능 | 비용 |
|-----------|------|-----------|-----------|------|
| **gp3** | 일반 워크로드 | 3,000 IOPS, 125 MiB/s | 16,000 IOPS, 1,000 MiB/s | 중간 |
| **io2** | 고성능 DB | 100 IOPS/GiB | 64,000 IOPS | 높음 |
| **st1** | 빅데이터, 로그 | 40 MiB/s/TiB | 500 MiB/s | 낮음 |

## PVC 사용법

### 💾 데이터베이스용 PVC
```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: mysql-pvc
  labels:
    app: mysql
spec:
  accessModes:
    - ReadWriteOnce      # 단일 노드 접근
  resources:
    requests:
      storage: 20Gi      # 20GB 요청
  storageClassName: fast-ssd  # 고성능 스토리지 사용
```

### 📝 로그 저장용 PVC
```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: app-logs-pvc
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 5Gi       # 5GB 요청
  storageClassName: gp3  # 기본 스토리지 사용
```

## POD 스토리지 활용

### 🗄️ MySQL 데이터베이스 POD
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: mysql
spec:
  replicas: 1
  selector:
    matchLabels:
      app: mysql
  template:
    metadata:
      labels:
        app: mysql
    spec:
      containers:
      - name: mysql
        image: mysql:8.0
        env:
        - name: MYSQL_ROOT_PASSWORD
          value: "password123"
        - name: MYSQL_DATABASE
          value: "myapp"
        ports:
        - containerPort: 3306
        volumeMounts:
        - name: mysql-storage    # PVC 연결
          mountPath: /var/lib/mysql
        resources:
          requests:
            memory: "512Mi"
            cpu: "500m"
          limits:
            memory: "1Gi"
            cpu: "1000m"
      volumes:
      - name: mysql-storage
        persistentVolumeClaim:
          claimName: mysql-pvc   # 위에서 생성한 PVC 사용
```

## 데이터베이스 아키텍처 패턴

### 🎯 중요한 개념
**데이터베이스는 "공유"가 아니라 "단일 인스턴스 + 복제" 또는 "서비스 분리" 패턴을 사용합니다!**

### 1️⃣ 단일 데이터베이스 + 여러 애플리케이션 파드 (가장 일반적)

```yaml
# 데이터베이스: 단일 인스턴스 (StatefulSet)
apiVersion: apps/v1
kind: StatefulSet
metadata:
  name: mysql
spec:
  serviceName: mysql
  replicas: 1                    # ✅ 데이터베이스는 1개만!
  template:
    spec:
      containers:
      - name: mysql
        image: mysql:8.0
        env:
        - name: MYSQL_ROOT_PASSWORD
          value: "password"
        - name: MYSQL_DATABASE
          value: "myapp"
        ports:
        - containerPort: 3306
        volumeMounts:
        - name: mysql-data
          mountPath: /var/lib/mysql
  volumeClaimTemplates:
  - metadata:
      name: mysql-data
    spec:
      accessModes: ["ReadWriteOnce"]
      storageClassName: fast-ssd
      resources:
        requests:
          storage: 50Gi
---
# 애플리케이션: 여러 파드 (Deployment)
apiVersion: apps/v1
kind: Deployment
metadata:
  name: webapp
spec:
  replicas: 5                    # ✅ 앱은 5개 파드
  template:
    spec:
      containers:
      - name: app
        image: myapp:latest
        env:
        - name: DB_HOST
          value: "mysql"         # ✅ 모든 앱 파드가 같은 DB 접근
        - name: DB_NAME
          value: "myapp"
        ports:
        - containerPort: 8080
```

#### 📊 아키텍처 다이어그램
```
웹 파드1 ─┐
웹 파드2 ─┼─→ MySQL Service ─→ MySQL 파드 (단일) ─→ EBS 볼륨
웹 파드3 ─┤                     (StatefulSet)
웹 파드4 ─┤
웹 파드5 ─┘
```

### 🔄 Deployment vs StatefulSet 스토리지 동작

#### ❌ Deployment의 문제점 (여러 파드가 같은 PVC 공유)
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: webapp
spec:
  replicas: 3                    # 3개 파드 생성
  template:
    spec:
      volumes:
      - name: app-logs
        persistentVolumeClaim:
          claimName: app-logs-pvc  # ❌ 모든 파드가 같은 PVC 사용!
```

**실제 동작 결과:**
```
파드1 → app-logs-pvc (같은 EBS 볼륨)
파드2 → app-logs-pvc (같은 EBS 볼륨) ❌ 마운트 실패!
파드3 → app-logs-pvc (같은 EBS 볼륨) ❌ 마운트 실패!
```

#### ✅ StatefulSet의 해결책 (각 파드별 개별 스토리지)
```yaml
apiVersion: apps/v1
kind: StatefulSet
metadata:
  name: webapp
spec:
  serviceName: webapp
  replicas: 3                    # 3개 파드 생성
  template:
    metadata:
      labels:
        app: webapp
    spec:
      containers:
      - name: app
        image: nginx:alpine
        volumeMounts:
        - name: app-logs
          mountPath: /var/log/nginx
  volumeClaimTemplates:          # ✅ 각 파드별로 PVC 자동 생성!
  - metadata:
      name: app-logs
    spec:
      accessModes: ["ReadWriteOnce"]
      storageClassName: gp3
      resources:
        requests:
          storage: 1Gi
```

**StatefulSet 결과:**
```
webapp-0 → app-logs-webapp-0 (개별 EBS 볼륨 1)
webapp-1 → app-logs-webapp-1 (개별 EBS 볼륨 2)  
webapp-2 → app-logs-webapp-2 (개별 EBS 볼륨 3)
```

### 📊 데이터베이스 패턴 비교

| 패턴 | 데이터베이스 수 | 복잡도 | 성능 | 일관성 | 사용 사례 |
|------|---------------|--------|------|--------|-----------|
| **단일 DB** | 1개 | 낮음 | 중간 | 높음 | 소규모 앱 |
| **Master-Slave** | 1+N개 | 중간 | 높음 | 높음 | 읽기 집약적 |
| **마이크로서비스** | 서비스별 | 높음 | 높음 | 중간 | 대규모 앱 |
| **클러스터** | 3+개 | 높음 | 매우높음 | 높음 | 미션 크리티컬 |

## 문제 해결 가이드

### 🔍 상태 확인 명령어

#### StorageClass 확인
```bash
# 모든 StorageClass 목록
kubectl get storageclass

# 기본 StorageClass 확인
kubectl get storageclass -o jsonpath='{.items[?(@.metadata.annotations.storageclass\.kubernetes\.io/is-default-class=="true")].metadata.name}'

# 특정 StorageClass 상세 정보
kubectl describe storageclass gp3
```

#### PVC 확인
```bash
# 모든 PVC 상태
kubectl get pvc

# PVC 상세 정보
kubectl describe pvc postgres-pvc

# PVC와 연결된 PV 확인
kubectl get pv
```

#### POD 볼륨 확인
```bash
# POD 볼륨 마운트 상태
kubectl describe pod <pod-name>

# POD 내부에서 디스크 사용량 확인
kubectl exec -it <pod-name> -- df -h

# 볼륨 마운트 포인트 확인
kubectl exec -it <pod-name> -- mount | grep /var/lib
```

### 🚨 일반적인 문제들

#### PVC가 Pending 상태
```bash
# PVC 이벤트 확인
kubectl describe pvc <pvc-name>

# StorageClass 존재 확인
kubectl get storageclass <storage-class-name>

# EBS CSI Driver 상태 확인
kubectl get pods -n kube-system | grep ebs-csi
```

#### POD가 볼륨 마운트 실패
```bash
# POD 이벤트 확인
kubectl describe pod <pod-name>

# 노드의 볼륨 연결 상태 확인
kubectl get volumeattachment

# AWS EBS 볼륨 상태 확인
aws ec2 describe-volumes --filters "Name=tag:kubernetes.io/created-for/pvc/name,Values=<pvc-name>"
```

### 📊 성능 모니터링
```bash
# 볼륨 성능 확인
kubectl exec -it <pod-name> -- iostat -x 1

# 디스크 사용량 확인
kubectl exec -it <pod-name> -- df -h

# I/O 성능 테스트
kubectl exec -it <pod-name> -- fio --name=test --ioengine=libaio --rw=randwrite --bs=4k --size=1G --numjobs=1 --runtime=60
```

## 💡 베스트 프랙티스

### ✅ 데이터베이스 설계 원칙
1. **단일 책임**: 하나의 데이터베이스는 하나의 역할
2. **상태 분리**: 애플리케이션(무상태) vs 데이터베이스(상태)
3. **서비스 경계**: 마이크로서비스별 데이터베이스 분리
4. **백업 전략**: 정기적인 스냅샷 및 복제

### ✅ Kubernetes 패턴
- **데이터베이스**: StatefulSet (안정적인 네트워크 ID, 순서 보장)
- **애플리케이션**: Deployment (무상태, 확장 가능)
- **연결**: Service를 통한 안정적인 엔드포인트
- **설정**: ConfigMap/Secret으로 환경 분리

## 🎯 실제 테스트 예시

```bash
# 전체 예시를 한 번에 배포
kubectl apply -f - <<EOF
# StorageClass
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: demo-storage
provisioner: ebs.csi.aws.com
parameters:
  type: gp3
  iops: "3000"
  encrypted: "true"
---
# PVC
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: demo-pvc
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 1Gi
  storageClassName: demo-storage
---
# POD
apiVersion: v1
kind: Pod
metadata:
  name: demo-pod
spec:
  containers:
  - name: app
    image: busybox
    command: ["/bin/sh"]
    args: ["-c", "while true; do echo $(date) >> /data/log.txt; cat /data/log.txt | tail -5; sleep 10; done"]
    volumeMounts:
    - name: storage
      mountPath: /data
  volumes:
  - name: storage
    persistentVolumeClaim:
      claimName: demo-pvc
EOF
```

## 🎊 결론

**EBS CSI Driver를 통한 Block Storage PV 활용:**

- ✅ **StorageClass**: 스토리지 정책 및 성능 정의
- ✅ **PVC**: 개발자가 필요한 스토리지 요청
- ✅ **POD**: 실제 애플리케이션에서 스토리지 사용
- ✅ **데이터베이스**: 단일 인스턴스 + 네트워크 접근 패턴
- ✅ **StatefulSet**: 각 파드별 개별 스토리지 제공

**이제 Kubernetes에서 영구 스토리지를 완벽하게 활용할 수 있습니다!** 🎯✨
