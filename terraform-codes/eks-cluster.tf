resource "aws_eks_cluster" "test-eks-cluster" {

  depends_on = [
    aws_iam_role_policy_attachment.test-iam-policy-eks-cluster,
    aws_iam_role_policy_attachment.test-iam-policy-eks-cluster-vpc,
  ]

  name     = var.cluster-name
  role_arn = aws_iam_role.test-iam-role-eks-cluster.arn
  version = "1.29" # 2025년 호환성을 위해 업데이트

  enabled_cluster_log_types = ["api", "audit", "authenticator", "controllerManager", "scheduler"]

  # KMS를 사용한 시크릿 암호화 구성
  # 플레이스홀더 ARN을 실제 KMS 키 ARN으로 교체해야 합니다.
  secrets_encryption_config {
    resources = ["secrets"]
    kms_key_arn = "arn:aws:kms:REGION:ACCOUNT_ID:key/YOUR_KMS_KEY_ID" # 실제 KMS 키 ARN으로 교체하세요
  }

  # EKS 클러스터를 위한 VPC 구성
  # 참조된 서브넷에 EKS 및 로드 밸런서에 필요한 태그가 있는지 확인하세요.
  vpc_config {
    security_group_ids = [aws_security_group.test-sg-eks-cluster.id]
    subnet_ids         = [aws_subnet.test-public-subnet1.id, aws_subnet.test-public-subnet3.id]
    endpoint_public_access = true # TODO 보안 강화를 위해 퍼블릭 엔드포인트 비활성화
  }


}
