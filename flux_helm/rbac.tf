resource "kubernetes_cluster_role" "flux-cr" {
  metadata {
    name = "flux"
    labels = {
      name = "flux"
    }
  }
  rule {
    api_groups = ["*"]
    resources  = ["*"]
    verbs      = ["*"]
  }
  rule {
    non_resource_urls = ["*"]
    verbs             = ["*"]
  }
}
resource "kubernetes_cluster_role_binding" "flux-crb" {
  metadata {
    name = "flux"
    labels = {
      name = "flux"
    }
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "flux"
  }
  subject {
    kind      = "ServiceAccount"
    name      = "flux"
    namespace = var.namespace
  }
}