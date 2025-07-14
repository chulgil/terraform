module "vpc" {
  source = "../../modules/vpc"
  name   = "k8s-vpc"
  cidr   = "10.0.0.0/16"
  azs    = ["ap-northeast-2a", "ap-northeast-2b"]
  public_subnets = ["10.0.0.0/20", "10.0.16.0/20"]
  enable_nat_gateway = true
  single_nat_gateway = true
  public_subnet_tags = {
    "kubernetes.io/cluster/test-eks-cluster" = "shared"
    "kubernetes.io/role/elb"                 = "1"
  }
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "18.31.2"
  
  # Basic Cluster Configuration
  cluster_name    = "test-eks-cluster"
  cluster_version = "1.24"
  
  # VPC Configuration - using the minimal required parameters
  vpc_id  = module.vpc.vpc_id
  subnets = module.vpc.public_subnets
  
  # Node Group Configuration - using the most basic setup
  node_groups_defaults = {
    ami_type  = "AL2_x86_64"
    disk_size = 20
  }
  
  node_groups = {
    example = {
      desired_capacity = 2
      max_capacity     = 3
      min_capacity     = 1
      
      instance_types = ["t3.medium"]
      capacity_type  = "ON_DEMAND"
      
      tags = {
        Environment = "test"
        Terraform   = "true"
      }
    }
  }
}


