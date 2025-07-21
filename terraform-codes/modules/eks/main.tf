# Get EKS cluster authentication data
data "aws_eks_cluster_auth" "main" {
  name = var.cluster_name
  depends_on = [aws_eks_cluster.main]
}

resource "aws_eks_cluster" "main" {
  name     = var.cluster_name
  role_arn = aws_iam_role.cluster.arn
  version  = var.kubernetes_version

  vpc_config {
    subnet_ids              = var.private_subnet_ids
    endpoint_private_access = true
    endpoint_public_access  = true
    public_access_cidrs     = ["0.0.0.0/0"]
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  depends_on = [
    aws_iam_role_policy_attachment.cluster_AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.cluster_AmazonEKSServicePolicy,
  ]

  tags = merge(
    local.common_tags,
    {
      Name = var.cluster_name
    }
  )
}

# Node Group
resource "aws_eks_node_group" "node_group" {
  cluster_name    = aws_eks_cluster.main.name
  node_group_name = coalesce(var.node_group_name, "${var.cluster_name}-node-group")
  node_role_arn   = aws_iam_role.node.arn
  subnet_ids      = var.private_subnet_ids
  ami_type        = var.ami_type
  disk_size       = var.node_disk_size
  instance_types  = var.instance_types
  capacity_type   = var.capacity_type
  
  # Add launch template for better control over node configuration
  launch_template {
    id      = aws_launch_template.eks_nodes.id
    version = "$Latest"
  }

  scaling_config {
    desired_size = var.desired_size
    max_size     = var.max_size
    min_size     = var.min_size
  }

  update_config {
    max_unavailable = 1
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  depends_on = [
    aws_iam_role_policy_attachment.node_AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.node_AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.node_AmazonEC2ContainerRegistryReadOnly,
    # Add additional required policies
    aws_iam_role_policy_attachment.node_AmazonSSMManagedInstanceCore,
    aws_iam_role_policy_attachment.node_AmazonEC2RoleforSSM
  ]

  tags = merge(
    var.tags,
    {
      "kubernetes.io/cluster/${var.cluster_name}" = "owned"
      "k8s.io/cluster-autoscaler/enabled"         = "true"
      "k8s.io/cluster-autoscaler/${var.cluster_name}" = "owned"
      # Add required tags for EKS
      "k8s.io/cluster/${var.cluster_name}" = "owned"
    }
  )

  lifecycle {
    create_before_destroy = true
    ignore_changes = [
      scaling_config[0].desired_size,
      scaling_config[0].min_size
    ]
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
      "kubernetes.io/cluster/${var.cluster_name}" = "owned"
    }
  )
}

# 출력값 - outputs.tf로 이동됨