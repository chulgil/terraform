# AWS EKS와 Terraform - 기술 가이드

## 소개

이 문서는 Terraform을 사용하여 AWS EKS (Elastic Kubernetes Service)에 웹 애플리케이션을 배포하기 위한 기술 가이드를 제공합니다. 이 가이드는 KakaoStyle devblog의 "[2. Web Application using EKS](https://devblog.kakaostyle.com/ko/2022-03-31-2-web-application-using-eks/)" 블로그 게시물을 기반으로 합니다. 이 가이드에서는 Terraform을 사용하여 인프라를 설정하는 것부터 시작하여 EKS 클러스터에 샘플 웹 애플리케이션을 배포하고 실행하는 데 필요한 단계를 안내합니다.

## 전제 조건

*   적절한 권한을 가진 AWS 계정.
*   Terraform이 설치 및 구성되어 있어야 합니다.
*   EKS 클러스터에 연결하도록 kubectl이 설치 및 구성되어 있어야 합니다.
*   AWS CLI가 설치 및 구성되어 있어야 합니다.
*   Kubernetes 및 Terraform에 대한 기본적인 이해가 필요합니다.

## Step-by-step guide

### 1. VPC, Subnet, EKS Cluster, Node Group 생성 (Terraform Module)

이 섹션에서는 Terraform 모듈을 사용하여 VPC, Subnet, EKS 클러스터 및 노드 그룹을 생성하는 방법을 설명합니다.

**Terraform Module 구조 (예시)**

```terraform
# main.tf (VPC, Subnet, EKS Cluster, Node Group)
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0"

  name = "k8s-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["ap-northeast-2a", "ap-northeast-2b"]
  public_subnets  = ["10.0.0.0/20", "10.0.16.0/20"]
  # 필요시 private_subnets 추가
  # private_subnets = ["10.0.128.0/20", ...]

  enable_nat_gateway = true
  single_nat_gateway = true

  public_subnet_tags = {
    "kubernetes.io/cluster/test-eks-cluster" = "shared"
    "kubernetes.io/role/elb"                 = "1"
  }

  # 필요시 private_subnet_tags 추가
  # private_subnet_tags = {
  #   "kubernetes.io/cluster/test-eks-cluster" = "shared"
  #   "kubernetes.io/role/internal-elb"        = "1"
  # }
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 19.0"  # Use the latest version

  cluster_name                   = "my-eks-cluster"
  cluster_version                = "1.33"  # Replace with your desired Kubernetes version
  subnet_ids                     = module.vpc.private_subnets
  vpc_id                         = module.vpc.vpc_id

  create_iam_role                = true
  eks_managed_node_group_defaults = {
    instance_types = ["t3.medium"]
  }

  eks_managed_node_groups = {
    default = {
      min_size     = 1
      max_size     = 3
      desired_size = 2
    }
  }
}

# variables.tf (예시)
variable "region" {
  type        = string
  description = "AWS region to deploy to"
  default     = "ap-northeast-2"
}

# outputs.tf (예시)
output "cluster_endpoint" {
  description = "Endpoint for EKS control plane."
  value       = module.eks.cluster_endpoint
}

output "cluster_id" {
  description = "EKS cluster ID."
  value       = module.eks.cluster_id
}

output "kubeconfig" {
  description = "kubectl config to connect to the EKS cluster."
  value       = module.eks.kubeconfig
}
```

**설명:**

*   `module "vpc"`: Terraform AWS VPC 모듈을 사용하여 VPC, 서브넷, 인터넷 게이트웨이, NAT 게이트웨이 등을 생성합니다.
*   `module "eks"`: Terraform AWS EKS 모듈을 사용하여 EKS 클러스터 및 관리형 노드 그룹을 생성합니다.
*   `variables.tf`: 배포에 필요한 변수를 정의합니다.
*   `outputs.tf`: 배포 후 얻을 수 있는 출력 값을 정의합니다.

**Terraform 실행:**

1.  Terraform 파일을 저장합니다.
2.  터미널에서 해당 디렉토리로 이동합니다.
3.  `terraform init` 명령어를 실행하여 Terraform을 초기화하고 필요한 플러그인을 다운로드합니다.
4.  `terraform plan` 명령어를 실행하여 실행 계획을 확인합니다.
5.  `terraform apply` 명령어를 실행하여 인프라를 프로비저닝합니다.

### 2. 샘플 애플리케이션 배포

EKS 클러스터가 성공적으로 생성되면 kubectl을 사용하여 샘플 애플리케이션을 배포할 수 있습니다.

**kubectl 구성 업데이트:**

```bash
aws eks update-kubeconfig --region <your-region> --name <your-cluster-name>
```

**샘플 애플리케이션 YAML (예시):**

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-app-deployment
spec:
  replicas: 2
  selector:
    matchLabels:
      app: my-app
  template:
    metadata:
      labels:
        app: my-app
    spec:
      containers:
      - name: my-app-container
        image: your-docker-image:latest  # 실제 Docker 이미지로 교체
        ports:
        - containerPort: 80

---
apiVersion: v1
kind: Service
metadata:
  name: my-app-service
spec:
  selector:
    app: my-app
  ports:
    - protocol: TCP
      port: 80
      targetPort: 80
  type: LoadBalancer # 또는 ClusterIP, NodePort 등
```

**애플리케이션 배포:**

1.  위 YAML 내용을 `app.yaml` 파일로 저장합니다.
2.  터미널에서 다음 명령어를 실행하여 애플리케이션을 배포합니다.

```bash
kubectl apply -f app.yaml
```

**배포 확인:**

---

### 3. AWS Load Balancer Controller 설치

EKS에서 Ingress(ALB)를 사용하려면 AWS Load Balancer Controller가 반드시 설치되어 있어야 합니다. 이 컨트롤러는 ALB Ingress 리소스를 자동으로 관리해줍니다.

#### 설치 준비
- EKS 클러스터에 OIDC Provider가 연결되어 있어야 합니다.
- ALB Controller용 IAM 정책 및 ServiceAccount가 필요합니다.
- Helm이 설치되어 있어야 합니다.

#### 설치 절차 (요약)

1. **IAM 정책 생성 및 연결**
2. **ServiceAccount 생성**
3. **Helm으로 Controller 설치**

#### 예시 코드 및 명령어

```hcl
# (1) OIDC Provider 연결 (terraform-aws-modules/eks/aws 사용 시 자동 처리됨)

# (2) IAM Policy 생성
resource "aws_iam_policy" "alb_controller" {
  name        = "AWSLoadBalancerControllerIAMPolicy"
  description = "Policy for AWS Load Balancer Controller"
  policy      = file("aws-load-balancer-controller-policy.json")
}

# (3) ServiceAccount 생성 (eks 모듈 output 활용)
resource "kubernetes_service_account" "alb_controller" {
  metadata {
    name      = "aws-load-balancer-controller"
    namespace = "kube-system"
    annotations = {
      "eks.amazonaws.com/role-arn" = aws_iam_role.alb_controller.arn
    }
  }
}

# (4) IAM Role 연결
resource "aws_iam_role" "alb_controller" {
  name = "eks-alb-controller-role"
  assume_role_policy = data.aws_iam_policy_document.alb_controller_assume_role_policy.json
}

# (5) Role-Policy Attach
resource "aws_iam_role_policy_attachment" "alb_controller" {
  role       = aws_iam_role.alb_controller.name
  policy_arn = aws_iam_policy.alb_controller.arn
}
```

```bash
# (6) Helm repo 추가 및 설치 (kubectl/Helm 필요)
helm repo add eks https://aws.github.io/eks-charts
helm repo update

helm upgrade -i aws-load-balancer-controller eks/aws-load-balancer-controller \
  --namespace kube-system \
  --set clusterName=<EKS_CLUSTER_NAME> \
  --set serviceAccount.create=false \
  --set serviceAccount.name=aws-load-balancer-controller \
  --set region=<REGION> \
  --set vpcId=<VPC_ID>
```

- `<EKS_CLUSTER_NAME>`, `<REGION>`, `<VPC_ID>`는 실제 값으로 교체
- 정책 파일(`aws-load-balancer-controller-policy.json`)은 [공식 문서](https://docs.aws.amazon.com/eks/latest/userguide/aws-load-balancer-controller.html)에서 제공

#### 참고
- Controller 설치 후 Ingress 리소스가 정상적으로 ALB로 생성/연결됩니다.
- IAM, ServiceAccount, OIDC, Helm 등은 모두 Terraform으로 관리 가능
- 자세한 내용은 [공식 가이드](https://docs.aws.amazon.com/eks/latest/userguide/aws-load-balancer-controller.html) 및 [카카오스타일 블로그](https://devblog.kakaostyle.com/ko/2022-03-31-3-build-eks-cluster-with-terraform/) 참고

---

### 4. Terraform으로 Kubernetes 애플리케이션 배포 (예시: Echo Server)

Terraform의 `kubernetes` provider를 활용해 EKS 클러스터에 직접 애플리케이션을 배포할 수도 있습니다. 아래는 [카카오스타일 devblog](https://devblog.kakaostyle.com/ko/2022-03-31-3-build-eks-cluster-with-terraform/)의 예시를 참고한 코드입니다.

#### provider 및 리소스 예시

```hcl
provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  token                  = data.aws_eks_cluster_auth.this.token
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
}

resource "kubernetes_deployment" "echo" {
  metadata {
    name = "echo"
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        "app.kubernetes.io/name" = "echo"
      }
    }
    template {
      metadata {
        labels = {
          "app.kubernetes.io/name" = "echo"
        }
      }
      spec {
        container {
          image = "k8s.gcr.io/echoserver:1.10"
          name  = "echo"
        }
      }
    }
  }
}

resource "kubernetes_service" "echo" {
  metadata {
    name = "echo"
  }
  spec {
    selector = {
      "app.kubernetes.io/name" = "echo"
    }
    port {
      port        = 8080
      target_port = 8080
    }
    type = "NodePort"
  }
}

resource "kubernetes_ingress_v1" "alb" {
  metadata {
    name = "alb"
    annotations = {
      "alb.ingress.kubernetes.io/scheme"      = "internet-facing"
      "alb.ingress.kubernetes.io/target-type" = "ip"
    }
  }
  spec {
    ingress_class_name = "alb"
    rule {
      http {
        path {
          backend {
            service {
              name = kubernetes_service.echo.metadata[0].name
              port {
                number = 8080
              }
            }
          }
          path = "/*"
        }
      }
    }
  }
}
```

- EKS 모듈의 output을 활용해 provider를 구성합니다.
- echo 서버를 Deployment/Service/Ingress로 배포합니다.
- Ingress는 ALB Controller가 설치되어 있어야 동작합니다.

#### 참고
- 별도 스택/환경에서 관리할 경우 provider `config_path`/`config_context`를 사용할 수 있습니다.
- 실제 배포 시에는 IAM, ALB Controller 등 추가 리소스가 필요할 수 있습니다.

---


```bash
kubectl get deployments
kubectl get services
kubectl get pods
```

## 결론

이 가이드는 Terraform을 사용하여 AWS EKS에 웹 애플리케이션을 배포하는 기본적인 개요를 제공합니다. 자리 표시자 값(예: Docker 이미지 이름)을 실제 애플리케이션 세부 정보로 바꾸는 것을 잊지 마십시오. 추가 단계에는 ingress controller 설정, 자동 스케일링 구성 및 CI/CD 파이프라인 구현이 포함될 수 있습니다.

## Helm Charts에 대한 설명 및 추측

블로그 게시물에서 Terraform 대신 Helm Charts를 사용하여 애플리케이션을 정의했다는 언급이 있습니다. Helm Charts는 Kubernetes 애플리케이션을 패키징, 구성 및 배포하기 위한 도구입니다.

**Helm Charts의 장점:**

*   **재사용성:** Helm Charts를 사용하면 애플리케이션을 쉽게 패키징하고 재사용할 수 있습니다.
*   **표준화:** Helm Charts는 Kubernetes 애플리케이션 배포를 위한 표준화된 방법을 제공합니다.
*   **버전 관리:** Helm Charts는 애플리케이션의 버전 관리를 용이하게 합니다.

**애매한 점에 대한 추측:**

Terraform과 Helm Charts를 함께 사용하는 경우, 인프라(Terraform)와 애플리케이션(Helm Charts) 정의가 분리되어 관리됩니다. 이는 장점이 될 수 있지만, 두 가지 도구를 함께 관리해야 한다는 단점도 있습니다. 또한, Terraform과 Helm Charts는 모두 Kubernetes 리소스를 정의할 수 있으므로 중복성이 발생할 수 있습니다.

## 참고 자료

*   [원문 블로그 게시물](https://devblog.kakaostyle.com/ko/2022-03-31-2-web-application-using-eks/)
*   [Terraform AWS EKS Module](https://registry.terraform.io/modules/terraform-aws-modules/eks/aws/latest)
*   [Terraform AWS VPC Module](https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest)
