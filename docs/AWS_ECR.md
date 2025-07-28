# 🐳 AWS ECR (Elastic Container Registry) 완전 가이드

**AWS ECR을 활용한 컨테이너 이미지 관리 전략과 실무 가이드**

![ECR](https://img.shields.io/badge/AWS-ECR-FF9900?style=for-the-badge&logo=amazon-aws&logoColor=white)
![Docker](https://img.shields.io/badge/docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)
![Kubernetes](https://img.shields.io/badge/kubernetes-326CE5?style=for-the-badge&logo=kubernetes&logoColor=white)

---

## 📋 **목차**

- [개요](#개요)
- [ECR 장단점 분석](#ecr-장단점-분석)
- [현재 프로젝트 ECR 현황](#현재-프로젝트-ecr-현황)
- [ECR 설정 및 구성](#ecr-설정-및-구성)
- [CI/CD 파이프라인 연동](#cicd-파이프라인-연동)
- [비용 분석 및 최적화](#비용-분석-및-최적화)
- [모니터링 및 운영](#모니터링-및-운영)
- [컨테이너 레지스트리 비교](#컨테이너-레지스트리-비교)
- [실무 권장사항](#실무-권장사항)
- [트러블슈팅](#트러블슈팅)

---

## 🎯 **개요**

AWS ECR(Elastic Container Registry)은 완전 관리형 컨테이너 레지스트리 서비스입니다. 본 가이드는 ECR의 장단점을 객관적으로 분석하고, 실무에서 효과적으로 활용하는 방법을 제시합니다.

### **🔑 핵심 질문들**
1. **ECR을 사용해야 하는가?**
2. **비용 대비 효과는 어떤가?**
3. **DockerHub 대비 어떤 장단점이 있는가?**
4. **현재 프로젝트에 적합한가?**

---

## ⚖️ **ECR 장단점 분석**

### **✅ ECR의 주요 장점**

#### **1. AWS 생태계 통합**
```yaml
네이티브 통합:
  ✅ EKS/ECS와 완벽 연동
  ✅ IAM 기반 세밀한 권한 제어
  ✅ VPC Endpoints로 프라이빗 통신
  ✅ CloudTrail 자동 감사 로그

현재 프로젝트 장점:
  ✅ VPC Endpoints 이미 구성됨
  ✅ EKS 노드 IAM 권한 설정 완료
  ✅ 같은 리전 내 무료 데이터 전송
```

#### **2. 보안 및 성능**
```yaml
보안:
  🔒 이미지 자동 암호화
  🔍 취약점 스캔 (Basic/Enhanced)
  🛡️ IAM 기반 접근 제어
  📋 라이프사이클 정책

성능:
  ⚡ 같은 리전 내 고속 전송
  🚫 Rate limit 없음
  📈 Auto scaling
  🌐 Multi-AZ 고가용성
```

#### **3. 운영 편의성**
```yaml
관리:
  🤖 완전 관리형 서비스
  📊 CloudWatch 메트릭 통합
  🔄 자동 백업 및 복제
  📝 태그 기반 리소스 관리

DevOps:
  🔧 Terraform/CloudFormation 지원
  🚀 CI/CD 파이프라인 쉬운 통합
  📱 AWS CLI/SDK 네이티브 지원
```

### **❌ ECR의 주요 단점**

#### **1. 비용 관련 이슈**
```yaml
예상 vs 실제 비용:
  예상: "월 300원 정도"
  실제: "관리 안 하면 월 3,000원+"

숨겨진 비용:
  💸 크로스 리전 전송: $0.09/GB
  💸 Enhanced 스캔: 추가 과금
  💸 스토리지 누적: $0.10/GB/월
  💸 라이프사이클 정책 미설정 시 급증
```

#### **2. 글로벌 접근성 제한**
```yaml
지역별 이슈:
  🚫 중국: 접근 불안정 (VPN 필요)
  🐌 해외: AWS 리전 없으면 느림
  🌍 vs DockerHub: 글로벌 CDN 부족

속도 비교:
  같은 리전: ✅ 매우 빠름
  다른 리전: ❌ DockerHub보다 느림
  해외: ❌ 현지 리전 없으면 매우 느림
```

#### **3. 설정 복잡성**
```yaml
학습 곡선:
  ECR: IAM + VPC + CLI 설정 필요
  DockerHub: docker login 한 번

권한 관리:
  ECR: 복잡한 IAM 정책 설정
  DockerHub: username/password

생태계:
  ECR: AWS 종속적
  DockerHub: 업계 표준
```

#### **4. 기능적 제한사항**
```yaml
메타데이터:
  ❌ README/Documentation 제한
  ❌ 이미지 설명 기능 부족
  ❌ 커뮤니티 피드백 없음

Discovery:
  ❌ 구글 검색 노출 제한
  ❌ Public 접근성 떨어짐
  ❌ 써드파티 도구 제한적 지원
```

---

## 🔍 **현재 프로젝트 ECR 현황**

### **📊 인프라 준비 상태**

#### **✅ 이미 구성된 ECR 인프라**
```terraform
# VPC Endpoints for ECR (이미 설정됨)
resource "aws_vpc_endpoint" "ecr_dkr" {
  vpc_id              = aws_vpc.main.id
  service_name        = "com.amazonaws.${var.region}.ecr.dkr"
  vpc_endpoint_type   = "Interface"
  private_dns_enabled = true
  subnet_ids          = aws_subnet.private[*].id
}

resource "aws_vpc_endpoint" "ecr_api" {
  vpc_id              = aws_vpc.main.id
  service_name        = "com.amazonaws.${var.region}.ecr.api"
  vpc_endpoint_type   = "Interface"
  private_dns_enabled = true
  subnet_ids          = aws_subnet.private[*].id
}
```

#### **✅ EKS 노드 권한 설정 완료**
```terraform
# EKS 노드에 ECR 접근 권한 (이미 설정됨)
resource "aws_iam_role_policy_attachment" "node-AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.node.name
}
```

### **❌ 현재 누락된 구성요소**

| 구분 | 현재 상태 | 필요한 작업 |
|------|-----------|-------------|
| **ECR 리포지토리** | ❌ 없음 | `aws_ecr_repository` 생성 |
| **실제 이미지** | 🐳 nginx:1.22-alpine | 애플리케이션 이미지 빌드 |
| **CI/CD 파이프라인** | ❌ 없음 | GitHub Actions 구성 |
| **라이프사이클 정책** | ❌ 없음 | 비용 최적화 정책 설정 |

---

## 🛠️ **ECR 설정 및 구성**

### **1️⃣ ECR 리포지토리 생성**

#### **Terraform 모듈 구성**
```terraform
# platform/aws/.../modules/ecr/main.tf
resource "aws_ecr_repository" "app_repositories" {
  for_each = var.repositories

  name                 = each.key
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  encryption_configuration {
    encryption_type = "AES256"
  }

  tags = merge(var.common_tags, {
    Name        = each.key
    Service     = each.value.service
    Environment = var.environment
  })
}

# 라이프사이클 정책
resource "aws_ecr_lifecycle_policy" "app_policies" {
  for_each   = aws_ecr_repository.app_repositories
  repository = each.value.name

  policy = jsonencode({
    rules = [
      {
        rulePriority = 1
        description  = "Keep last ${var.keep_image_count} images"
        selection = {
          tagStatus   = "any"
          countType   = "imageCountMoreThan"
          countNumber = var.keep_image_count
        }
        action = {
          type = "expire"
        }
      },
      {
        rulePriority = 2
        description  = "Delete untagged images after 1 day"
        selection = {
          tagStatus = "untagged"
          countType = "sinceImagePushed"
          countUnit = "days"
          countNumber = 1
        }
        action = {
          type = "expire"
        }
      }
    ]
  })
}
```

#### **변수 설정**
```terraform
# platform/aws/.../modules/ecr/variables.tf
variable "repositories" {
  description = "ECR repositories to create"
  type = map(object({
    service = string
  }))
  default = {
    "feed-server" = {
      service = "backend"
    }
    "guestbook" = {
      service = "frontend"
    }
  }
}

variable "keep_image_count" {
  description = "Number of images to keep"
  type        = number
  default     = 10
}
```

#### **환경별 설정**
```terraform
# platform/aws/.../environments/dev/main.tf
module "ecr" {
  source = "../../modules/ecr"

  environment = var.environment
  repositories = {
    "bubblepool" = { service = "backend" }
    "guestbook"  = { service = "frontend" }
  }
  keep_image_count = 5  # 개발환경은 적게 유지

  common_tags = local.common_tags
}
```

### **2️⃣ AWS CLI를 통한 수동 생성**

```bash
# ECR 리포지토리 생성
aws ecr create-repository \
  --repository-name bubblepool \
  --region ap-northeast-2 \
  --image-scanning-configuration scanOnPush=true

# 라이프사이클 정책 적용
cat > lifecycle-policy.json << EOF
{
  "rules": [
    {
      "rulePriority": 1,
      "description": "Keep last 10 images",
      "selection": {
        "tagStatus": "any",
        "countType": "imageCountMoreThan",
        "countNumber": 10
      },
      "action": {
        "type": "expire"
      }
    }
  ]
}
EOF

aws ecr put-lifecycle-policy \
  --repository-name bubblepool \
  --lifecycle-policy-text file://lifecycle-policy.json
```

---

## 🚀 **CI/CD 파이프라인 연동**

### **📝 GitHub Actions 워크플로우**

#### **기본 ECR 빌드 파이프라인**
```yaml
# .github/workflows/feed-server-ecr.yml
name: Build and Push to ECR

on:
  push:
    paths:
      - 'service/feed-server/src/**'
    branches: [main, develop]

env:
  AWS_REGION: ap-northeast-2
  ECR_REGISTRY: ${{ secrets.AWS_ACCOUNT_ID }}.dkr.ecr.ap-northeast-2.amazonaws.com
  ECR_REPOSITORY: feed-server

jobs:
  build-and-push:
    runs-on: ubuntu-latest
    permissions:
      id-token: write
      contents: read

    steps:
    - name: Checkout code
      uses: actions/checkout@v4

    - name: Configure AWS credentials
      uses: aws-actions/configure-aws-credentials@v4
      with:
        role-to-assume: ${{ secrets.AWS_ROLE_ARN }}
        aws-region: ${{ env.AWS_REGION }}

    - name: Login to Amazon ECR
      id: login-ecr
      uses: aws-actions/amazon-ecr-login@v2

    - name: Extract metadata
      id: meta
      uses: docker/metadata-action@v5
      with:
        images: ${{ env.ECR_REGISTRY }}/${{ env.ECR_REPOSITORY }}
        tags: |
          type=ref,event=branch
          type=ref,event=pr
          type=sha,prefix=sha-
          type=raw,value=latest,enable={{is_default_branch}}

    - name: Build and push Docker image
      uses: docker/build-push-action@v5
      with:
        context: ./service/feed-server/src
        push: true
        tags: ${{ steps.meta.outputs.tags }}
        labels: ${{ steps.meta.outputs.labels }}
        cache-from: type=gha
        cache-to: type=gha,mode=max

    - name: Update Kubernetes manifests
      run: |
        cd service/feed-server/k8s/overlays/dev
        NEW_IMAGE="${{ env.ECR_REGISTRY }}/${{ env.ECR_REPOSITORY }}:sha-${{ github.sha }}"
        
        # kustomize를 사용하여 이미지 업데이트
        kustomize edit set image feed-server=${NEW_IMAGE}
        
        # Git 설정 및 커밋
        git config --local user.email "action@github.com"
        git config --local user.name "GitHub Action"
        git add kustomization.yaml
        git commit -m "Update feed-server image to ${NEW_IMAGE}" || exit 0
        git push
```

#### **멀티 스테이지 Dockerfile 예시**
```dockerfile
# service/feed-server/src/Dockerfile
# Build stage
FROM node:18-alpine AS builder

WORKDIR /app
COPY package*.json ./
RUN npm ci --only=production && npm cache clean --force

COPY . .
RUN npm run build

# Runtime stage
FROM node:18-alpine AS runtime

# 보안을 위한 non-root 사용자 생성
RUN addgroup -g 1001 -S nodejs && \
    adduser -S nextjs -u 1001

WORKDIR /app

# 필요한 파일만 복사
COPY --from=builder --chown=nextjs:nodejs /app/dist ./dist
COPY --from=builder --chown=nextjs:nodejs /app/node_modules ./node_modules
COPY --from=builder --chown=nextjs:nodejs /app/package.json ./package.json

USER nextjs

EXPOSE 3000

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD curl -f http://localhost:3000/health || exit 1

CMD ["npm", "start"]
```

### **🔧 Kubernetes 매니페스트 업데이트**

#### **기존 설정 수정**
```yaml
# service/feed-server/k8s/base/rollout.yaml
apiVersion: argoproj.io/v1alpha1
kind: Rollout
metadata:
  name: feed-server-rollout
spec:
  replicas: 2
  strategy:
    blueGreen:
      activeService: feed-server
      previewService: feed-server-preview
      autoPromotionEnabled: false
      scaleDownDelaySeconds: 30
  selector:
    matchLabels:
      app: feed-server
  template:
    metadata:
      labels:
        app: feed-server
    spec:
      containers:
      - name: feed-server
        image: ACCOUNT_ID.dkr.ecr.ap-northeast-2.amazonaws.com/feed-server:latest
        ports:
        - containerPort: 3000
          name: http
        env:
        - name: NODE_ENV
          value: "production"
        resources:
          requests:
            memory: "128Mi"
            cpu: "100m"
          limits:
            memory: "256Mi"
            cpu: "200m"
        livenessProbe:
          httpGet:
            path: /health
            port: 3000
          initialDelaySeconds: 30
          periodSeconds: 10
        readinessProbe:
          httpGet:
            path: /health
            port: 3000
          initialDelaySeconds: 5
          periodSeconds: 5
```

#### **Kustomization 수정**
```yaml
# service/feed-server/k8s/base/kustomization.yaml
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization

resources:
- rollout.yaml
- service.yaml
- service-preview.yaml

images:
- name: feed-server
  newName: ACCOUNT_ID.dkr.ecr.ap-northeast-2.amazonaws.com/feed-server
  newTag: "latest"  # CI/CD에서 동적으로 업데이트됨

labels:
- pairs:
    app: feed-server
    app.kubernetes.io/name: feed-server
    app.kubernetes.io/part-of: feed-server-suite

configMapGenerator:
- name: feed-server-config
  literals:
  - APP_NAME=Feed Server
  - APP_VERSION=v2.0.0
  - DEPLOYMENT_TYPE=Blue-Green with ECR
  - LOG_LEVEL=info
```

---

## 💰 **비용 분석 및 최적화**

### **📊 실제 비용 계산**

#### **현재 프로젝트 예상 비용**
```yaml
# Feed Server 애플리케이션 시나리오
이미지 크기:
  Base 이미지 (Node.js): ~200MB
  애플리케이션 코드: ~50MB
  총 이미지 크기: ~250MB

버전 관리:
  개발 빈도: 주 3회 배포
  보관 기간: 최근 10개 버전
  총 스토리지: 250MB × 10 = 2.5GB

배포 빈도:
  EKS 파드 restart: 일 5회
  월 전송량: 250MB × 5 × 30 = 37.5GB (같은 리전 내 무료!)

월 비용 계산:
  스토리지: 2.5GB × $0.10 = $0.25/월
  데이터 전송: $0 (같은 리전 내)
  총 예상 비용: ~$0.25/월 (월 300원!)
```

#### **규모별 비용 시나리오**
```yaml
소규모 (현재):
  이미지: 1-2개 서비스
  스토리지: 2.5GB
  비용: $0.25/월 (300원)

중규모:
  이미지: 5-10개 서비스
  스토리지: 10GB
  비용: $1.00/월 (1,200원)

대규모:
  이미지: 20개+ 서비스
  스토리지: 50GB
  비용: $5.00/월 (6,000원)

위험 시나리오 (관리 안 함):
  라이프사이클 정책 없음
  스토리지: 100GB+
  비용: $10+/월 (12,000원+)
```

### **💡 비용 최적화 전략**

#### **1. 라이프사이클 정책 최적화**
```json
{
  "rules": [
    {
      "rulePriority": 1,
      "description": "Keep last 10 tagged images",
      "selection": {
        "tagStatus": "tagged",
        "countType": "imageCountMoreThan",
        "countNumber": 10
      },
      "action": { "type": "expire" }
    },
    {
      "rulePriority": 2,
      "description": "Keep production images for 90 days",
      "selection": {
        "tagStatus": "tagged",
        "tagPrefixList": ["prod"],
        "countType": "sinceImagePushed",
        "countUnit": "days",
        "countNumber": 90
      },
      "action": { "type": "expire" }
    },
    {
      "rulePriority": 3,
      "description": "Delete untagged images after 1 day",
      "selection": {
        "tagStatus": "untagged",
        "countType": "sinceImagePushed",
        "countUnit": "days",
        "countNumber": 1
      },
      "action": { "type": "expire" }
    }
  ]
}
```

#### **2. 멀티 스테이지 빌드 최적화**
```dockerfile
# 최적화된 Dockerfile
FROM node:18-alpine AS deps
WORKDIR /app
COPY package*.json ./
RUN npm ci --only=production --ignore-scripts

FROM node:18-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci --include=dev
COPY . .
RUN npm run build

FROM node:18-alpine AS runtime
# 취약점 최소화를 위한 업데이트
RUN apk add --no-cache dumb-init && \
    addgroup -g 1001 -S nodejs && \
    adduser -S nodejs -u 1001

USER nodejs
WORKDIR /app

# 필요한 파일만 복사하여 이미지 크기 최소화
COPY --from=deps --chown=nodejs:nodejs /app/node_modules ./node_modules
COPY --from=builder --chown=nodejs:nodejs /app/dist ./dist
COPY --from=builder --chown=nodejs:nodejs /app/package.json ./

EXPOSE 3000
ENTRYPOINT ["dumb-init", "--"]
CMD ["node", "dist/index.js"]
```

#### **3. .dockerignore 최적화**
```dockerignore
# .dockerignore
node_modules/
.git/
.github/
*.md
.env*
coverage/
test/
docs/
.vscode/
.idea/
*.log
Dockerfile*
docker-compose*
```

### **📈 비용 모니터링**

#### **CloudWatch 대시보드**
```terraform
resource "aws_cloudwatch_dashboard" "ecr_costs" {
  dashboard_name = "${var.environment}-ecr-costs"

  dashboard_body = jsonencode({
    widgets = [
      {
        type   = "metric"
        width  = 12
        height = 6
        properties = {
          metrics = [
            ["AWS/ECR", "RepositoryPullCount", "RepositoryName", "bubblepool"],
            ["AWS/ECR", "RepositoryPushCount", "RepositoryName", "bubblepool"]
          ]
          period = 300
          stat   = "Sum"
          region = "ap-northeast-2"
          title  = "ECR Pull/Push Count"
        }
      }
    ]
  })
}
```

---

## 📊 **모니터링 및 운영**

### **🔍 CloudWatch 메트릭**

#### **주요 모니터링 지표**
```yaml
리포지토리 메트릭:
  - RepositoryPullCount: Pull 횟수
  - RepositoryPushCount: Push 횟수
  - RepositorySizeBytes: 저장소 크기

이미지 스캔 메트릭:
  - ImageScanFindingsCounts: 취약점 개수
  - ImageScanStatusFailed: 스캔 실패 횟수

비용 관련:
  - StorageBytes: 스토리지 사용량
  - DataTransfer: 데이터 전송량
```

#### **알림 설정**
```terraform
resource "aws_cloudwatch_metric_alarm" "ecr_high_pull_count" {
  alarm_name          = "${var.environment}-ecr-high-pull-count"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "2"
  metric_name         = "RepositoryPullCount"
  namespace           = "AWS/ECR"
  period              = "300"
  statistic           = "Sum"
  threshold           = "1000"
  alarm_description   = "This metric monitors ECR pull count"
  
  dimensions = {
    RepositoryName = "bubblepool"
  }

  alarm_actions = [aws_sns_topic.alerts.arn]
}

resource "aws_cloudwatch_metric_alarm" "ecr_repository_size" {
  alarm_name          = "${var.environment}-ecr-repository-size"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "1"
  metric_name         = "RepositorySizeBytes"
  namespace           = "AWS/ECR"
  period              = "86400"  # 1일
  statistic           = "Maximum"
  threshold           = "5368709120"  # 5GB
  alarm_description   = "Repository size is growing too large"
  
  dimensions = {
    RepositoryName = "bubblepool"
  }

  alarm_actions = [aws_sns_topic.alerts.arn]
}
```

### **🛡️ 보안 모니터링**

#### **이미지 스캔 자동화**
```bash
#!/bin/bash
# scripts/ecr-security-scan.sh

REPOSITORY_NAME="bubblepool"
REGION="ap-northeast-2"

echo "Starting security scan for ${REPOSITORY_NAME}..."

# 최신 이미지 태그 가져오기
LATEST_TAG=$(aws ecr describe-images \
  --repository-name ${REPOSITORY_NAME} \
  --region ${REGION} \
  --query 'sort_by(imageDetails,& imagePushedAt)[-1].imageTags[0]' \
  --output text)

echo "Scanning image with tag: ${LATEST_TAG}"

# 스캔 시작
aws ecr start-image-scan \
  --repository-name ${REPOSITORY_NAME} \
  --image-id imageTag=${LATEST_TAG} \
  --region ${REGION}

# 스캔 결과 대기
echo "Waiting for scan to complete..."
sleep 30

# 스캔 결과 확인
SCAN_RESULTS=$(aws ecr describe-image-scan-findings \
  --repository-name ${REPOSITORY_NAME} \
  --image-id imageTag=${LATEST_TAG} \
  --region ${REGION})

# 심각한 취약점 확인
CRITICAL_COUNT=$(echo ${SCAN_RESULTS} | jq '.imageScanFindings.findingCounts.CRITICAL // 0')
HIGH_COUNT=$(echo ${SCAN_RESULTS} | jq '.imageScanFindings.findingCounts.HIGH // 0')

echo "Critical vulnerabilities: ${CRITICAL_COUNT}"
echo "High vulnerabilities: ${HIGH_COUNT}"

# 임계값 초과 시 실패
if [ ${CRITICAL_COUNT} -gt 0 ] || [ ${HIGH_COUNT} -gt 5 ]; then
  echo "❌ Security scan failed! Too many vulnerabilities found."
  exit 1
fi

echo "✅ Security scan passed!"
```

---

## 🔄 **컨테이너 레지스트리 비교**

### **📊 종합 비교표**

| 기준 | ECR | DockerHub Free | DockerHub Pro | GitHub Container Registry |
|------|-----|----------------|---------------|---------------------------|
| **💰 월 비용** | ~$0.25 | 무료 | $5 | 무료 |
| **🔄 Pull 제한** | 무제한 | 100회/6시간 | 5000회/일 | 무제한 |
| **💾 Private 저장소** | 무제한 | 1개 | 무제한 | 무제한 |
| **🌍 글로벌 접근** | 리전 의존적 | 글로벌 CDN | 글로벌 CDN | 제한적 |
| **🔒 보안 스캔** | ✅ 내장 | ❌ 없음 | ✅ 포함 | 기본적 |
| **📊 통계/분석** | CloudWatch | 웹 UI | 상세 분석 | 제한적 |
| **🔧 AWS 통합** | ✅ 완벽 | ❌ 설정 필요 | ❌ 설정 필요 | ❌ 설정 필요 |
| **👥 커뮤니티** | AWS 생태계 | 전 세계 표준 | 전 세계 표준 | GitHub 생태계 |

### **🎯 사용 시나리오별 권장사항**

#### **✅ ECR 권장 사용 사례**
```yaml
완벽한 케이스:
  ✅ AWS 올인 전략
  ✅ 엔터프라이즈 보안 요구사항
  ✅ 같은 리전 내 고성능 필요
  ✅ 프라이빗 이미지 중심
  ✅ 비용 관리 가능한 팀

현재 프로젝트:
  ✅ EKS 클러스터 운영
  ✅ VPC Endpoints 구성 완료
  ✅ AWS 인프라 중심
  ✅ 팀 내부 서비스
```

#### **❌ ECR 권장하지 않는 사례**
```yaml
부적합한 케이스:
  ❌ 오픈소스 프로젝트 (커뮤니티 접근성)
  ❌ 멀티 클라우드 환경
  ❌ 글로벌 사용자 대상 서비스
  ❌ 간단한 프로토타입
  ❌ 비용 예측 어려운 소규모 팀
```

### **🔄 마이그레이션 가이드**

#### **DockerHub → ECR 마이그레이션**
```bash
#!/bin/bash
# scripts/migrate-to-ecr.sh

SOURCE_IMAGE="nginx:1.22-alpine"
ECR_REGISTRY="123456789012.dkr.ecr.ap-northeast-2.amazonaws.com"
ECR_REPOSITORY="bubblepool"
NEW_TAG="v1.0.0"

# ECR 로그인
aws ecr get-login-password --region ap-northeast-2 | \
  docker login --username AWS --password-stdin ${ECR_REGISTRY}

# 기존 이미지 Pull
docker pull ${SOURCE_IMAGE}

# ECR 태그로 재태깅
docker tag ${SOURCE_IMAGE} ${ECR_REGISTRY}/${ECR_REPOSITORY}:${NEW_TAG}
docker tag ${SOURCE_IMAGE} ${ECR_REGISTRY}/${ECR_REPOSITORY}:latest

# ECR에 Push
docker push ${ECR_REGISTRY}/${ECR_REPOSITORY}:${NEW_TAG}
docker push ${ECR_REGISTRY}/${ECR_REPOSITORY}:latest

echo "✅ Migration completed!"
echo "New image: ${ECR_REGISTRY}/${ECR_REPOSITORY}:${NEW_TAG}"
```

---

## 💡 **실무 권장사항**

### **🏗️ 운영 환경 구성**

#### **1. 환경별 ECR 전략**
```yaml
Development:
  - 라이프사이클: 5개 이미지 유지
  - 스캔: Basic scanning
  - 태그: feature-*, dev-*

Staging:
  - 라이프사이클: 10개 이미지 유지
  - 스캔: Enhanced scanning
  - 태그: staging-*, release-*

Production:
  - 라이프사이클: 20개 이미지 유지
  - 스캔: Enhanced scanning + 수동 승인
  - 태그: prod-*, v*.*.*
```

#### **2. 태그 전략**
```bash
# Semantic versioning
v1.2.3                 # 릴리스 버전
v1.2.3-rc.1           # 릴리스 후보
v1.2.3-alpha.1        # 알파 버전

# Environment based
prod-v1.2.3           # 프로덕션
staging-v1.2.3        # 스테이징
dev-feature-auth      # 개발 피처

# Git based
sha-abc123def         # Git SHA
main-abc123def        # 브랜치 + SHA
pr-123-abc123def      # Pull Request
```

#### **3. 보안 모범 사례**
```yaml
이미지 보안:
  ✅ 멀티 스테이지 빌드로 크기 최소화
  ✅ 베이스 이미지 정기 업데이트
  ✅ 불필요한 패키지 제거
  ✅ Non-root 사용자 사용
  ✅ 보안 스캔 자동화

접근 제어:
  ✅ IAM 역할 기반 최소 권한
  ✅ 환경별 권한 분리
  ✅ 크로스 계정 접근 제한
  ✅ API 키 로테이션
```

### **🎯 성능 최적화**

#### **1. 빌드 최적화**
```dockerfile
# 최적화된 Node.js Dockerfile
FROM node:18-alpine AS base
RUN apk add --no-cache dumb-init
WORKDIR /app
COPY package*.json ./

FROM base AS deps
RUN npm ci --only=production --ignore-scripts

FROM base AS build
RUN npm ci --include=dev --ignore-scripts
COPY . .
RUN npm run build

FROM base AS runtime
COPY --from=deps /app/node_modules ./node_modules
COPY --from=build /app/dist ./dist
COPY package.json ./

RUN addgroup -g 1001 -S nodejs && \
    adduser -S nodejs -u 1001 && \
    chown -R nodejs:nodejs /app

USER nodejs
EXPOSE 3000
ENTRYPOINT ["dumb-init", "--"]
CMD ["node", "dist/index.js"]
```

#### **2. 캐시 최적화**
```yaml
# GitHub Actions에서 빌드 캐시 활용
- name: Build and push Docker image
  uses: docker/build-push-action@v5
  with:
    context: .
    push: true
    tags: ${{ steps.meta.outputs.tags }}
    cache-from: type=gha
    cache-to: type=gha,mode=max
    build-args: |
      BUILDKIT_INLINE_CACHE=1
```

---

## 🔧 **트러블슈팅**

### **❌ 자주 발생하는 문제들**

#### **1. 인증 관련 문제**

**증상: "no basic auth credentials" 에러**
```bash
# 문제
Error response from daemon: pull access denied for xxx.dkr.ecr.region.amazonaws.com/repo

# 해결책
# ECR 로그인 재실행
aws ecr get-login-password --region ap-northeast-2 | \
  docker login --username AWS --password-stdin xxx.dkr.ecr.ap-northeast-2.amazonaws.com

# 자격 증명 확인
aws sts get-caller-identity

# IAM 권한 확인
aws iam list-attached-role-policies --role-name your-role-name
```

#### **2. VPC Endpoint 관련 문제**

**증상: ECR 접근 시 타임아웃**
```bash
# 문제 진단
# VPC Endpoint 상태 확인
aws ec2 describe-vpc-endpoints --filters "Name=service-name,Values=com.amazonaws.ap-northeast-2.ecr.dkr"

# Security Group 확인
aws ec2 describe-security-groups --group-ids sg-xxx

# 해결책
# Security Group에 HTTPS(443) 허용 규칙 추가
aws ec2 authorize-security-group-ingress \
  --group-id sg-xxx \
  --protocol tcp \
  --port 443 \
  --cidr 10.0.0.0/16
```

#### **3. 이미지 Push 실패**

**증상: "manifest unknown" 에러**
```bash
# 문제
Error: failed to push manifest: manifest unknown

# 해결책
# 리포지토리 존재 확인
aws ecr describe-repositories --repository-names bubblepool

# 리포지토리 생성 (없는 경우)
aws ecr create-repository --repository-name bubblepool

# 이미지 태그 확인
docker images | grep bubblepool
```

#### **4. 라이프사이클 정책 오작동**

**증상: 이미지가 예상보다 빨리 삭제됨**
```bash
# 정책 확인
aws ecr get-lifecycle-policy --repository-name bubblepool

# 테스트 실행 (실제 삭제 없이 미리보기)
aws ecr preview-lifecycle-policy \
  --repository-name bubblepool \
  --lifecycle-policy-text file://lifecycle-policy.json
```

### **🔍 디버깅 도구**

#### **ECR 상태 확인 스크립트**
```bash
#!/bin/bash
# scripts/ecr-health-check.sh

REPOSITORY_NAME="bubblepool"
REGION="ap-northeast-2"

echo "🔍 ECR Health Check for ${REPOSITORY_NAME}"
echo "================================================"

# 1. 리포지토리 존재 확인
echo "1. Repository Status:"
aws ecr describe-repositories \
  --repository-names ${REPOSITORY_NAME} \
  --region ${REGION} \
  --query 'repositories[0].{Name:repositoryName,URI:repositoryUri,CreatedAt:createdAt}' \
  --output table 2>/dev/null || echo "❌ Repository not found"

# 2. 이미지 목록 확인
echo -e "\n2. Recent Images:"
aws ecr describe-images \
  --repository-name ${REPOSITORY_NAME} \
  --region ${REGION} \
  --query 'sort_by(imageDetails,&imagePushedAt)[-5:].{Tag:imageTags[0],Size:imageSizeInBytes,PushedAt:imagePushedAt}' \
  --output table 2>/dev/null || echo "❌ No images found"

# 3. 라이프사이클 정책 확인
echo -e "\n3. Lifecycle Policy:"
aws ecr get-lifecycle-policy \
  --repository-name ${REPOSITORY_NAME} \
  --region ${REGION} \
  --query 'lifecyclePolicyText' \
  --output text 2>/dev/null | jq . || echo "❌ No lifecycle policy"

# 4. 스캔 상태 확인
echo -e "\n4. Latest Scan Results:"
LATEST_TAG=$(aws ecr describe-images \
  --repository-name ${REPOSITORY_NAME} \
  --region ${REGION} \
  --query 'sort_by(imageDetails,&imagePushedAt)[-1].imageTags[0]' \
  --output text 2>/dev/null)

if [ "${LATEST_TAG}" != "None" ]; then
  aws ecr describe-image-scan-findings \
    --repository-name ${REPOSITORY_NAME} \
    --image-id imageTag=${LATEST_TAG} \
    --region ${REGION} \
    --query 'imageScanFindings.findingCounts' \
    --output table 2>/dev/null || echo "❌ No scan results"
else
  echo "❌ No tagged images found"
fi

echo -e "\n✅ Health check completed"
```

---

## 📈 **다음 단계**

### **🎯 단기 개선 사항**
- [ ] **ECR 리포지토리 생성** (Terraform 모듈)
- [ ] **CI/CD 파이프라인 구성** (GitHub Actions)
- [ ] **라이프사이클 정책 설정** (비용 최적화)
- [ ] **보안 스캔 자동화** (취약점 관리)

### **🚀 장기 로드맵**
- [ ] **멀티 리전 복제** (재해 복구)
- [ ] **이미지 서명 구현** (보안 강화)
- [ ] **OPA Gatekeeper 연동** (정책 기반 보안)
- [ ] **코스트 알람 고도화** (비용 관리)

---

## 💡 **핵심 요약**

### **✅ ECR 도입 권장 이유 (현재 프로젝트)**
```yaml
기술적 장점:
  ✅ VPC Endpoints 이미 구성됨
  ✅ EKS IAM 권한 설정 완료
  ✅ 같은 리전 내 무료 전송
  ✅ 무제한 Pull, Rate limit 없음

비용 효율성:
  ✅ 월 300원 정도 (매우 저렴)
  ✅ DockerHub Pro 대비 20배 절약
  ✅ 라이프사이클 정책으로 제어 가능

운영 안정성:
  ✅ AWS SLA 보장
  ✅ 자동 백업 및 복제
  ✅ CloudWatch 통합 모니터링
```

### **⚠️ 주의사항**
```yaml
관리 포인트:
  ⚠️ 라이프사이클 정책 필수 설정
  ⚠️ 정기적인 보안 스캔 확인
  ⚠️ 비용 모니터링 대시보드 구성
  ⚠️ 크로스 리전 사용 시 비용 주의

제약사항:
  ⚠️ 글로벌 접근성 DockerHub 대비 제한
  ⚠️ 오픈소스 프로젝트에는 부적합
  ⚠️ 초기 설정 복잡성
```

---

## 📞 **추가 자료**

| 주제 | 관련 문서 | 설명 |
|------|-----------|------|
| **ArgoCD** | [`management/argo-cd/`](../management/argo-cd/) | GitOps 기반 배포 |
| **Argo Rollouts** | [`management/argo-rollout/`](../management/argo-rollout/) | 블루그린 배포 전략 |
| **EKS** | [`docs/AWS_EKS_Terraform.md`](./AWS_EKS_Terraform.md) | EKS 클러스터 구성 |
| **GitOps** | [`docs/ArgoCD_GitOps_배포전략가이드.md`](./ArgoCD_GitOps_배포전략가이드.md) | GitOps 배포 전략 |
| **네트워크** | [`docs/AWS_Network.md`](./AWS_Network.md) | VPC 및 네트워킹 |

---

<div align="center">

**🐳 ECR로 안전하고 효율적인 컨테이너 이미지 관리를 시작하세요!**

[![AWS ECR](https://img.shields.io/badge/AWS-ECR-FF9900)](https://aws.amazon.com/ecr/)
[![Docker](https://img.shields.io/badge/Docker-Ready-blue)](https://www.docker.com/)
[![Kubernetes](https://img.shields.io/badge/Kubernetes-326CE5)](https://kubernetes.io/)

</div> 