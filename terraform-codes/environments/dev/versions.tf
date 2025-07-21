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

# Configure the Kubernetes provider
provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
  
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "aws"
    args = ["eks", "get-token", "--cluster-name", module.eks.cluster_name, "--region", var.region]
  }
}

# Configure the Helm provider
provider "helm" {
  kubernetes {
    host                   = module.eks.cluster_endpoint
    cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
    
    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      command     = "aws"
      args = ["eks", "get-token", "--cluster-name", module.eks.cluster_name, "--region", var.region]
    }
  }
}

# Configure the Kubectl provider
provider "kubectl" {
  apply_retry_count      = 5
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
  load_config_file       = false
  
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "aws"
    args = ["eks", "get-token", "--cluster-name", module.eks.cluster_name, "--region", var.region]
  }
}
