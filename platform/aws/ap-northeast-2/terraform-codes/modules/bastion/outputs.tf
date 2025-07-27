output "bastion_security_group_id" {
  description = "The ID of the security group for the bastion host"
  value       = aws_security_group.bastion.id
}

output "bastion_instance_id" {
  description = "The ID of the bastion EC2 instance"
  value       = aws_instance.bastion.id
}

output "bastion_public_ip" {
  description = "The public IP address of the bastion host"
  value       = aws_instance.bastion.public_ip
}

output "bastion_private_ip" {
  description = "The private IP address of the bastion host"
  value       = aws_instance.bastion.private_ip
}
