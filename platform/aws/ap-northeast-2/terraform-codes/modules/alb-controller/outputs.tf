output "iam_role_arn" {
  description = "The ARN of the IAM role for the ALB Controller"
  value       = module.alb_controller_irsa_role.iam_role_arn
}

output "iam_role_name" {
  description = "The name of the IAM role for the ALB Controller"
  value       = module.alb_controller_irsa_role.iam_role_name
}

output "helm_release_status" {
  description = "The status of the Helm release"
  value       = helm_release.alb_controller.status
}

output "helm_release_version" {
  description = "The version of the Helm release"
  value       = helm_release.alb_controller.version
}
