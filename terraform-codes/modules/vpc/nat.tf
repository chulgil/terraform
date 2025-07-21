# NAT Gateway용 EIP 생성
resource "aws_eip" "nat" {
  count  = length(var.public_subnet_cidrs)
  domain = "vpc"

  tags = merge(
    var.common_tags,
    {
      Name = "${var.environment}-nat-eip-${element(["a", "b", "c"], count.index)}"
    }
  )
}

# NAT Gateway 생성 (퍼블릭 서브넷에 배치)
resource "aws_nat_gateway" "main" {
  count         = length(var.public_subnet_cidrs)
  allocation_id = aws_eip.nat[count.index].id
  subnet_id     = aws_subnet.public[count.index].id

  tags = merge(
    var.common_tags,
    {
      Name = "${var.environment}-nat-${element(["a", "b", "c"], count.index)}"
    }
  )

  depends_on = [aws_internet_gateway.main]
}

# 프라이빗 라우팅 테이블 생성
resource "aws_route_table" "private" {
  count  = length(var.private_subnet_cidrs)
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.main[count.index % length(aws_nat_gateway.main)].id
  }

  tags = merge(
    var.common_tags,
    {
      Name = "${var.environment}-private-rt-${element(["a", "b", "c"], count.index)}"
    }
  )
}

# 프라이빗 서브넷과 라우팅 테이블 연결
resource "aws_route_table_association" "private" {
  count          = length(var.private_subnet_cidrs)
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private[count.index].id
}
