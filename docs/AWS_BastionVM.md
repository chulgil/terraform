# 🏰 AWS Bastion VM 설정 가이드

## 📋 목차
1. [AWS CLI 설치](#-aws-cli-설치)
2. [kubectl 설치](#-kubectl-설치)
3. [EKS 클러스터 접속 설정](#-eks-클러스터-접속-설정)
4. [유용한 설정 및 도구](#-유용한-설정-및-도구)
5. [문제 해결](#-문제-해결)

---

## 🚀 AWS CLI 설치

### 1️⃣ 패키지 매니저를 사용한 설치 (권장)
```bash
# 1. 패키지 업데이트
sudo yum update -y

# 2. AWS CLI v2 설치
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

# 3. 설치 확인
aws --version
```

### 2️⃣ IAM 자격 증명 설정
```bash
aws configure
```
다음과 같이 입력하세요:
```
AWS Access Key ID [None]: YOUR_ACCESS_KEY
AWS Secret Access Key [None]: YOUR_SECRET_KEY
Default region name [None]: ap-northeast-2
Default output format [None]: json
```

### 3️⃣ 설치 확인
```bash
# 버전 확인
aws --version

# IAM 사용자 확인
aws sts get-caller-identity
```

---

## 🛠 kubectl 설치

### 1️⃣ 패키지 매니저를 사용한 설치 (권장)
```bash
# 1. kubectl 설치를 위한 리포지토리 추가
cat <<EOF | sudo tee /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://pkgs.k8s.io/core:/stable:/v1.28/rpm/
enabled=1
gpgcheck=1
gpgkey=https://pkgs.k8s.io/core:/stable:/v1.28/rpm/repodata/repomd.xml.key
EOF

# 2. kubectl 설치
sudo yum install -y kubectl

# 3. 설치 확인
kubectl version --client
```

### 2️⃣ EKS 클러스터 업데이트
```bash
# EKS 클러스터 자격 증명 구성
aws eks update-kubeconfig --region ap-northeast-2 --name YOUR_CLUSTER_NAME

# 클러스터 접속 테스트
kubectl get nodes
```

---

## 🔐 EKS 클러스터 접속 설정

### 1️⃣ kubeconfig 관리
```bash
# 여러 클러스터 전환
aws eks update-kubeconfig --region ap-northeast-2 --name CLUSTER-1 --alias cluster-1
aws eks update-kubeconfig --region ap-northeast-2 --name CLUSTER-2 --alias cluster-2

# 현재 컨텍스트 확인
kubectl config current-context

# 컨텍스트 전환
kubectl config use-context cluster-1
```

### 2️⃣ 접속 테스트
```bash
# 클러스터 정보 확인
kubectl cluster-info

# 노드 상태 확인
kubectl get nodes -o wide

# 모든 네임스페이스의 파드 확인
kubectl get pods -A
```

---

## ⚙️ 유용한 설정 및 도구

### 1️⃣ Bash 자동 완성 및 별칭
```bash
# .bashrc에 추가
echo 'source <(kubectl completion bash)' >> ~/.bashrc
echo 'alias k=kubectl' >> ~/.bashrc
echo 'complete -F __start_kubectl k' >> ~/.bashrc

# 유용한 별칭
echo '
# kubectl 별칭
alias kg="kubectl get"
alias kd="kubectl describe"
alias kaf="kubectl apply -f"
alias kdf="kubectl delete -f"
alias kc="kubectl config use-context"
alias kcc="kubectl config current-context"
alias kgp="kubectl get pods"
alias kgn="kubectl get nodes"
alias kgs="kubectl get services"
alias kl="kubectl logs"
alias kx="kubectl exec -it"' >> ~/.bashrc

# 변경사항 적용
source ~/.bashrc
```

### 2️⃣ 유용한 도구 설치
```bash
# jq (JSON 처리)
sudo yum install -y jq

# helm (패키지 매니저)
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

# k9s (터미널 UI)
wget https://github.com/derailed/k9s/releases/download/v0.27.4/k9s_Linux_amd64.tar.gz
tar xvf k9s_Linux_amd64.tar.gz
sudo mv k9s /usr/local/bin/
```

### 3️⃣ SSH 키 설정 (선택사항)
```bash
# SSH 키 생성
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"

# 공개키 확인
cat ~/.ssh/id_rsa.pub

# SSH 에이전트에 키 추가
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
```

---

## 🚨 문제 해결

### 1️⃣ AWS CLI 문제
```bash
# 자격 증명 확인
aws sts get-caller-identity

# 리전 설정 확인
aws configure get region
```

### 2️⃣ kubectl 연결 문제
```bash
# kubeconfig 파일 확인
cat ~/.kube/config

# EKS 엔드포인트 접근 테스트
curl -k https://YOUR_EKS_ENDPOINT/api --header "Authorization: Bearer $(aws eks get-token --cluster-name YOUR_CLUSTER_NAME --region ap-northeast-2 | jq -r '.status.token')"
```

### 3️⃣ 권한 문제
```bash
# IAM 정책 확인
aws iam list-attached-user-policies --user-name $(aws sts get-caller-identity --query 'Arn' --output text | cut -d'/' -f2)

# EKS 클러스터 권한 확인
aws eks describe-cluster --name YOUR_CLUSTER_NAME --region ap-northeast-2
```

### 4️⃣ 네트워크 문제
```bash
# 보안 그룹 확인
aws ec2 describe-security-groups --filters Name=group-name,Values=*YOUR_CLUSTER_NAME*

# 서브넷 라우팅 테이블 확인
aws ec2 describe-route-tables --filters "Name=tag:Name,Values=*YOUR_CLUSTER_NAME*"
```

### 5️⃣ 로그 확인
```bash
# kubelet 로그 (노드에서)
journalctl -u kubelet -f

# API 서버 로그 (CloudWatch)
aws logs describe-log-groups --log-group-name-prefix "/aws/eks/YOUR_CLUSTER_NAME/cluster"
```

---

## 🎯 모범 사례

### 🔒 보안
- **최소 권한 원칙** 적용
- **MFA(Multi-Factor Authentication)** 활성화
- **IAM 역할**을 통한 임시 자격 증명 사용
- 정기적으로 **액세스 키 회전**

### 🔄 유지 관리
- 정기적으로 **소프트웨어 업데이트**
- 사용하지 않는 **리소스 정리**
- **로그 모니터링** 설정
- **백업** 전략 수립

### 📊 모니터링
- **CloudWatch** 지표 설정
- **감사 로깅** 활성화
- **경고 알림** 구성

이제 Bastion VM을 통해 안전하게 AWS 리소스와 EKS 클러스터를 관리할 수 있습니다! 🚀
