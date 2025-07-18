# VPC 출력값
output "vpc_id" {
  description = "생성된 VPC의 ID"
  value       = module.vpc.vpc_id
}

# EKS 클러스터 출력값
output "cluster_endpoint" {
  description = "EKS 클러스터 엔드포인트"
  value       = module.eks.cluster_endpoint
}

output "cluster_security_group_id" {
  description = "EKS 클러스터 보안 그룹 ID"
  value       = module.eks.cluster_security_group_id
}

output "node_group_arn" {
  description = "EKS 노드 그룹 ARN"
  value       = module.eks.node_group_arn
}
