resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = merge(
    local.common_tags,
    {
      Name = "${var.environment}-vpc"
    }
  )
}

# Internet Gateway
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    local.common_tags,
    {
      Name = "${var.environment}-igw"
    }
  )
}

# Subnets
resource "aws_subnet" "public" {
  count  = length(var.public_subnet_cidrs)
  vpc_id = aws_vpc.main.id

  cidr_block        = var.public_subnet_cidrs[count.index]
  availability_zone = "${var.region}${element(["a", "b", "c"], count.index)}"

  map_public_ip_on_launch = true

  tags = merge(
    local.common_tags,
    {
      Name = "${var.environment}-public-${element(["a", "b", "c"], count.index)}"
    }
  )
}

resource "aws_subnet" "private" {
  count  = length(var.private_subnet_cidrs)
  vpc_id = aws_vpc.main.id

  cidr_block        = var.private_subnet_cidrs[count.index]
  availability_zone = "${var.region}${element(["a", "b", "c"], count.index)}"

  tags = merge(
    local.common_tags,
    {
      Name = "${var.environment}-private-${element(["a", "b", "c"], count.index)}"
    }
  )
}
