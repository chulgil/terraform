variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "oidc_provider_arn" {
  description = "The ARN of the OIDC provider for the EKS cluster"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC where the EKS cluster is deployed"
  type        = string
}

variable "region" {
  description = "The AWS region where the cluster is deployed"
  type        = string
  default     = "ap-northeast-2"
}

variable "helm_chart_version" {
  description = "The version of the AWS Load Balancer Controller Helm chart"
  type        = string
  default     = "1.4.1"
}

variable "controller_image_tag" {
  description = "The image tag for the AWS Load Balancer Controller"
  type        = string
  default     = "v2.4.2"
}

variable "common_tags" {
  description = "A map of common tags to apply to all resources"
  type        = map(string)
  default     = {}
}
