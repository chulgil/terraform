# OIDC Provider for IAM Roles for Service Accounts (IRSA)
data "tls_certificate" "cluster" {
  url = one(aws_eks_cluster.main.identity[*].oidc[0].issuer)
}

resource "aws_iam_openid_connect_provider" "main" {
  count = var.enable_irsa ? 1 : 0
  
  client_id_list = ["sts.amazonaws.com"]
  thumbprint_list = [
    one(data.tls_certificate.cluster.certificates[*].sha1_fingerprint)
  ]
  
  url = one(aws_eks_cluster.main.identity[*].oidc[0].issuer)

  tags = merge(
    var.common_tags,
    {
      Name = "${var.cluster_name}-oidc"
    }
  )
  
  # Ensure the cluster is fully created before creating the OIDC provider
  depends_on = [
    aws_eks_cluster.main
  ]
}
