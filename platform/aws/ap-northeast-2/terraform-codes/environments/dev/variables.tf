variable "region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "ap-northeast-2"
}

variable "create_eks" {
  description = "Controls if EKS resources should be created"
  type        = bool
  default     = true
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "dev-eks-cluster"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "eks-platform"
}

variable "project_namespaces" {
  description = "List of project namespaces to support in dev environment"
  type        = list(string)
  default     = ["bubblepool", "guestbook", "demo"]
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "List of public subnet CIDR blocks"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "List of private subnet CIDR blocks"
  type        = list(string)
  default     = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}

variable "availability_zones" {
  description = "List of availability zones for the EKS cluster"
  type        = list(string)
  default     = ["ap-northeast-2a", "ap-northeast-2b", "ap-northeast-2c"]
}

variable "kubernetes_version" {
  description = "Kubernetes version"
  type        = string
  default     = "1.33"
}

variable "instance_types" {
  description = "List of instance types for the EKS node group"
  type        = list(string)
  default     = ["t3.medium"]
}

variable "ami_type" {
  description = "Type of Amazon Machine Image (AMI) associated with the EKS Node Group"
  type        = string
  default     = "AL2023_x86_64_STANDARD"
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

variable "service_ipv4_cidr" {
  description = "The CIDR block to assign Kubernetes service IP addresses from. This should be a /16 CIDR block"
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
  description = "The AMI ID to use for the worker nodes. Required for Kubernetes 1.33 as it's not officially supported by AWS EKS."
  type        = string
  default     = ""
}

# Bastion Host Variables
variable "bastion_instance_type" {
  description = "Instance type for the bastion host"
  type        = string
  default     = "t3.micro"
}

variable "bastion_key_name" {
  description = "Key pair name for the bastion host"
  type        = string
  default     = ""
}

# Note: project_name variable is already defined above

# ALB Controller Variables
variable "alb_controller_version" {
  description = "Version of the AWS Load Balancer Controller"
  type        = string
  default     = "v2.4.2"
}

variable "alb_controller_chart_version" {
  description = "Version of the AWS Load Balancer Controller Helm chart"
  type        = string
  default     = "1.4.1"
}

# Cert-Manager Variables
variable "letsencrypt_email" {
  description = "Email address for Let's Encrypt account registration"
  type        = string
  default     = "admin@example.com"
}

variable "enable_route53_issuer" {
  description = "Whether to enable the Route53 DNS01 ClusterIssuer for cert-manager"
  type        = bool
  default     = false
}

variable "route53_hosted_zone_id" {
  description = "The Route53 hosted zone ID to use for DNS01 validation"
  type        = string
  default     = ""
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
