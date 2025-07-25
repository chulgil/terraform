output "cluster_autoscaler_role_arn" {
  description = "ARN of the Cluster Autoscaler IAM role"
  value       = aws_iam_role.cluster_autoscaler.arn
}

output "cluster_autoscaler_role_name" {
  description = "Name of the Cluster Autoscaler IAM role"
  value       = aws_iam_role.cluster_autoscaler.name
}

output "cluster_autoscaler_policy_arn" {
  description = "ARN of the Cluster Autoscaler IAM policy"
  value       = aws_iam_policy.cluster_autoscaler.arn
}

output "cluster_autoscaler_service_account_name" {
  description = "Name of the Cluster Autoscaler service account"
  value       = kubernetes_service_account.cluster_autoscaler.metadata[0].name
}

output "cluster_autoscaler_deployment_name" {
  description = "Name of the Cluster Autoscaler deployment"
  value       = kubernetes_deployment.cluster_autoscaler.metadata[0].name
}

output "cluster_autoscaler_namespace" {
  description = "Namespace where Cluster Autoscaler is deployed"
  value       = kubernetes_deployment.cluster_autoscaler.metadata[0].namespace
}
