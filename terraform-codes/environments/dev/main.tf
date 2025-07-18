provider "aws" {
  region = var.region
}

locals {
  common_tags = {
    Environment = var.environment
    Terraform   = "true"
    Project     = "eks-cluster"
  }
}

# VPC Module
module "vpc" {
  source = "../../modules/vpc"

  environment = var.environment
  vpc_cidr   = var.vpc_cidr
  
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  region               = var.region
  
  common_tags = local.common_tags
}

# IAM Module
module "iam" {
  source = "../../modules/iam"

  environment = var.environment
  common_tags = local.common_tags
}

# EKS Module
module "eks" {
  source = "../../modules/eks"

  environment  = var.environment
  cluster_name = "${var.environment}-eks-cluster"
  subnet_ids   = concat(module.vpc.public_subnet_ids, module.vpc.private_subnet_ids)
  private_subnet_ids = module.vpc.private_subnet_ids
  
  kubernetes_version = var.kubernetes_version
  instance_types    = var.instance_types
  ami_type          = var.ami_type
  
  desired_size = var.desired_size
  max_size     = var.max_size
  min_size     = var.min_size
  
  tags = merge(
    local.common_tags,
    {
      Environment = var.environment
      Terraform   = "true"
    }
  )
}

# Outputs
output "vpc_id" {
  value = module.vpc.vpc_id
}

output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "cluster_name" {
  value = "${var.environment}-eks-cluster"
}

output "node_group_arn" {
  value = module.eks.node_group_arn
}
