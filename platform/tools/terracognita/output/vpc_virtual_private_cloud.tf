resource "aws_subnet" "k8s_subnet_private1_ap_northeast_2a" {
  tags = {
    Name = "k8s-subnet-private1-ap-northeast-2a"
  }

  tags_all = {
    Name = "k8s-subnet-private1-ap-northeast-2a"
  }

  availability_zone_id                = "apne2-az1"
  cidr_block                          = "10.0.128.0/20"
  private_dns_hostname_type_on_launch = "ip-name"
  vpc_id                              = aws_vpc.k8s_vpc.id
}

resource "aws_subnet" "k8s_subnet_private2_ap_northeast_2b" {
  tags = {
    Name = "k8s-subnet-private2-ap-northeast-2b"
  }

  tags_all = {
    Name = "k8s-subnet-private2-ap-northeast-2b"
  }

  availability_zone                   = "ap-northeast-2b"
  cidr_block                          = "10.0.144.0/20"
  private_dns_hostname_type_on_launch = "ip-name"
  vpc_id                              = aws_vpc.k8s_vpc.id
}

resource "aws_subnet" "k8s_subnet_public1_ap_northeast_2a" {
  tags = {
    Name                                     = "k8s-subnet-public1-ap-northeast-2a"
    "kubernetes.io-cluster-test-eks-cluster" = "shared"
  }

  tags_all = {
    Name                                     = "k8s-subnet-public1-ap-northeast-2a"
    "kubernetes.io-cluster-test-eks-cluster" = "shared"
  }

  availability_zone                   = "ap-northeast-2a"
  cidr_block                          = "10.0.0.0/20"
  private_dns_hostname_type_on_launch = "ip-name"
  vpc_id                              = aws_vpc.k8s_vpc.id
}

resource "aws_subnet" "k8s_subnet_public2_ap_northeast_2b" {
  tags = {
    Name                                     = "k8s-subnet-public2-ap-northeast-2b"
    "kubernetes.io-cluster-test-eks-cluster" = "shared"
  }

  tags_all = {
    Name                                     = "k8s-subnet-public2-ap-northeast-2b"
    "kubernetes.io-cluster-test-eks-cluster" = "shared"
  }

  availability_zone                   = "ap-northeast-2b"
  cidr_block                          = "10.0.16.0/20"
  private_dns_hostname_type_on_launch = "ip-name"
  vpc_id                              = aws_vpc.k8s_vpc.id
}

resource "aws_vpc" "k8s_vpc" {
  tags = {
    Name = "k8s-vpc"
  }

  tags_all = {
    Name = "k8s-vpc"
  }

  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  instance_tenancy     = "default"
}

