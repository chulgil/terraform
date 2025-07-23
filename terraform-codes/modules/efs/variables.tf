variable "name" {
  description = "The name of the EFS file system"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC where EFS will be created"
  type        = string
}

variable "vpc_cidr" {
  description = "The CIDR block of the VPC"
  type        = string
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs where EFS mount targets will be created"
  type        = list(string)
}

variable "creation_token" {
  description = "A unique name used as reference when creating the EFS"
  type        = string
  default     = null
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}
