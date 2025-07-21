# Create a public route table if it doesn't exist
resource "aws_route_table" "public" {
  count  = length(var.public_subnet_cidrs)
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = merge(
    var.common_tags,
    {
      Name = "${var.environment}-public-rt-${element(["a", "b", "c"], count.index)}"
    }
  )
}

# Associate public subnets with the public route table
resource "aws_route_table_association" "public" {
  count          = length(var.public_subnet_cidrs)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public[count.index].id
}

# S3 Gateway Endpoint
resource "aws_vpc_endpoint" "s3" {
  vpc_id            = aws_vpc.main.id
  service_name      = "com.amazonaws.${var.region}.s3"
  vpc_endpoint_type = "Gateway"
  
  # Get all route table IDs (both public and private)
  route_table_ids = concat(
    [for rt in aws_route_table.private : rt.id],
    [for rt in aws_route_table.public : rt.id]
  )

  tags = merge(
    var.common_tags,
    {
      Name = "${var.environment}-s3-endpoint"
    }
  )
}

# EC2 Interface Endpoint
resource "aws_vpc_endpoint" "ec2" {
  vpc_id              = aws_vpc.main.id
  service_name        = "com.amazonaws.${var.region}.ec2"
  vpc_endpoint_type   = "Interface"
  private_dns_enabled = true
  subnet_ids          = aws_subnet.private[*].id
  
  security_group_ids = [
    aws_security_group.vpc_endpoints.id
  ]

  tags = merge(
    var.common_tags,
    {
      Name = "${var.environment}-ec2-endpoint"
    }
  )
}

# ECR DKR API Endpoint
resource "aws_vpc_endpoint" "ecr_dkr" {
  vpc_id              = aws_vpc.main.id
  service_name        = "com.amazonaws.${var.region}.ecr.dkr"
  vpc_endpoint_type   = "Interface"
  private_dns_enabled = true
  subnet_ids          = aws_subnet.private[*].id
  
  security_group_ids = [
    aws_security_group.vpc_endpoints.id
  ]

  tags = merge(
    var.common_tags,
    {
      Name = "${var.environment}-ecr-dkr-endpoint"
    }
  )
}

# ECR API Endpoint
resource "aws_vpc_endpoint" "ecr_api" {
  vpc_id              = aws_vpc.main.id
  service_name        = "com.amazonaws.${var.region}.ecr.api"
  vpc_endpoint_type   = "Interface"
  private_dns_enabled = true
  subnet_ids          = aws_subnet.private[*].id
  
  security_group_ids = [
    aws_security_group.vpc_endpoints.id
  ]

  tags = merge(
    var.common_tags,
    {
      Name = "${var.environment}-ecr-api-endpoint"
    }
  )
}

# Security Group for VPC Endpoints
resource "aws_security_group" "vpc_endpoints" {
  name_prefix = "${var.environment}-vpc-endpoints-"
  description = "Security group for VPC endpoints"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
    description = "Allow HTTPS from VPC"
  }

  tags = merge(
    var.common_tags,
    {
      Name = "${var.environment}-vpc-endpoints-sg"
    }
  )
}
