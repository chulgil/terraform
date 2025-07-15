# Node IAM Role Output
output "node_group_iam_role_arn" {
  description = "ARN of the node group IAM role"
  value       = aws_iam_role.test-iam-role-eks-nodegroup.arn
}

# Node Security Group Output
output "node_security_group_id" {
  description = "ID of the node security group"
  value       = aws_security_group.test-sg-eks-nodegroup.id
}

# EKS Node Group
resource "aws_eks_node_group" "test-eks-nodegroup" {
  cluster_name    = aws_eks_cluster.test-eks-cluster.name
  node_group_name = "${var.cluster_name}-nodegroup"
  node_role_arn   = aws_iam_role.test-iam-role-eks-nodegroup.arn
  subnet_ids      = var.subnet_ids
  
  # Instance configuration
  instance_types = var.node_group_instance_types
  capacity_type  = var.node_group_capacity_type
  disk_size      = var.node_group_disk_size
  ami_type       = var.node_group_ami_type
  
  # Scaling configuration
  scaling_config {
    desired_size = var.node_group_desired_size
    min_size     = var.node_group_min_size
    max_size     = var.node_group_max_size
  }

  # Update configuration
  update_config {
    max_unavailable_percentage = 33
  }

  # Labels and taints
  labels = merge(
    var.node_group_labels,
    {
      "node.kubernetes.io/role" = "worker"
    }
  )

  # Taints (uncomment and modify as needed)
  # taint {
  #   key    = "dedicated"
  #   value  = "gpuGroup"
  #   effect = "NO_SCHEDULE"
  # }

  # Launch template (uncomment if using custom launch template)
  # launch_template {
  #   name    = aws_launch_template.eks_launch_template.name
  #   version = aws_launch_template.eks_launch_template.latest_version
  # }

  # Ensure proper ordering of resource creation
  depends_on = [
    aws_iam_role_policy_attachment.test-iam-policy-eks-nodegroup,
    aws_iam_role_policy_attachment.test-iam-policy-eks-nodegroup-cni,
    aws_iam_role_policy_attachment.test-iam-policy-eks-nodegroup-ecr,
    aws_eks_cluster.test-eks-cluster,
    aws_security_group_rule.nodes,
    aws_security_group_rule.nodes_inbound
  ]

  tags = merge(
    var.tags,
    {
      "Name" = "${var.cluster_name}-node-group"
      # Required for AWS Load Balancer Controller
      "k8s.io/cluster-autoscaler/enabled" = "true"
      "k8s.io/cluster-autoscaler/${var.cluster_name}" = "owned"
    }
  )
}

# EKS Node Group2
resource "aws_eks_node_group" "test-eks-nodegroup2" {
  cluster_name    = aws_eks_cluster.test-eks-cluster.name
  node_group_name = "${var.cluster_name}-nodegroup2"
  node_role_arn   = aws_iam_role.test-iam-role-eks-nodegroup.arn
  subnet_ids      = var.subnet_ids
  
  # Instance configuration
  # instance_types = var.node_group_instance_types
  capacity_type  = var.node_group_capacity_type
  # disk_size      = var.node_group_disk_size
  ami_type       = var.node_group_ami_type
  
  # Scaling configuration
  scaling_config {
    desired_size = var.node_group_desired_size
    min_size     = var.node_group_min_size
    max_size     = var.node_group_max_size
  }

  # Update configuration
  update_config {
    max_unavailable_percentage = 33
  }

  # Labels and taints
  labels = merge(
    var.node_group_labels,
    {
      "node.kubernetes.io/role" = "worker"
    }
  )

  # Taints (uncomment and modify as needed)
  # taint {
  #   key    = "dedicated"
  #   value  = "gpuGroup"
  #   effect = "NO_SCHEDULE"
  # }

  # Launch template (uncomment if using custom launch template)
  launch_template {
    name    = aws_launch_template.test_launch_template.name
    version = aws_launch_template.test_launch_template.latest_version
  }

  # Ensure proper ordering of resource creation
  depends_on = [
    aws_iam_role_policy_attachment.test-iam-policy-eks-nodegroup,
    aws_iam_role_policy_attachment.test-iam-policy-eks-nodegroup-cni,
    aws_iam_role_policy_attachment.test-iam-policy-eks-nodegroup-ecr,
    aws_eks_cluster.test-eks-cluster,
    aws_security_group_rule.nodes,
    aws_security_group_rule.nodes_inbound
  ]

  tags = merge(
    var.tags,
    {
      "Name" = "${var.cluster_name}-node-group2"
      # Required for AWS Load Balancer Controller
      "k8s.io/cluster-autoscaler/enabled" = "true"
      "k8s.io/cluster-autoscaler/${var.cluster_name}" = "owned"
    }
  )
}


# Node Group IAM Role for Service Account
resource "aws_iam_openid_connect_provider" "cluster" {
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = [data.tls_certificate.cluster.certificates[0].sha1_fingerprint]
  url             = aws_eks_cluster.test-eks-cluster.identity[0].oidc[0].issuer
}

data "tls_certificate" "cluster" {
  url = aws_eks_cluster.test-eks-cluster.identity[0].oidc[0].issuer
}

# IAM Policy for Cluster Autoscaler
resource "aws_iam_policy" "cluster_autoscaler" {
  name        = "${var.cluster_name}-cluster-autoscaler"
  description = "Policy for Kubernetes Cluster Autoscaler"
  
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "autoscaling:DescribeAutoScalingGroups",
          "autoscaling:DescribeAutoScalingInstances",
          "autoscaling:DescribeLaunchConfigurations",
          "autoscaling:DescribeTags",
          "autoscaling:SetDesiredCapacity",
          "autoscaling:TerminateInstanceInAutoScalingGroup",
          "ec2:DescribeLaunchTemplateVersions"
        ]
        Resource = "*"
      }
    ]
  })
}

# Attach the autoscaler policy to the node role
resource "aws_iam_role_policy_attachment" "cluster_autoscaler" {
  policy_arn = aws_iam_policy.cluster_autoscaler.arn
  role       = aws_iam_role.test-iam-role-eks-nodegroup.name
}
