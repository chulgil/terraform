variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "oidc_provider_arn" {
  description = "The ARN of the OIDC provider for the EKS cluster"
  type        = string
  default     = ""
}

variable "chart_version" {
  description = "Version of the cert-manager Helm chart"
  type        = string
  default     = "v1.13.3"
}

variable "letsencrypt_email" {
  description = "Email address to use for Let's Encrypt account registration"
  type        = string
  default     = "admin@example.com"
}

variable "ingress_class" {
  description = "The ingress class to use for HTTP01 challenge"
  type        = string
  default     = "nginx"
}

variable "create_letsencrypt_issuers" {
  description = "Whether to create Let's Encrypt ClusterIssuers (staging and production)"
  type        = bool
  default     = true
}

variable "create_route53_issuer" {
  description = "Whether to create a Route53 DNS01 ClusterIssuer"
  type        = bool
  default     = false
}

variable "route53_issuer_name" {
  description = "Name for the Route53 ClusterIssuer"
  type        = string
  default     = "letsencrypt-route53"
}

variable "route53_region" {
  description = "AWS region where the Route53 hosted zone is located"
  type        = string
  default     = "ap-northeast-2"
}

variable "route53_hosted_zone_id" {
  description = "The Route53 hosted zone ID to use for DNS01 validation"
  type        = string
  default     = ""
}

variable "letsencrypt_server" {
  description = "ACME server URL for Let's Encrypt"
  type        = string
  default     = "https://acme-v02.api.letsencrypt.org/directory"
}

variable "enable_prometheus_metrics" {
  description = "Whether to enable Prometheus metrics for cert-manager"
  type        = bool
  default     = true
}

variable "create_test_certificate" {
  description = "Whether to create a test certificate to verify cert-manager is working"
  type        = bool
  default     = false
}

variable "test_certificate_namespace" {
  description = "Namespace to create the test certificate in"
  type        = string
  default     = "default"
}

variable "test_certificate_issuer" {
  description = "Issuer to use for the test certificate"
  type        = string
  default     = "letsencrypt-staging"
}

variable "test_certificate_domain" {
  description = "Domain to include in the test certificate"
  type        = string
  default     = "example.com"
}

variable "common_tags" {
  description = "A map of common tags to apply to all resources"
  type        = map(string)
  default     = {}
}

variable "extra_set" {
  description = "A list of additional values to set in the Helm chart"
  type = list(object({
    name  = string
    value = string
    type  = string
  }))
  default = []
}
