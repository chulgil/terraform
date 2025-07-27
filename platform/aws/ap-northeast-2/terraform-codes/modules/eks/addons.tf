# EKS 애드온 - CoreDNS
resource "aws_eks_addon" "coredns" {
  cluster_name      = aws_eks_cluster.main.name
  addon_name        = "coredns"
  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "OVERWRITE"
  
  depends_on = [
    aws_eks_node_group.node_group
  ]
  
  tags = merge(
    var.tags,
    var.common_tags,
    {
      Name = "${var.cluster_name}-coredns-addon"
    }
  )
}

# EKS 애드온 - kube-proxy
resource "aws_eks_addon" "kube_proxy" {
  cluster_name      = aws_eks_cluster.main.name
  addon_name        = "kube-proxy"
  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "OVERWRITE"
  
  depends_on = [
    aws_eks_node_group.node_group
  ]
  
  tags = merge(
    var.tags,
    var.common_tags,
    {
      Name = "${var.cluster_name}-kube-proxy-addon"
    }
  )
}

# EKS 애드온 - VPC CNI
resource "aws_eks_addon" "vpc_cni" {
  cluster_name      = aws_eks_cluster.main.name
  addon_name        = "vpc-cni"
  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "OVERWRITE"
  
  # AWS EKS 1.33에서 권장하는 CNI 구성
  configuration_values = jsonencode({
    env = {
      # AWS EKS 1.33에 필요한 설정
      ENABLE_PREFIX_DELEGATION = "true"
      WARM_PREFIX_TARGET       = "1"
    }
  })
  
  depends_on = [
    aws_eks_node_group.node_group
  ]
  
  tags = merge(
    var.tags,
    var.common_tags,
    {
      Name = "${var.cluster_name}-vpc-cni-addon"
    }
  )
}

# EKS 애드온 - EBS CSI Driver 
resource "aws_eks_addon" "ebs_csi_driver" {
  cluster_name      = aws_eks_cluster.main.name
  addon_name        = "aws-ebs-csi-driver"
  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "OVERWRITE"
  
  depends_on = [
    aws_eks_node_group.node_group
  ]
  
  tags = merge(
    var.tags,
    var.common_tags,
    {
      Name = "${var.cluster_name}-ebs-csi-driver-addon"
    }
  )
}
