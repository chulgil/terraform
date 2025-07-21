variable "environment" {
  description = "Environment name (e.g., dev, prod)"
  type        = string
}

variable "project_name" {
  description = "Name of the project (e.g., my-project)"
  type        = string
  default     = ""
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

variable "enable_ipv6" {
  description = "Whether to enable IPv6 networking"
  type        = bool
  default     = false
}

variable "node_labels" {
  description = "Map of Kubernetes labels to apply to nodes"
  type        = map(string)
  default     = {}
}

variable "node_taints" {
  description = "List of Kubernetes taints to apply to nodes"
  type        = list(string)
  default     = []
}

variable "enable_irsa" {
  description = "Whether to create IAM roles for service accounts (IRSA) for the cluster"
  type        = bool
  default     = true
}

variable "use_max_pods" {
  description = "Whether to use the maximum number of pods per node"
  type        = bool
  default     = true
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
  
  validation {
    condition     = var.min_size >= 0
    error_message = "Min size must be 0 or greater."
  }
}

# Security Configuration
variable "key_name" {
  description = "The key pair name that should be used for the instance"
  type        = string
  default     = ""
}

variable "ami_id" {
  description = "The AMI ID to use for the worker nodes. If not provided, the latest EKS-optimized AMI will be used automatically."
  type        = string
  default     = ""
}

# Additional Configuration
variable "enable_cluster_autoscaler" {
  description = "Whether to enable cluster autoscaler add-on"
  type        = bool
  default     = true
}

variable "enable_metrics_server" {
  description = "Whether to enable metrics server add-on"
  type        = bool
  default     = true
}

variable "enable_cloudwatch_container_insights" {
  description = "Whether to enable CloudWatch Container Insights"
  type        = bool
  default     = true
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

# Launch Template Configuration
variable "node_disk_size" {
  description = "Disk size in GiB for worker nodes"
  type        = number
  default     = 20
  
  validation {
    condition     = var.node_disk_size >= 20
    error_message = "Node disk size must be at least 20 GiB."
  }
}

variable "ebs_iops" {
  description = "The amount of IOPS to provision for the disk"
  type        = number
  default     = 3000
  
  validation {
    condition     = var.ebs_iops >= 3000 && var.ebs_iops <= 16000
    error_message = "EBS IOPS must be between 3000 and 16000."
  }
}

variable "ebs_throughput" {
  description = "The throughput to provision for the disk in MiB/s"
  type        = number
  default     = 125
  
  validation {
    condition     = var.ebs_throughput >= 125 && var.ebs_throughput <= 1000
    error_message = "EBS throughput must be between 125 and 1000 MiB/s."
  }
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-west-2"
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

variable "common_tags" {
  description = "Common tags to be applied to all resources"
  type        = map(string)
  default     = {}
}

variable "vpc_id" {
  description = "ID of the VPC where the cluster and workers will be deployed"
  type        = string
}

variable "node_group_name" {
  description = "Name of the EKS node group"
  type        = string
  default     = ""
}

variable "capacity_type" {
  description = "Type of capacity associated with the EKS Node Group. Valid values: ON_DEMAND, SPOT"
  type        = string
  default     = "ON_DEMAND"
  
  validation {
    condition     = contains(["ON_DEMAND", "SPOT"], var.capacity_type)
    error_message = "Capacity type must be either ON_DEMAND or SPOT."
  }
}

# KMS Key Configuration
variable "create_kms_key" {
  description = "Whether to create a KMS key for EKS encryption"
  type        = bool
  default     = true
}

variable "kms_key_arn" {
  description = "The ARN of the KMS key to use for EKS encryption. If not provided, a new key will be created"
  type        = string
  default     = ""
}

# Logging Configuration
variable "enabled_cluster_log_types" {
  description = "A list of the desired control plane logging to enable"
  type        = list(string)
  default = [
    "api",
    "audit",
    "authenticator",
    "controllerManager",
    "scheduler"
  ]
}
