# AWS Load Balancer Controller 설치 (실제 동작 코드)

# OIDC Provider 정보 (eks 모듈 output 활용)
data "aws_eks_cluster" "eks" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "eks" {
  name = module.eks.cluster_id
}

data "aws_iam_openid_connect_provider" "oidc" {
  url = replace(data.aws_eks_cluster.eks.identity[0].oidc[0].issuer, "https://", "")
}

# Assume Role Policy Document for ServiceAccount
# (OIDC Provider 및 ServiceAccount 조건 명확히)
data "aws_iam_policy_document" "alb_controller_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]
    effect  = "Allow"
    principals {
      type        = "Federated"
      identifiers = [data.aws_iam_openid_connect_provider.oidc.arn]
    }
    condition {
      test     = "StringEquals"
      variable = "${replace(data.aws_eks_cluster.eks.identity[0].oidc[0].issuer, "https://", "")}:sub"
      values   = ["system:serviceaccount:kube-system:aws-load-balancer-controller"]
    }
  }
}

# (1) IAM Policy 생성
resource "aws_iam_policy" "alb_controller" {
  name        = "AWSLoadBalancerControllerIAMPolicy"
  description = "Policy for AWS Load Balancer Controller"
  policy      = file("aws-load-balancer-controller-policy.json")
}

# (2) IAM Role 생성 및 OIDC 연결
resource "aws_iam_role" "alb_controller" {
  name               = "eks-alb-controller-role"
  assume_role_policy = data.aws_iam_policy_document.alb_controller_assume_role_policy.json
}

# (3) Role-Policy Attach
resource "aws_iam_role_policy_attachment" "alb_controller" {
  role       = aws_iam_role.alb_controller.name
  policy_arn = aws_iam_policy.alb_controller.arn
}

# (4) ServiceAccount 생성 (ALB Controller용)
resource "kubernetes_service_account" "alb_controller" {
  metadata {
    name      = "aws-load-balancer-controller"
    namespace = "kube-system"
    annotations = {
      "eks.amazonaws.com/role-arn" = aws_iam_role.alb_controller.arn
    }
  }
  depends_on = [aws_iam_role_policy_attachment.alb_controller]
}

# (5) Helm 설치는 Terraform 외부에서 아래 명령어로 진행
#
# helm repo add eks https://aws.github.io/eks-charts
# helm repo update
# helm upgrade -i aws-load-balancer-controller eks/aws-load-balancer-controller \
#   --namespace kube-system \
#   --set clusterName=<EKS_CLUSTER_NAME> \
#   --set serviceAccount.create=false \
#   --set serviceAccount.name=aws-load-balancer-controller \
#   --set region=<REGION> \
#   --set vpcId=<VPC_ID>
#
# - <EKS_CLUSTER_NAME>, <REGION>, <VPC_ID>는 실제 값으로 교체
# - 정책 파일(aws-load-balancer-controller-policy.json)은 공식 문서 최신 버전 사용
