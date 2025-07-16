terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.3.0"
    }
  }

  backend "s3" {
    bucket         = "test-s3-tf-state-421114334882"
    key            = "terraform.tfstate"
    region         = "ap-northeast-2"
    dynamodb_table = "test-ddb-tf-lock"
    encrypt        = true
  }
}

provider "aws" {
  region = var.aws_region
}

data "aws_availability_zones" "available" {
  exclude_names = ["ap-northeast-2a", "ap-northeast-2b"]
}