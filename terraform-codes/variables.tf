variable "region" {
  description = "AWS region"
  type        = string
  default     = "ap-northeast-2"
}

variable "environment" {
  description = "Environment name (e.g., dev, prod)"
  type        = string
}

# Add other common variables here that are shared across environments
