# This file now contains only application-specific IAM resources
# EKS cluster and node group IAM roles have been moved to the EKS module

# IAM Role for EFS CSI Driver (IRSA)
data "aws_iam_policy_document" "efs_csi_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]
    effect  = "Allow"

    condition {
      test     = "StringEquals"
      variable = "${replace(var.oidc_provider, "https://", "")}:sub"
      values   = ["system:serviceaccount:kube-system:efs-csi-controller-sa"]
    }

    principals {
      identifiers = [var.oidc_provider_arn]
      type        = "Federated"
    }
  }
}

resource "aws_iam_role" "efs_csi_driver" {
  name               = "${var.environment}-efs-csi-driver-role"
  assume_role_policy = data.aws_iam_policy_document.efs_csi_assume_role_policy.json
  
  tags = merge(
    var.common_tags,
    {
      Name = "${var.environment}-efs-csi-driver-role"
    }
  )
}

# EFS CSI Driver IAM Policy
resource "aws_iam_policy" "efs_csi_driver" {
  name        = "${var.environment}-efs-csi-driver-policy"
  description = "Policy for EFS CSI driver"
  
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "elasticfilesystem:DescribeAccessPoints",
          "elasticfilesystem:DescribeFileSystems",
          "elasticfilesystem:DescribeMountTargets",
          "ec2:DescribeAvailabilityZones"
        ]
        Resource = "*"
      },
      {
        Effect = "Allow"
        Action = ["elasticfilesystem:CreateAccessPoint"]
        Resource = "*"
        Condition = {
          StringLike = {
            "aws:RequestTag/efs.csi.aws.com/cluster" = "true"
          }
        }
      },
      {
        Effect = "Allow"
        Action = ["elasticfilesystem:DeleteAccessPoint"]
        Resource = "*"
        Condition = {
          StringEquals = {
            "aws:ResourceTag/efs.csi.aws.com/cluster" = "true"
          }
        }
      }
    ]
  })
}

# Attach the policy to the role
resource "aws_iam_role_policy_attachment" "efs_csi_driver" {
  role       = aws_iam_role.efs_csi_driver.name
  policy_arn = aws_iam_policy.efs_csi_driver.arn
}

# Note: EFS CSI Driver policy attachment to node role is now handled in the EKS module

