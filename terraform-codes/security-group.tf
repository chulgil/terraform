resource "aws_security_group" "test-sg-eks-cluster" {
  name        = "${var.cluster_name}-cluster-sg"
  description = "Cluster communication with worker nodes"
  vpc_id      = var.vpc_id

  tags = merge(
    var.tags,
    {
      "Name" = "${var.cluster_name}-cluster-sg"
    }
  )
}

# Allow inbound traffic from the cluster security group to the node groups
resource "aws_security_group_rule" "cluster_inbound" {
  description              = "Allow worker nodes to communicate with the cluster API Server"
  from_port                = 443
  protocol                 = "tcp"
  security_group_id        = aws_security_group.test-sg-eks-cluster.id
  source_security_group_id = aws_security_group.test-sg-eks-nodegroup.id
  to_port                  = 443
  type                     = "ingress"
}

# Allow outbound traffic to the internet
resource "aws_security_group_rule" "cluster_outbound" {
  description       = "Allow cluster to communicate with the internet"
  from_port         = 0
  protocol          = "-1"
  security_group_id = aws_security_group.test-sg-eks-cluster.id
  cidr_blocks       = ["0.0.0.0/0"]
  to_port           = 0
  type              = "egress"
}

# Security group for EKS node groups
resource "aws_security_group" "test-sg-eks-nodegroup" {
  name        = "${var.cluster_name}-nodegroup-sg"
  description = "Security group for all nodes in the cluster"
  vpc_id      = var.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    var.tags,
    {
      "Name" = "${var.cluster_name}-nodegroup-sg"
      # Tag required for the AWS Load Balancer Controller
      "kubernetes.io/cluster/${var.cluster_name}" = "owned"
    }
  )
}

resource "aws_security_group_rule" "nodes" {
  description              = "Allow nodes to communicate with each other"
  from_port                = 0
  protocol                 = "-1"
  security_group_id        = aws_security_group.test-sg-eks-nodegroup.id
  source_security_group_id = aws_security_group.test-sg-eks-nodegroup.id
  to_port                  = 65535
  type                     = "ingress"
}

resource "aws_security_group_rule" "nodes_inbound" {
  description              = "Allow worker Kubelets and pods to receive communication from the cluster control plane"
  from_port                = 1025
  protocol                 = "tcp"
  security_group_id        = aws_security_group.test-sg-eks-nodegroup.id
  source_security_group_id = aws_security_group.test-sg-eks-cluster.id
  to_port                  = 65535
  type                     = "ingress"
}