output "cluster_security_group_id" {
  description = "Security group ID attached to the EKS cluster"
  value       = module.eks.cluster_security_group_id
}

output "region" {
  description = "AWS region"
  value       = var.region
}

output "public_subnet_ids" {
  description = "List of public subnet IDs"
  value       = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  description = "List of private subnet IDs"
  value       = module.vpc.private_subnet_ids
}

output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "cluster_endpoint" {
  description = "Endpoint for EKS control plane"
  value       = module.eks.cluster_endpoint
}

output "cluster_name" {
  description = "Kubernetes Cluster Name"
  value       = "${var.environment}-eks-cluster"
}

output "node_group_arn" {
  description = "ARN of the EKS node group"
  value       = module.eks.node_group_arn
}

# Bastion Host Outputs
output "bastion_public_ip" {
  description = "Public IP address of the bastion host"
  value       = module.bastion.bastion_public_ip
}

output "bastion_security_group_id" {
  description = "ID of the security group attached to the bastion host"
  value       = module.bastion.bastion_security_group_id
}

# ALB Controller Outputs
output "alb_controller_iam_role_arn" {
  description = "ARN of the IAM role for the ALB Controller"
  value       = module.alb_controller.iam_role_arn
}

output "alb_controller_helm_release_status" {
  description = "Status of the ALB Controller Helm release"
  value       = module.alb_controller.helm_release_status
}

# VPC Endpoints Outputs
output "vpc_endpoint_s3_id" {
  description = "ID of the VPC S3 endpoint"
  value       = module.vpc.vpc_endpoint_s3_id
}

output "vpc_endpoint_ec2_id" {
  description = "ID of the VPC EC2 endpoint"
  value       = module.vpc.vpc_endpoint_ec2_id
}

output "vpc_endpoint_ecr_dkr_id" {
  description = "ID of the VPC ECR DKR endpoint"
  value       = module.vpc.vpc_endpoint_ecr_dkr_id
}

output "vpc_endpoint_ecr_api_id" {
  description = "ID of the VPC ECR API endpoint"
  value       = module.vpc.vpc_endpoint_ecr_api_id
}

# Cert-Manager Outputs
output "cert_manager_helm_release_status" {
  description = "Status of the cert-manager Helm release"
  value       = module.cert_manager.helm_release_status
}

output "cert_manager_helm_release_version" {
  description = "Version of the cert-manager Helm release"
  value       = module.cert_manager.helm_release_version
}

output "letsencrypt_prod_issuer_name" {
  description = "Name of the Let's Encrypt production ClusterIssuer"
  value       = module.cert_manager.letsencrypt_prod_issuer_name
}

output "letsencrypt_staging_issuer_name" {
  description = "Name of the Let's Encrypt staging ClusterIssuer"
  value       = module.cert_manager.letsencrypt_staging_issuer_name
}

output "route53_issuer_name" {
  description = "Name of the Route53 DNS01 ClusterIssuer"
  value       = module.cert_manager.route53_issuer_name
}

output "cert_manager_iam_role_arn" {
  description = "ARN of the IAM role for the cert-manager service account"
  value       = module.cert_manager.iam_role_arn
}

output "test_certificate_name" {
  description = "Name of the test certificate"
  value       = module.cert_manager.test_certificate_name
}
