# Get current AWS account ID
data "aws_caller_identity" "current" {}

resource "aws_eks_cluster" "test-eks-cluster" {
  depends_on = [
    aws_iam_role_policy_attachment.test-iam-policy-eks-cluster,
    aws_iam_role_policy_attachment.test-iam-policy-eks-cluster-vpc,
  ]

  name     = var.cluster_name
  role_arn = aws_iam_role.test-iam-role-eks-cluster.arn
  version  = var.eks_version
  
  # Enable cluster logging
  enabled_cluster_log_types = var.enabled_cluster_log_types

  # Configure Kubernetes network
  kubernetes_network_config {
    ip_family         = "ipv4"  # or "ipv6" for IPv6
    service_ipv4_cidr = var.cluster_service_ipv4_cidr
  }

  # Configure VPC and networking
  vpc_config {
    security_group_ids      = [aws_security_group.test-sg-eks-cluster.id]
    subnet_ids             = var.subnet_ids
    endpoint_public_access  = var.cluster_endpoint_public_access
    endpoint_private_access = var.cluster_endpoint_private_access
    
    # Optional: Restrict public API access to specific CIDR blocks
    # public_access_cidrs = ["192.0.2.0/24", "198.51.100.0/24"]
  }

  # Enable encryption for Kubernetes secrets using KMS
  encryption_config {
    provider {
      key_arn = aws_kms_key.eks_encryption_key.arn
    }
    resources = ["secrets"]
  }

  tags = merge(
    var.tags,
    {
      "Name" = var.cluster_name
      "kubernetes.io/cluster/${var.cluster_name}" = "owned"
    }
  )
}

# KMS Key for EKS Secret Encryption
resource "aws_kms_key" "eks_encryption_key" {
  description             = "EKS Secret Encryption Key for ${var.cluster_name}"
  deletion_window_in_days = var.kms_key_deletion_window_in_days
  enable_key_rotation     = var.enable_kms_key_rotation
  
  policy = data.aws_iam_policy_document.kms_key_policy.json
  
  tags = merge(
    var.tags,
    {
      Name = "${var.cluster_name}-encryption-key"
    }
  )
}

# KMS Key Policy
data "aws_iam_policy_document" "kms_key_policy" {
  statement {
    sid    = "Enable IAM User Permissions"
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"]
    }
    actions   = ["kms:*"]
    resources = ["*"]
  }
  
  statement {
    sid    = "Allow EKS to use the key"
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["eks.amazonaws.com"]
    }
    actions = [
      "kms:Encrypt",
      "kms:Decrypt",
      "kms:ReEncrypt*",
      "kms:GenerateDataKey*",
      "kms:DescribeKey"
    ]
    resources = ["*"]
  }
}