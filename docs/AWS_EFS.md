# 📁 Amazon EFS (Elastic File System) for Kubernetes

## 🆚 File Storage vs Block Storage 비교

| 특성 | File Storage (EFS) | Block Storage (EBS) |
|------|-------------------|-------------------|
| **접근 방식** | 파일 시스템 (NFS) | 블록 장치 (디스크) |
| **동시 접근** | 다중 노드에서 동시 읽기/쓰기 가능 | 단일 노드에서만 읽기/쓰기 가능 |
| **지연 시간** | 비교적 높음 (네트워크 기반) | 낮음 (직접 연결) |
| **사용 사례** | 공유 웹 콘텐츠, CMS, CI/CD 아티팩트 | 데이터베이스, 단일 노드 애플리케이션 |
| **확장성** | 자동 확장 | 수동 확장 필요 |
| **가용성** | 다중 AZ에 자동 복제 | 단일 AZ 내에서만 사용 가능 |

## 🚀 EFS CSI Driver 설정

### 1️⃣ EFS CSI Driver 설치
```bash
kubectl apply -k "github.com/kubernetes-sigs/aws-efs-csi-driver/deploy/kubernetes/overlays/stable/?ref=release-1.3"
```

### 2️⃣ EFS 파일 시스템 생성 (Terraform)
```hcl
resource "aws_efs_file_system" "main" {
  creation_token = "efs-main"
  encrypted      = true
  tags = {
    Name = "eks-efs"
  }
}

# EKS 클러스터 서브넷에 마운트 타겟 생성
resource "aws_efs_mount_target" "main" {
  for_each = toset(module.vpc.private_subnets)

  file_system_id  = aws_efs_file_system.main.id
  subnet_id       = each.key
  security_groups = [aws_security_group.efs.id]
}
```

## 💾 EFS를 Kubernetes PV/PVC로 사용하기

### 1️⃣ StorageClass 생성
```yaml
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: efs-sc
provisioner: efs.csi.aws.com
parameters:
  provisioningMode: efs-ap
  fileSystemId: fs-12345678
  directoryPerms: "700"
  gidRangeStart: "1000"
  gidRangeEnd: "2000"
  basePath: "/dynamic_provisioning"
```

### 2️⃣ 동적 프로비저닝 예제
```yaml
# PersistentVolumeClaim
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: efs-claim
spec:
  accessModes:
    - ReadWriteMany
  storageClassName: efs-sc
  resources:
    requests:
      storage: 5Gi
---
# Pod에서 사용 예시
apiVersion: apps/v1
kind: Deployment
metadata:
  name: wordpress
spec:
  replicas: 3
  selector:
    matchLabels:
      app: wordpress
  template:
    metadata:
      labels:
        app: wordpress
    spec:
      containers:
      - name: wordpress
        image: wordpress:php8.1
        ports:
        - containerPort: 80
        volumeMounts:
        - name: wordpress-data
          mountPath: /var/www/html
      volumes:
      - name: wordpress-data
        persistentVolumeClaim:
          claimName: efs-claim
```

## 🎯 주요 사용 사례

### 1. 웹 애플리케이션 (WordPress)
```yaml
# WordPress + EFS 예제
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: wordpress-pvc
spec:
  accessModes:
    - ReadWriteMany
  storageClassName: efs-sc
  resources:
    requests:
      storage: 20Gi
```

### 2. CI/CD 파이프라인 (Jenkins)
```yaml
# Jenkins + EFS 예제
apiVersion: apps/v1
kind: StatefulSet
metadata:
  name: jenkins
spec:
  serviceName: jenkins
  replicas: 1
  selector:
    matchLabels:
      app: jenkins
  template:
    metadata:
      labels:
        app: jenkins
    spec:
      securityContext:
        fsGroup: 1000
        runAsUser: 1000
      containers:
      - name: jenkins
        image: jenkins/jenkins:lts-jdk11
        ports:
        - containerPort: 8080
        - containerPort: 50000
        volumeMounts:
        - name: jenkins-home
          mountPath: /var/jenkins_home
  volumeClaimTemplates:
  - metadata:
      name: jenkins-home
    spec:
      accessModes: [ "ReadWriteMany" ]
      storageClassName: "efs-sc"
      resources:
        requests:
          storage: 100Gi
```

## 🔍 성능 최적화

### 1. EFS 성능 모드 선택
```hcl
resource "aws_efs_file_system" "main" {
  performance_mode = "generalPurpose"  # 또는 "maxIO"
  throughput_mode = "elastic"         # 또는 "provisioned"
  # provisioned_throughput_in_mibps = 100
}
```

### 2. 액세스 포인트 활용
```yaml
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: efs-sc-app1
provisioner: efs.csi.aws.com
parameters:
  provisioningMode: efs-ap
  fileSystemId: fs-12345678
  directoryPerms: "700"
  gidRangeStart: "1000"
  gidRangeEnd: "2000"
  basePath: "/app1"
```

## 🚨 문제 해결

### 1. 권한 문제
```bash
# EFS 마운트 포인트 권한 확인
kubectl exec -it <pod-name> -- ls -la /mnt/efs

# EFS Access Point IAM 정책 확인
aws efs describe-file-system-policy --file-system-id fs-12345678
```

### 2. 성능 문제
```bash
# EFS 클라이언트 설정 확인
kubectl exec -it <pod-name> -- mount | grep nfs

# EFS CloudWatch 지표 모니터링
aws cloudwatch get-metric-statistics \
  --namespace AWS/EFS \
  --metric-name ClientConnections \
  --dimensions Name=FileSystemId,Value=fs-12345678 \
  --start-time $(date -v-1H +%Y-%m-%dT%H:%M:%S) \
  --end-time $(date +%Y-%m-%dT%H:%M:%S) \
  --period 300 \
  --statistics Average
```

## 🎯 결론

### ✅ EFS File Storage의 장점
- **다중 AZ에서의 고가용성**
- **여러 파드/노드에서의 동시 접근**
- **자동 확장 및 관리 용이성**
- **백업 및 복구 용이 (AWS Backup과 통합)**

### 📌 적합한 사용 사례
- **웹 애플리케이션** (WordPress, Drupal 등)
- **콘텐츠 관리 시스템** (CMS)
- **CI/CD 파이프라인** (Jenkins, GitLab Runner)
- **공유 데이터셋** (머신러닝, 미디어 파일)
