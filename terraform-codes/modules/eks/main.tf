# Get EKS cluster authentication data
data "aws_eks_cluster_auth" "main" {
  name = var.cluster_name
  depends_on = [aws_eks_cluster.main]
}

resource "aws_eks_cluster" "main" {
  name     = var.cluster_name
  role_arn = aws_iam_role.cluster.arn
  version  = var.kubernetes_version
  
  # AWS EKS 1.33에 필요한 애드온 구성
  # EKS 클러스터 생성 후 애드온 리소스로 따로 생성
  kubernetes_network_config {
    service_ipv4_cidr = var.service_ipv4_cidr
  }

  vpc_config {
    subnet_ids              = var.private_subnet_ids
    endpoint_private_access = true
    endpoint_public_access  = true
    public_access_cidrs     = ["0.0.0.0/0"]
  }

  # Ensure that IAM Role has proper permissions before creating the EKS cluster.
  # The actual IAM role policy attachments are defined in the IAM module.
  depends_on = [
    aws_iam_role.cluster
  ]

  tags = merge(
    local.common_tags,
    {
      Name = var.cluster_name
    }
  )
}

# Node Group - Temporarily using managed node group without launch template
resource "aws_eks_node_group" "node_group" {
  cluster_name    = aws_eks_cluster.main.name
  node_group_name = coalesce(var.node_group_name, "${var.cluster_name}-node-group")
  node_role_arn   = aws_iam_role.node.arn
  subnet_ids      = var.private_subnet_ids
  ami_type        = "AL2023_x86_64_STANDARD"  # Use managed AMI type for testing
  capacity_type   = var.capacity_type
  instance_types  = var.instance_types
  
  # Temporarily disable launch template for debugging
  # launch_template {
  #   id      = aws_launch_template.eks_nodes.id
  #   version = "$Latest"
  # }

  scaling_config {
    desired_size = var.desired_size
    max_size     = var.max_size
    min_size     = var.min_size
  }

  update_config {
    max_unavailable = 1
  }

  # Ensure that IAM Role has proper permissions before creating the node group
  # The actual IAM role policy attachments are defined in the IAM module
  depends_on = [
    aws_iam_role.node
  ]

  tags = merge(
    var.tags,
    var.common_tags,
    {
      "kubernetes-io-cluster-${var.cluster_name}" = "owned"
      "k8s-io-cluster-autoscaler-enabled"         = "true"
      "k8s-io-cluster-autoscaler-${var.cluster_name}" = "owned"
      "k8s-io-cluster-${var.cluster_name}"        = "owned"
      "ManagedBy"                                 = "Terraform"
      "RetryCount"                               = "0"
      "Environment"                              = var.environment
      "Terraform"                                = "true"
      "Project"                                  = var.project_name
    }
  )

  lifecycle {
    create_before_destroy = true
    ignore_changes = [
      scaling_config[0].desired_size,
      scaling_config[0].min_size,
      # Ignore changes to launch template version to allow rolling updates
      launch_template[0].version,
      # Ignore tags that might be modified by external processes
      tags,
    ]
    
    # Add a precondition to check if the cluster is in a valid state
    # before attempting to create or update the node group
    precondition {
      condition     = can(regex("^[a-zA-Z][a-zA-Z0-9\\.\\-]*$", var.cluster_name))
      error_message = "The cluster name must be a valid DNS subdomain name."
    }
  }
}

# Kubernetes provider configuration
provider "kubernetes" {
  host                   = aws_eks_cluster.main.endpoint
  cluster_ca_certificate = base64decode(aws_eks_cluster.main.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.main.token
  
  # Fallback to exec if token is not available yet
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "aws"
    args = [
      "eks",
      "get-token",
      "--cluster-name",
      aws_eks_cluster.main.name,
      "--region",
      var.region
    ]
  }
}

# Security Group for EKS Worker Nodes
resource "aws_security_group" "worker_nodes" {
  name_prefix = "${var.cluster_name}-worker-nodes-"
  description = "Security group for EKS worker nodes"
  vpc_id      = var.vpc_id

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow inbound traffic from the cluster security group
  ingress {
    from_port       = 0
    to_port         = 65535
    protocol        = "tcp"
    security_groups = [aws_eks_cluster.main.vpc_config[0].cluster_security_group_id]
  }

  # Allow worker nodes to communicate with each other
  ingress {
    from_port = 0
    to_port   = 65535
    protocol  = "tcp"
    self      = true
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.cluster_name}-worker-nodes-sg"
      "kubernetes-io-cluster-${var.cluster_name}" = "owned"
    }
  )
}

# 출력값 - outputs.tf로 이동됨