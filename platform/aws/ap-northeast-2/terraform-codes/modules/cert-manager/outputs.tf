output "helm_release_status" {
  description = "The status of the Helm release"
  value       = helm_release.cert_manager.status
}

output "helm_release_version" {
  description = "The version of the Helm release"
  value       = helm_release.cert_manager.version
}

output "letsencrypt_prod_issuer_name" {
  description = "The name of the Let's Encrypt production ClusterIssuer"
  value       = var.create_letsencrypt_issuers ? kubectl_manifest.letsencrypt_prod_issuer[0].name : ""
}

output "letsencrypt_staging_issuer_name" {
  description = "The name of the Let's Encrypt staging ClusterIssuer"
  value       = var.create_letsencrypt_issuers ? kubectl_manifest.letsencrypt_staging_issuer[0].name : ""
}

output "route53_issuer_name" {
  description = "The name of the Route53 DNS01 ClusterIssuer"
  value       = var.create_route53_issuer ? kubectl_manifest.letsencrypt_route53_issuer[0].name : ""
}

output "service_account_name" {
  description = "The name of the cert-manager service account"
  value       = var.create_route53_issuer ? kubernetes_service_account.cert_manager_route53[0].metadata[0].name : ""
}

output "service_account_namespace" {
  description = "The namespace of the cert-manager service account"
  value       = var.create_route53_issuer ? kubernetes_service_account.cert_manager_route53[0].metadata[0].namespace : ""
}

output "iam_role_arn" {
  description = "The ARN of the IAM role for the cert-manager service account"
  value       = var.create_route53_issuer ? module.cert_manager_irsa_role[0].iam_role_arn : ""
}

output "test_certificate_name" {
  description = "The name of the test certificate"
  value       = var.create_test_certificate ? kubectl_manifest.test_certificate[0].name : ""
}
