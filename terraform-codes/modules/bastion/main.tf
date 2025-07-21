# Amazon Linux 2023 AMI 조회
data "aws_ami" "amazon_linux_2023" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# Bastion 보안 그룹
resource "aws_security_group" "bastion" {
  name_prefix = "${var.environment}-bastion-sg-"
  description = "Security group for bastion host"
  vpc_id      = var.vpc_id

  # SSH 접속 허용
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # 아웃바운드 트래픽 허용
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    var.common_tags,
    {
      Name = "${var.environment}-bastion-sg"
    }
  )
}

# IAM 역할
resource "aws_iam_role" "bastion" {
  name_prefix = "${var.environment}-bastion-role-"
  
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })

  tags = var.common_tags
}

# SSM 매니지드 인스턴스 코어 정책 연결
resource "aws_iam_role_policy_attachment" "ssm_managed_instance_core" {
  role       = aws_iam_role.bastion.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

# IAM 인스턴스 프로파일
resource "aws_iam_instance_profile" "bastion" {
  name_prefix = "${var.environment}-bastion-profile-"
  role        = aws_iam_role.bastion.name
}

# Bastion EC2 인스턴스
resource "aws_instance" "bastion" {
  ami           = data.aws_ami.amazon_linux_2023.id
  instance_type = var.instance_type
  subnet_id     = var.public_subnet_ids[0]  # 첫 번째 퍼블릭 서브넷 사용
  
  vpc_security_group_ids = [aws_security_group.bastion.id]
  iam_instance_profile   = aws_iam_instance_profile.bastion.name
  
  key_name = var.key_name
  
  root_block_device {
    volume_size = var.root_volume_size
    volume_type = "gp3"
    encrypted   = true
  }

  tags = merge(
    var.common_tags,
    {
      Name = "${var.environment}-bastion"
    }
  )
  
  lifecycle {
    ignore_changes = [ami]
  }
}
