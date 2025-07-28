# GitHub Actions OIDC Provider for AWS
# GitHub Actions에서 AWS 리소스에 접근하기 위한 OIDC 설정

# GitHub Actions OIDC Provider 생성
resource "aws_iam_openid_connect_provider" "github_actions" {
  url = "https://token.actions.githubusercontent.com"

  client_id_list = ["sts.amazonaws.com"]

  thumbprint_list = [
    "6938fd4d98bab03faadb97b34396831e3780aea1"
  ]

  tags = {
    Name        = "github-actions-oidc-provider"
    Environment = var.environment
    Project     = var.project_name
  }
}

# GitHub Actions용 IAM Role 생성
resource "aws_iam_role" "github_actions" {
  name = "GitHubActionsRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRoleWithWebIdentity"
        Effect = "Allow"
        Principal = {
          Federated = aws_iam_openid_connect_provider.github_actions.arn
        }
        Condition = {
          StringEquals = {
            "token.actions.githubusercontent.com:aud" = "sts.amazonaws.com"
          }
          StringLike = {
            "token.actions.githubusercontent.com:sub" = "repo:chulgil/terraform:*"
          }
        }
      }
    ]
  })

  tags = {
    Name        = "github-actions-role"
    Environment = var.environment
    Project     = var.project_name
  }
}

# ECR 접근 권한 정책
resource "aws_iam_role_policy" "github_actions_ecr" {
  name = "GitHubActionsECRPolicy"
  role = aws_iam_role.github_actions.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "ecr:GetAuthorizationToken",
          "ecr:BatchCheckLayerAvailability",
          "ecr:GetDownloadUrlForLayer",
          "ecr:BatchGetImage",
          "ecr:PutImage",
          "ecr:InitiateLayerUpload",
          "ecr:UploadLayerPart",
          "ecr:CompleteLayerUpload"
        ]
        Resource = "*"
      },
      {
        Effect = "Allow"
        Action = [
          "ecr:CreateRepository",
          "ecr:DescribeRepositories"
        ]
        Resource = "*"
      }
    ]
  })
}

# Outputs
output "github_actions_role_arn" {
  description = "GitHub Actions IAM Role ARN"
  value       = aws_iam_role.github_actions.arn
}

output "github_actions_oidc_provider_arn" {
  description = "GitHub Actions OIDC Provider ARN"
  value       = aws_iam_openid_connect_provider.github_actions.arn
} 