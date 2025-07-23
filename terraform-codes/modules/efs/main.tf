# EFS 파일 시스템 생성
resource "aws_efs_file_system" "this" {
  creation_token = var.creation_token
  encrypted     = true
  
  tags = merge(
    {
      Name = var.name
    },
    var.tags
  )
}

# EFS 보안 그룹
resource "aws_security_group" "efs" {
  name        = "${var.name}-efs-sg"
  description = "Security group for EFS"
  vpc_id      = var.vpc_id
  
  # EKS 노드에서의 NFS 접근 허용
  ingress {
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }
  
  tags = merge(
    {
      Name = "${var.name}-efs-sg"
    },
    var.tags
  )
}

# EFS 마운트 타겟
resource "aws_efs_mount_target" "this" {
  count           = length(var.private_subnet_ids)
  file_system_id  = aws_efs_file_system.this.id
  subnet_id       = var.private_subnet_ids[count.index]
  security_groups = [aws_security_group.efs.id]
}

# EFS 접근 포인트 (선택사항)
resource "aws_efs_access_point" "this" {
  file_system_id = aws_efs_file_system.this.id
  
  posix_user {
    gid = 1000
    uid = 1000
  }
  
  root_directory {
    path = "/${var.name}"
    creation_info {
      owner_gid   = 1000
      owner_uid   = 1000
      permissions = "755"
    }
  }
  
  tags = merge(
    {
      Name = "${var.name}-access-point"
    },
    var.tags
  )
}
