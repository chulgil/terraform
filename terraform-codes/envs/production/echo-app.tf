# EKS 클러스터 output을 활용한 kubernetes provider 설정 예시
provider "kubernetes" {
  host                   = data.aws_eks_cluster.eks.endpoint
  token                  = data.aws_eks_cluster_auth.eks.token
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks.certificate_authority[0].data)
}

# echo 서버 배포 (Deployment)
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

# echo 서비스 (NodePort)
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

# ALB Ingress (ALB Controller가 설치되어 있어야 정상 동작)
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

# 주석
# - ALB Controller가 반드시 설치되어 있어야 Ingress가 동작합니다.
# - 별도 환경에서 provider를 구성하려면 config_path, config_context를 활용할 수 있습니다.
# - 실제 운영 반영 전, IAM, 보안, 네임스페이스 등 추가 구성이 필요할 수 있습니다.
