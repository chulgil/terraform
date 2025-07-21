terraform {
  required_version = ">= 1.3.0"
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.41.0"  # 안정적인 5.x 버전으로 고정
    }
    
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.23.0, >= 2.23.0, < 3.0.0"
    }
    
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.11.0, >= 2.11.0, < 3.0.0"
    }
    
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "~> 1.14.0, >= 1.14.0, < 2.0.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.region
  
  default_tags {
    tags = {
      Environment = var.environment
      Terraform   = "true"
      Project     = var.project_name
    }
  }
}

# Data source for EKS cluster information (only used after cluster is created)
data "aws_eks_cluster" "cluster" {
  count = var.create_eks ? 1 : 0
  name  = var.cluster_name
}

data "aws_eks_cluster_auth" "cluster" {
  count = var.create_eks ? 1 : 0
  name  = var.cluster_name
}

# Configure the Kubernetes provider (only if cluster exists)
provider "kubernetes" {
  host                   = var.create_eks ? data.aws_eks_cluster.cluster[0].endpoint : ""
  cluster_ca_certificate = var.create_eks ? base64decode(data.aws_eks_cluster.cluster[0].certificate_authority[0].data) : ""
  token                  = var.create_eks ? data.aws_eks_cluster_auth.cluster[0].token : ""
}

# Configure the Helm provider (only if cluster exists)
provider "helm" {
  kubernetes {
    host                   = var.create_eks ? data.aws_eks_cluster.cluster[0].endpoint : ""
    cluster_ca_certificate = var.create_eks ? base64decode(data.aws_eks_cluster.cluster[0].certificate_authority[0].data) : ""
    token                  = var.create_eks ? data.aws_eks_cluster_auth.cluster[0].token : ""
  }
}

# Configure the Kubectl provider (only if cluster exists)
provider "kubectl" {
  apply_retry_count      = 5
  host                   = var.create_eks ? data.aws_eks_cluster.cluster[0].endpoint : ""
  cluster_ca_certificate = var.create_eks ? base64decode(data.aws_eks_cluster.cluster[0].certificate_authority[0].data) : ""
  token                  = var.create_eks ? data.aws_eks_cluster_auth.cluster[0].token : ""
  load_config_file       = false
}
