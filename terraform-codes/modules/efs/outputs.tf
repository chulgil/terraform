output "efs_id" {
  description = "The ID of the EFS file system"
  value       = aws_efs_file_system.this.id
}

output "efs_arn" {
  description = "The ARN of the EFS file system"
  value       = aws_efs_file_system.this.arn
}

output "efs_dns_name" {
  description = "The DNS name for the EFS file system"
  value       = aws_efs_file_system.this.dns_name
}

output "security_group_id" {
  description = "The ID of the security group for EFS"
  value       = aws_security_group.efs.id
}

output "access_point_arn" {
  description = "The ARN of the EFS access point"
  value       = aws_efs_access_point.this.arn
}

output "access_point_id" {
  description = "The ID of the EFS access point"
  value       = aws_efs_access_point.this.id
}
