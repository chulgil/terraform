# Subnet Configuration
# This file defines the subnets for the VPC

# Public Subnets
resource "aws_subnet" "public" {
  count  = 2
  vpc_id = var.vpc_id

  cidr_block        = count.index == 0 ? "10.0.0.0/20" : "10.0.16.0/20"  # 원본 CIDR 블록으로 고정
  availability_zone = "ap-northeast-2${element(["a", "b"], count.index)}"

  # Common settings
  assign_ipv6_address_on_creation                = false
  enable_dns64                                   = false
  enable_resource_name_dns_a_record_on_launch    = false
  enable_resource_name_dns_aaaa_record_on_launch = false
  ipv6_native                                    = false
  map_public_ip_on_launch                        = true
  private_dns_hostname_type_on_launch            = "ip-name"

  tags = {
    Name                                     = "k8s-subnet-public${count.index + 1}-ap-northeast-2${element(["a", "b"], count.index)}"
    "kubernetes.io/cluster/test-eks-cluster" = "shared"
    "kubernetes.io/role/elb"                = "1"
  }
}

# Private Subnets
resource "aws_subnet" "private" {
  count  = 2
  vpc_id = var.vpc_id

  cidr_block        = count.index == 0 ? "10.0.128.0/20" : "10.0.144.0/20"  # 원본 CIDR 블록으로 고정
  availability_zone = "ap-northeast-2${element(["a", "b"], count.index)}"

  # Common settings
  assign_ipv6_address_on_creation                = false
  enable_dns64                                   = false
  enable_resource_name_dns_a_record_on_launch    = false
  enable_resource_name_dns_aaaa_record_on_launch = false
  ipv6_native                                    = false
  map_public_ip_on_launch                        = false
  private_dns_hostname_type_on_launch            = "ip-name"

  tags = {
    Name                                     = "k8s-subnet-private${count.index + 1}-ap-northeast-2${element(["a", "b"], count.index)}"
    "kubernetes.io/cluster/test-eks-cluster" = "shared"
    "kubernetes.io/role/internal-elb"        = "1"
  }
}

# Additional Public Subnets for EKS Pods
resource "aws_subnet" "public_eks_pods" {
  count  = 2
  vpc_id = var.vpc_id

  cidr_block        = count.index == 0 ? "100.64.0.0/19" : "100.64.32.0/19"
  availability_zone = "ap-northeast-2${element(["a", "b"], count.index)}"

  # Common settings
  assign_ipv6_address_on_creation                = false
  enable_dns64                                   = false
  enable_resource_name_dns_a_record_on_launch    = false
  enable_resource_name_dns_aaaa_record_on_launch = false
  ipv6_native                                    = false
  map_public_ip_on_launch                        = true
  private_dns_hostname_type_on_launch            = "ip-name"

  tags = {
    Name                                     = "public-subnet-eks-pods-${element(["a", "b"], count.index)}"
    "kubernetes.io/cluster/test-eks-cluster" = "shared"
    "kubernetes.io/role/elb"                 = "1"
  }
}

# Outputs
output "public_subnet_ids" {
  description = "List of all public subnet IDs including EKS pods"
  value       = concat(aws_subnet.public[*].id, aws_subnet.public_eks_pods[*].id)
}

output "private_subnet_ids" {
  description = "List of private subnet IDs"
  value       = aws_subnet.private[*].id
}

output "all_subnet_ids" {
  description = "List of all subnet IDs"
  value       = concat(aws_subnet.public[*].id, aws_subnet.private[*].id, aws_subnet.public_eks_pods[*].id)
}

output "eks_pods_subnet_ids" {
  description = "List of EKS pods subnet IDs"
  value       = aws_subnet.public_eks_pods[*].id
}
