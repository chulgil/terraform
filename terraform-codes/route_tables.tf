# Public Route Table
resource "aws_route_table" "public" {
  vpc_id = var.vpc_id
  
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.internet_gateway_id  # You'll need to define this variable
  }

  tags = {
    Name = "k8s-rtb-public"
  }
}

# Private Route Table for AZ A
resource "aws_route_table" "private_a" {
  vpc_id = var.vpc_id

  tags = {
    Name = "k8s-rtb-private1-ap-northeast-2a"
  }
}

# Private Route Table for AZ B
resource "aws_route_table" "private_b" {
  vpc_id = var.vpc_id

  tags = {
    Name = "k8s-rtb-private2-ap-northeast-2b"
  }
}

# Default Route Table (main)
resource "aws_default_route_table" "default" {
  default_route_table_id = var.default_route_table_id  # You'll need to define this variable

  tags = {
    Name = "k8s-rtb-default"
  }
}

# Public Route Table for EKS Pods in AZ A
resource "aws_route_table" "public_pods_a" {
  vpc_id = var.vpc_id
  
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.internet_gateway_id
  }

  tags = {
    Name = "k8s-rtb-public-pods-a"
    "kubernetes.io/cluster/test-eks-cluster" = "shared"
    "kubernetes.io/role/elb" = "1"
  }
}

# Public Route Table for EKS Pods in AZ B
resource "aws_route_table" "public_pods_b" {
  vpc_id = var.vpc_id
  
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.internet_gateway_id
  }

  tags = {
    Name = "k8s-rtb-public-pods-b"
    "kubernetes.io/cluster/test-eks-cluster" = "shared"
    "kubernetes.io/role/elb" = "1"
  }
}

# Route Table Associations
# Public Subnet Associations
resource "aws_route_table_association" "public" {
  count = length(aws_subnet.public)
  
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

# Private Subnet Associations
resource "aws_route_table_association" "private_a" {
  subnet_id      = aws_subnet.private[0].id
  route_table_id = aws_route_table.private_a.id
}

resource "aws_route_table_association" "private_b" {
  subnet_id      = aws_subnet.private[1].id
  route_table_id = aws_route_table.private_b.id
}

# Outputs
output "public_route_table_id" {
  description = "ID of the public route table"
  value       = aws_route_table.public.id
}

output "private_route_table_ids" {
  description = "IDs of the private route tables"
  value       = [aws_route_table.private_a.id, aws_route_table.private_b.id]
}
