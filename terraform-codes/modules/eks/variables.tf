variable "environment" {
  description = "Environment name (e.g., dev, prod)"
  type        = string
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = ""
}

variable "subnet_ids" {
  description = "List of subnet IDs for the EKS cluster"
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs for EKS node groups and cluster endpoint access"
  type        = list(string)
}

variable "kubernetes_version" {
  description = "Kubernetes version to use for the EKS cluster"
  type        = string
  default     = "1.33"
}

variable "instance_types" {
  description = "List of instance types associated with the EKS Node Group"
  type        = list(string)
  default     = ["t3.medium"]
}

variable "ami_type" {
  description = "Type of Amazon Machine Image (AMI) associated with the EKS Node Group. Defaults to AL2023"
  type        = string
  default     = "AL2023_x86_64_STANDARD"
  
  validation {
    condition     = contains(["AL2_x86_64", "AL2_x86_64_GPU", "AL2_ARM_64", "CUSTOM", "BOTTLEROCKET_x86_64", "BOTTLEROCKET_ARM_64", "BOTTLEROCKET_ARM_64_NVIDIA", "BOTTLEROCKET_x86_64_NVIDIA", "AL2023_x86_64_STANDARD", "AL2023_ARM_64_STANDARD", "AL2023_x86_64_NVIDIA_GPU"], var.ami_type)
    error_message = "Invalid AMI type. Must be one of: AL2_x86_64, AL2_x86_64_GPU, AL2_ARM_64, CUSTOM, BOTTLEROCKET_x86_64, BOTTLEROCKET_ARM_64, BOTTLEROCKET_ARM_64_NVIDIA, BOTTLEROCKET_x86_64_NVIDIA, AL2023_x86_64_STANDARD, AL2023_ARM_64_STANDARD, AL2023_x86_64_NVIDIA_GPU"
  }
}

variable "desired_size" {
  description = "Desired number of worker nodes"
  type        = number
  default     = 2
}

variable "max_size" {
  description = "Maximum number of worker nodes"
  type        = number
  default     = 3
}

variable "min_size" {
  description = "Minimum number of worker nodes"
  type        = number
  default     = 1
}

variable "node_group_name" {
  description = "Name of the EKS Node Group"
  type        = string
  default     = ""
}

variable "node_disk_size" {
  description = "Size of the disk attached to each worker node (in GB)"
  type        = number
  default     = 20
}

variable "region" {
  description = "AWS region where the EKS cluster will be created"
  type        = string
}

variable "availability_zones" {
  description = "List of availability zones for the EKS cluster"
  type        = list(string)
  default     = ["ap-northeast-2a", "ap-northeast-2b"]
}

variable "eniconfig_security_group_id" {
  description = "Security group ID to be used in ENI Config"
  type        = string
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "common_tags" {
  description = "Common tags for all resources"
  type        = map(string)
  default     = {}
}

variable "service_ipv4_cidr" {
  description = "The CIDR block to assign Kubernetes service IP addresses from. This should be a /16 CIDR block (e.g., 172.20.0.0/16)"
  type        = string
  default     = "172.20.0.0/16"
  
  validation {
    condition     = can(regex("^([0-9]{1,3}\\.){3}[0-9]{1,3}/(1[6-9]|2[0-9]|3[0-2])$", var.service_ipv4_cidr))
    error_message = "The service_ipv4_cidr must be a valid /16 to /32 CIDR block (e.g., 172.20.0.0/16)."
  }
}

variable "key_name" {
  description = "The key pair name that should be used for the EC2 instances in the EKS node group"
  type        = string
  default     = ""
}

variable "ami_id" {
  description = "Custom AMI ID to use for the EKS worker nodes. If not provided, it will try to find the latest EKS-optimized AMI."
  type        = string
  default     = ""
}

variable "capacity_type" {
  description = "Type of capacity associated with the EKS Node Group. Valid values: ON_DEMAND, SPOT"
  type        = string
  default     = "ON_DEMAND"
  
  validation {
    condition     = contains(["ON_DEMAND", "SPOT"], var.capacity_type)
    error_message = "Capacity type must be either ON_DEMAND or SPOT"
  }
}
