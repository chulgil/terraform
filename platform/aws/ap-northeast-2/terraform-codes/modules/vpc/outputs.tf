output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.main.id
}

output "public_subnet_ids" {
  description = "List of public subnet IDs"
  value       = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  description = "List of private subnet IDs"
  value       = aws_subnet.private[*].id
}

output "internet_gateway_id" {
  description = "ID of the Internet Gateway"
  value       = aws_internet_gateway.main.id
}

output "default_security_group_id" {
  description = "The ID of the security group created by default on VPC creation"
  value       = aws_vpc.main.default_security_group_id
}

# VPC Endpoint Outputs
output "vpc_endpoint_s3_id" {
  description = "The ID of the VPC S3 endpoint"
  value       = aws_vpc_endpoint.s3.id
}

output "vpc_endpoint_ec2_id" {
  description = "The ID of the VPC EC2 endpoint"
  value       = aws_vpc_endpoint.ec2.id
}

output "vpc_endpoint_ecr_dkr_id" {
  description = "The ID of the VPC ECR DKR endpoint"
  value       = aws_vpc_endpoint.ecr_dkr.id
}

output "vpc_endpoint_ecr_api_id" {
  description = "The ID of the VPC ECR API endpoint"
  value       = aws_vpc_endpoint.ecr_api.id
}
