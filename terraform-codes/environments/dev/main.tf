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
  
  # Network configuration
  region                     = var.region
  service_ipv4_cidr          = var.service_ipv4_cidr
  vpc_id                     = module.vpc.vpc_id
  
  # AMI configuration
  ami_id                     = var.ami_id
  
  # Tags
  common_tags = local.common_tags
  tags = merge(
    local.common_tags,
    {
      "kubernetes.io/cluster/${var.environment}-eks-cluster" = "shared"
    }
  )
}
