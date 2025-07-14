module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.19.0"  # AWS Provider 4.x와 호환되는 안정 버전
  name = var.name
  cidr = var.cidr
  azs  = var.azs
  public_subnets = var.public_subnets
  enable_nat_gateway = var.enable_nat_gateway
  single_nat_gateway = var.single_nat_gateway
  public_subnet_tags = var.public_subnet_tags
}
