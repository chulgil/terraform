variable "environment" {
  description = "The name of the environment (e.g., dev, prod)"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC where the bastion host will be launched"
  type        = string
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs where the bastion host will be launched"
  type        = list(string)
}

variable "key_name" {
  description = "The key pair name to use for the bastion host"
  type        = string
  default     = null
}

variable "instance_type" {
  description = "The instance type for the bastion host"
  type        = string
  default     = "t3.micro"
}

variable "root_volume_size" {
  description = "The size of the root volume in GB"
  type        = number
  default     = 20
}

variable "common_tags" {
  description = "A map of common tags to apply to all resources"
  type        = map(string)
  default     = {}
}
