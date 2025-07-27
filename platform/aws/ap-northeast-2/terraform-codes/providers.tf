terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.3.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
  }
}

provider "aws" {
  region = var.region
  
  default_tags {
    tags = {
      Environment = var.environment
      Terraform   = "true"
      Project     = "eks-cluster"
    }
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}
