resource "aws_vpc" "tfer--vpc-004e1194bb2f6b0c0" {
  assign_generated_ipv6_cidr_block     = "false"
  cidr_block                           = "10.0.0.0/16"
  enable_dns_hostnames                 = "true"
  enable_dns_support                   = "true"
  enable_network_address_usage_metrics = "false"
  instance_tenancy                     = "default"
  ipv6_netmask_length                  = "0"
  region                               = "ap-northeast-2"

  tags = {
    Name = "k8s-vpc"
  }

  tags_all = {
    Name = "k8s-vpc"
  }
}
