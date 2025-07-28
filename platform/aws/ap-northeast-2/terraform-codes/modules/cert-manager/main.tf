# Install cert-manager using Helm
resource "helm_release" "cert_manager" {
  name             = "cert-manager"
  namespace        = "cert-manager"
  create_namespace = true
  repository       = "https://charts.jetstack.io"
  chart            = "cert-manager"
  version          = var.chart_version
  wait             = true
  wait_for_jobs    = true

  set {
    name  = "installCRDs"
    value = "true"
  }

  set {
    name  = "prometheus.enabled"
    value = var.enable_prometheus_metrics ? "true" : "false"
  }

  set {
    name  = "startupapicheck.enabled"
    value = "true"
  }

  dynamic "set" {
    for_each = var.extra_set
    content {
      name  = set.value.name
      value = set.value.value
      type  = lookup(set.value, "type", null)
    }
  }

  depends_on = [
    kubernetes_namespace.cert_manager
  ]
}

# Create cert-manager namespace (with ignore_changes to handle existing namespace)
resource "kubernetes_namespace" "cert_manager" {
  metadata {
    name = "cert-manager"
    
    labels = {
      "cert-manager.io/disable-validation" = "true"
      "app.kubernetes.io/name"            = "cert-manager"
      "app.kubernetes.io/instance"        = "cert-manager"
    }
  }
  
  # Ignore changes to handle existing namespace
  lifecycle {
    ignore_changes = [
      metadata[0].labels,
      metadata[0].annotations
    ]
  }
}

# Create ClusterIssuer for Let's Encrypt production
resource "kubectl_manifest" "letsencrypt_prod_issuer" {
  count     = var.create_letsencrypt_issuers ? 1 : 0
  yaml_body = <<YAML
apiVersion: cert-manager.io/v1
kind: ClusterIssuer
metadata:
  name: letsencrypt-prod
spec:
  acme:
    server: https://acme-v02.api.letsencrypt.org/directory
    email: ${var.letsencrypt_email}
    privateKeySecretRef:
      name: letsencrypt-prod-account-key
    solvers:
    - http01:
        ingress:
          class: ${var.ingress_class}
YAML

  depends_on = [
    helm_release.cert_manager
  ]
}

# Create ClusterIssuer for Let's Encrypt staging
resource "kubectl_manifest" "letsencrypt_staging_issuer" {
  count     = var.create_letsencrypt_issuers ? 1 : 0
  yaml_body = <<YAML
apiVersion: cert-manager.io/v1
kind: ClusterIssuer
metadata:
  name: letsencrypt-staging
spec:
  acme:
    server: https://acme-staging-v02.api.letsencrypt.org/directory
    email: ${var.letsencrypt_email}
    privateKeySecretRef:
      name: letsencrypt-staging-account-key
    solvers:
    - http01:
        ingress:
          class: ${var.ingress_class}
YAML

  depends_on = [
    helm_release.cert_manager
  ]
}

# Create AWS Route53 ClusterIssuer if enabled
resource "kubectl_manifest" "letsencrypt_route53_issuer" {
  count     = var.create_route53_issuer ? 1 : 0
  yaml_body = <<YAML
apiVersion: cert-manager.io/v1
kind: ClusterIssuer
metadata:
  name: ${var.route53_issuer_name}
spec:
  acme:
    server: ${var.letsencrypt_server}
    email: ${var.letsencrypt_email}
    privateKeySecretRef:
      name: ${var.route53_issuer_name}
    solvers:
    - dns01:
        route53:
          region: ${var.route53_region}
          hostedZoneID: ${var.route53_hosted_zone_id}
YAML

  depends_on = [
    helm_release.cert_manager,
    kubernetes_service_account.cert_manager_route53
  ]
}

# Create IAM policy for Route53 DNS01 challenge if enabled
resource "aws_iam_policy" "cert_manager_route53" {
  count       = var.create_route53_issuer ? 1 : 0
  name        = "${var.cluster_name}-cert-manager-route53"
  description = "Policy for cert-manager to manage Route53 for DNS01 challenge"
  
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "route53:GetChange"
        ]
        Resource = "arn:aws:route53:::change/*"
      },
      {
        Effect = "Allow"
        Action = [
          "route53:ChangeResourceRecordSets",
          "route53:ListResourceRecordSets"
        ]
        Resource = "arn:aws:route53:::hostedzone/${var.route53_hosted_zone_id}"
      },
      {
        Effect = "Allow"
        Action = [
          "route53:ListHostedZonesByName"
        ]
        Resource = "*"
      }
    ]
  })
}

# Create IAM role for cert-manager service account if Route53 is enabled
module "cert_manager_irsa_role" {
  count   = var.create_route53_issuer ? 1 : 0
  source  = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  version = "~> 5.0"

  role_name = "${var.cluster_name}-cert-manager-route53"
  
  role_policy_arns = {
    policy = aws_iam_policy.cert_manager_route53[0].arn
  }

  oidc_providers = {
    main = {
      provider_arn               = var.oidc_provider_arn
      namespace_service_accounts = ["cert-manager:cert-manager"]
    }
  }

  tags = var.common_tags
}

# Create cert-manager service account with IAM role annotation if Route53 is enabled
resource "kubernetes_service_account" "cert_manager_route53" {
  count = var.create_route53_issuer ? 1 : 0
  metadata {
    name      = "cert-manager"
    namespace = "cert-manager"
    annotations = {
      "eks.amazonaws.com/role-arn" = module.cert_manager_irsa_role[0].iam_role_arn
    }
  }
  
  depends_on = [
    helm_release.cert_manager
  ]
}

# Create a test certificate to verify cert-manager is working
resource "kubectl_manifest" "test_certificate" {
  count     = var.create_test_certificate ? 1 : 0
  yaml_body = <<YAML
apiVersion: cert-manager.io/v1
kind: Certificate
metadata:
  name: test-certificate
  namespace: ${var.test_certificate_namespace}
spec:
  secretName: test-certificate-tls
  issuerRef:
    name: ${var.test_certificate_issuer}
    kind: ClusterIssuer
  dnsNames:
  - ${var.test_certificate_domain}
YAML

  depends_on = [
    helm_release.cert_manager,
    kubectl_manifest.letsencrypt_staging_issuer,
    kubectl_manifest.letsencrypt_prod_issuer,
    kubectl_manifest.letsencrypt_route53_issuer
  ]
}
