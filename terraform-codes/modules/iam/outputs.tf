# EKS cluster and node role outputs have been moved to the EKS module

output "efs_csi_driver_role_arn" {
  description = "ARN of the IAM role for EFS CSI driver"
  value       = aws_iam_role.efs_csi_driver.arn
}

output "efs_csi_driver_role_name" {
  description = "Name of the IAM role for EFS CSI driver"
  value       = aws_iam_role.efs_csi_driver.name
}

output "efs_csi_driver_policy_arn" {
  description = "ARN of the IAM policy for EFS CSI driver"
  value       = aws_iam_policy.efs_csi_driver.arn
}
