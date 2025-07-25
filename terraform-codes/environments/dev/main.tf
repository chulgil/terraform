locals {
  common_tags = {
    Environment = var.environment
    Terraform   = "true"
    Project     = "eks-cluster"
  }
  
  # Common name prefix for resources
  name_prefix = "${var.environment}-${var.project_name}"
}

# VPC Module
module "vpc" {
  source = "../../modules/vpc"

  environment = var.environment
  vpc_cidr   = var.vpc_cidr
  
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  region               = var.region
  
  common_tags = local.common_tags
}

# EKS Module
module "eks" {
  source = "../../modules/eks"

  environment  = var.environment
  cluster_name = "${var.environment}-eks-cluster"
  subnet_ids   = concat(module.vpc.public_subnet_ids, module.vpc.private_subnet_ids)
  private_subnet_ids = module.vpc.private_subnet_ids
  
  kubernetes_version = var.kubernetes_version
  instance_types    = var.instance_types
  ami_type          = var.ami_type
  
  desired_size = var.desired_size
  max_size     = var.max_size
  min_size     = var.min_size
  
  # EFS security group will be added via separate security group rule
  
  # Network configuration
  region                     = var.region
  service_ipv4_cidr          = var.service_ipv4_cidr
  vpc_id                     = module.vpc.vpc_id
  
  # AMI configuration
  ami_id                     = var.ami_id
  
  # IRSA configuration
  enable_irsa                = true
  
  # Bastion access configuration
  bastion_security_group_id  = module.bastion.bastion_security_group_id
  enable_bastion_access      = true
  
  # Tags
  common_tags = local.common_tags
  tags = merge(
    local.common_tags,
    {
      "kubernetes.io-cluster-${var.environment}-eks-cluster" = "shared"
    }
  )
}

# Bastion Host Module
module "bastion" {
  source = "../../modules/bastion"

  environment     = var.environment
  vpc_id          = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
  instance_type   = var.bastion_instance_type
  key_name        = var.bastion_key_name
  common_tags     = local.common_tags
  
  depends_on = [module.vpc]
}

# ALB Controller Module
module "alb_controller" {
  source = "../../modules/alb-controller"

  cluster_name      = module.eks.cluster_name
  oidc_provider_arn = module.eks.oidc_provider_arn
  vpc_id            = module.vpc.vpc_id
  region            = var.region
  common_tags       = local.common_tags
  
  depends_on = [
    module.eks,
    module.vpc
  ]
}

# Cert-Manager Module
module "cert_manager" {
  source = "../../modules/cert-manager"

  cluster_name = module.eks.cluster_name
  oidc_provider_arn = module.eks.oidc_provider_arn
  
  # Let's Encrypt configuration
  letsencrypt_email = var.letsencrypt_email
  ingress_class     = "alb"  # Using ALB for HTTP01 challenges
  
  # Route53 configuration (optional, set to true if using Route53 for DNS01 challenges)
  create_route53_issuer = var.enable_route53_issuer
  route53_region        = var.region
  route53_hosted_zone_id = var.route53_hosted_zone_id
  
  # Test certificate configuration
  create_test_certificate      = var.create_test_certificate
  test_certificate_namespace   = var.test_certificate_namespace
  test_certificate_issuer      = var.test_certificate_issuer
  test_certificate_domain      = var.test_certificate_domain
  
  # Common tags
  common_tags = local.common_tags
  
  depends_on = [
    module.eks,
    module.alb_controller  # ALB controller should be ready before cert-manager
  ]
}

# EFS Module
module "efs" {
  source = "../../modules/efs"

  name              = "${var.environment}-efs"
  vpc_id           = module.vpc.vpc_id
  vpc_cidr         = var.vpc_cidr
  private_subnet_ids = module.vpc.private_subnet_ids
  
  tags = merge(
    local.common_tags,
    {
      "kubernetes.io/cluster/${module.eks.cluster_name}" = "owned"
    }
  )
}

# Allow EKS nodes to access EFS
resource "aws_security_group_rule" "eks_to_efs" {
  description              = "Allow EKS nodes to access EFS"
  from_port                = 2049
  to_port                  = 2049
  protocol                = "tcp"
  security_group_id        = module.efs.security_group_id
  source_security_group_id = module.eks.node_group_security_group_id
  type                    = "ingress"
}

# EKS 노드 보안 그룹에 EFS 접근 권한 추가
resource "aws_security_group_rule" "eks_nodes_efs" {
  description              = "Allow EKS nodes to access EFS"
  from_port                = 2049
  to_port                  = 2049
  protocol                = "tcp"
  security_group_id        = module.eks.node_group_security_group_id
  source_security_group_id = module.efs.security_group_id
  type                    = "ingress"
}

# Cluster Autoscaler Module
module "cluster_autoscaler" {
  source = "../../modules/cluster-autoscaler"

  cluster_name      = module.eks.cluster_name
  oidc_provider_arn = module.eks.oidc_provider_arn
  region            = var.region
  common_tags       = local.common_tags
  
  # Cluster Autoscaler 설정
  autoscaler_image_tag = "v1.28.2"
  expander            = "least-waste"
  balance_similar_node_groups = true
  skip_nodes_with_local_storage = false
  skip_nodes_with_system_pods = false
  
  depends_on = [
    module.eks
  ]
}

# IAM 정책은 이제 iam 모듈에서 관리됩니다.
# 관련 리소스는 modules/iam/main.tf를 참조하세요.
