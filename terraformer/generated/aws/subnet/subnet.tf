resource "aws_subnet" "tfer--subnet-02e231761cba2bb43" {
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "10.0.16.0/20"
  enable_dns64                                   = "false"
  enable_lni_at_device_index                     = "0"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_customer_owned_ip_on_launch                = "false"
  map_public_ip_on_launch                        = "false"
  private_dns_hostname_type_on_launch            = "ip-name"
  region                                         = "ap-northeast-2"

  tags = {
    Name                                     = "k8s-subnet-public2-ap-northeast-2b"
    "kubernetes.io/cluster/test-eks-cluster" = "shared"
  }

  tags_all = {
    Name                                     = "k8s-subnet-public2-ap-northeast-2b"
    "kubernetes.io/cluster/test-eks-cluster" = "shared"
  }

  vpc_id = "${data.terraform_remote_state.vpc.outputs.aws_vpc_tfer--vpc-004e1194bb2f6b0c0_id}"
}

resource "aws_subnet" "tfer--subnet-036812c896d9dce20" {
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "10.0.0.0/20"
  enable_dns64                                   = "false"
  enable_lni_at_device_index                     = "0"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_customer_owned_ip_on_launch                = "false"
  map_public_ip_on_launch                        = "false"
  private_dns_hostname_type_on_launch            = "ip-name"
  region                                         = "ap-northeast-2"

  tags = {
    Name                                     = "k8s-subnet-public1-ap-northeast-2a"
    "kubernetes.io/cluster/test-eks-cluster" = "shared"
  }

  tags_all = {
    Name                                     = "k8s-subnet-public1-ap-northeast-2a"
    "kubernetes.io/cluster/test-eks-cluster" = "shared"
  }

  vpc_id = "${data.terraform_remote_state.vpc.outputs.aws_vpc_tfer--vpc-004e1194bb2f6b0c0_id}"
}

resource "aws_subnet" "tfer--subnet-05b5551dca75b2503" {
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "10.0.128.0/20"
  enable_dns64                                   = "false"
  enable_lni_at_device_index                     = "0"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_customer_owned_ip_on_launch                = "false"
  map_public_ip_on_launch                        = "false"
  private_dns_hostname_type_on_launch            = "ip-name"
  region                                         = "ap-northeast-2"

  tags = {
    Name = "k8s-subnet-private1-ap-northeast-2a"
  }

  tags_all = {
    Name = "k8s-subnet-private1-ap-northeast-2a"
  }

  vpc_id = "${data.terraform_remote_state.vpc.outputs.aws_vpc_tfer--vpc-004e1194bb2f6b0c0_id}"
}

resource "aws_subnet" "tfer--subnet-089e065a270bc9d10" {
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "10.0.144.0/20"
  enable_dns64                                   = "false"
  enable_lni_at_device_index                     = "0"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_customer_owned_ip_on_launch                = "false"
  map_public_ip_on_launch                        = "false"
  private_dns_hostname_type_on_launch            = "ip-name"
  region                                         = "ap-northeast-2"

  tags = {
    Name = "k8s-subnet-private2-ap-northeast-2b"
  }

  tags_all = {
    Name = "k8s-subnet-private2-ap-northeast-2b"
  }

  vpc_id = "${data.terraform_remote_state.vpc.outputs.aws_vpc_tfer--vpc-004e1194bb2f6b0c0_id}"
}
