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

# Note: Provider configurations are now handled separately after cluster creation
# This avoids dependency issues during initial terraform plan

# Kubernetes provider configuration will be handled via module outputs
# See: https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/guides/getting-started#provider-setup
