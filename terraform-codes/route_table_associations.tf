# Public Subnet Route Table Associations
resource "aws_route_table_association" "public1" {
  subnet_id      = aws_subnet.public[0].id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public2" {
  subnet_id      = aws_subnet.public[1].id
  route_table_id = aws_route_table.public.id
}

# Private Subnet Route Table Associations
resource "aws_route_table_association" "private1" {
  subnet_id      = aws_subnet.private[0].id
  route_table_id = aws_route_table.private_a.id
}

resource "aws_route_table_association" "private2" {
  subnet_id      = aws_subnet.private[1].id
  route_table_id = aws_route_table.private_b.id
}

# EKS Pods Subnet Route Table Associations
resource "aws_route_table_association" "public_pods_a" {
  subnet_id      = aws_subnet.public_eks_pods[0].id
  route_table_id = aws_route_table.public_pods_a.id
}

resource "aws_route_table_association" "public_pods_b" {
  subnet_id      = aws_subnet.public_eks_pods[1].id
  route_table_id = aws_route_table.public_pods_b.id
}

# Outputs
output "route_table_association_ids" {
  description = "Map of route table association IDs"
  value = {
    public1      = aws_route_table_association.public1.id
    public2      = aws_route_table_association.public2.id
    private1     = aws_route_table_association.private1.id
    private2     = aws_route_table_association.private2.id
    public_pods_a = aws_route_table_association.public_pods_a.id
    public_pods_b = aws_route_table_association.public_pods_b.id
  }
}
