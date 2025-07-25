variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "oidc_provider_arn" {
  description = "ARN of the OIDC provider for the EKS cluster"
  type        = string
}

variable "region" {
  description = "AWS region"
  type        = string
}

variable "common_tags" {
  description = "Common tags to be applied to all resources"
  type        = map(string)
  default     = {}
}

variable "autoscaler_image_tag" {
  description = "Docker image tag for cluster autoscaler"
  type        = string
  default     = "v1.28.2"
}

variable "autoscaler_replicas" {
  description = "Number of replicas for cluster autoscaler deployment"
  type        = number
  default     = 1
}

variable "autoscaler_resources" {
  description = "Resource limits and requests for cluster autoscaler"
  type = object({
    limits = object({
      cpu    = string
      memory = string
    })
    requests = object({
      cpu    = string
      memory = string
    })
  })
  default = {
    limits = {
      cpu    = "100m"
      memory = "600Mi"
    }
    requests = {
      cpu    = "100m"
      memory = "600Mi"
    }
  }
}

variable "scale_down_delay_after_add" {
  description = "How long after scale up that scale down evaluation resumes"
  type        = string
  default     = "10m"
}

variable "scale_down_unneeded_time" {
  description = "How long a node should be unneeded before it is eligible for scale down"
  type        = string
  default     = "10m"
}

variable "skip_nodes_with_local_storage" {
  description = "Should cluster autoscaler skip nodes with local storage"
  type        = bool
  default     = false
}

variable "skip_nodes_with_system_pods" {
  description = "Should cluster autoscaler skip nodes with system pods"
  type        = bool
  default     = false
}

variable "expander" {
  description = "Type of node group expander to be used in scale up"
  type        = string
  default     = "least-waste"
  validation {
    condition = contains([
      "random",
      "most-pods",
      "least-waste",
      "price",
      "priority"
    ], var.expander)
    error_message = "Expander must be one of: random, most-pods, least-waste, price, priority."
  }
}

variable "balance_similar_node_groups" {
  description = "Should cluster autoscaler balance similar node groups"
  type        = bool
  default     = true
}
