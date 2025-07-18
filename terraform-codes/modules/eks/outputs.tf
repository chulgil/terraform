output "cluster_id" {
  description = "The name of the cluster"
  value       = aws_eks_cluster.main.id
}

output "cluster_endpoint" {
  description = "The endpoint for the EKS control plane"
  value       = aws_eks_cluster.main.endpoint
}

output "cluster_certificate_authority" {
  description = "The base64 encoded certificate data required to communicate with the cluster"
  value       = aws_eks_cluster.main.certificate_authority[0].data
}

output "cluster_security_group_id" {
  description = "The cluster security group ID"
  value       = aws_eks_cluster.main.vpc_config[0].cluster_security_group_id
}

output "region" {
  description = "The AWS region where the EKS cluster is deployed"
  value       = var.region
}

output "node_group_arn" {
  description = "The ARN of the node group"
  value       = aws_eks_node_group.node_group.arn
}

output "node_group_id" {
  description = "The ID of the node group"
  value       = aws_eks_node_group.node_group.id
}

output "cluster_token" {
  description = "The token to authenticate with the EKS cluster"
  value       = data.aws_eks_cluster_auth.main.token
  sensitive   = true
}

output "cluster_name" {
  description = "The name of the EKS cluster"
  value       = aws_eks_cluster.main.name
}

output "cluster_oidc_issuer_url" {
  description = "The OIDC issuer URL for the EKS cluster"
  value       = aws_eks_cluster.main.identity[0].oidc[0].issuer
}
