variable "environment" {
  description = "Environment name (e.g., dev, prod)"
  type        = string
}

variable "common_tags" {
  description = "Common tags for all resources"
  type        = map(string)
  default     = {}
}
