# EFS CSI Driver Service Account
resource "kubernetes_service_account" "efs_csi_driver" {
  metadata {
    name      = "efs-csi-controller-sa"
    namespace = "kube-system"
    annotations = {
      "eks.amazonaws.com/role-arn" = aws_iam_role.efs_csi_driver.arn
    }
  }
  
  automount_service_account_token = true
  
  # Ensure the service account is not deleted before the IAM role
  depends_on = [aws_iam_role.efs_csi_driver]
}

# EFS CSI Driver ClusterRole
resource "kubernetes_cluster_role" "efs_csi_driver" {
  metadata {
    name = "efs-csi-external-provisioner-role"
  }

  rule {
    api_groups = [""]
    resources  = ["persistentvolumes"]
    verbs      = ["get", "list", "watch", "create", "delete"]
  }
  
  rule {
    api_groups = [""]
    resources  = ["persistentvolumeclaims"]
    verbs      = ["get", "list", "watch", "update"]
  }
  
  rule {
    api_groups = ["storage.k8s.io"]
    resources  = ["storageclasses"]
    verbs      = ["get", "list", "watch"]
  }
  
  rule {
    api_groups = [""]
    resources  = ["events"]
    verbs      = ["list", "watch", "create", "update", "patch"]
  }
  
  rule {
    api_groups = ["storage.k8s.io"]
    resources  = ["csinodes"]
    verbs      = ["get", "list", "watch"]
  }
  
  rule {
    api_groups = [""]
    resources  = ["nodes"]
    verbs      = ["get", "list", "watch"]
  }
}

# EFS CSI Driver ClusterRoleBinding
resource "kubernetes_cluster_role_binding" "efs_csi_driver" {
  metadata {
    name = "efs-csi-provisioner-binding"
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = kubernetes_cluster_role.efs_csi_driver.metadata[0].name
  }
  
  subject {
    kind      = "ServiceAccount"
    name      = kubernetes_service_account.efs_csi_driver.metadata[0].name
    namespace = kubernetes_service_account.efs_csi_driver.metadata[0].namespace
  }
}

# EFS CSI Driver Node Service Account
resource "kubernetes_service_account" "efs_csi_node_driver" {
  metadata {
    name      = "efs-csi-node-sa"
    namespace = "kube-system"
  }
}

# EFS CSI Driver Node ClusterRole
resource "kubernetes_cluster_role" "efs_csi_node_driver" {
  metadata {
    name = "efs-csi-node-role"
  }

  rule {
    api_groups = [""]
    resources  = ["nodes"]
    verbs      = ["get", "list", "update"]
  }
  
  rule {
    api_groups = [""]
    resources  = ["pods"]
    verbs      = ["get", "list", "watch"]
  }
  
  rule {
    api_groups = [""]
    resources  = ["secrets"]
    verbs      = ["get", "list"]
  }
}

# EFS CSI Driver Node ClusterRoleBinding
resource "kubernetes_cluster_role_binding" "efs_csi_node_driver" {
  metadata {
    name = "efs-csi-node-rolebinding"
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = kubernetes_cluster_role.efs_csi_node_driver.metadata[0].name
  }
  
  subject {
    kind      = "ServiceAccount"
    name      = kubernetes_service_account.efs_csi_node_driver.metadata[0].name
    namespace = kubernetes_service_account.efs_csi_node_driver.metadata[0].namespace
  }
}
