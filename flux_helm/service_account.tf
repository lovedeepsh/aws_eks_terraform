resource "kubernetes_service_account" "flux-sa" {
  metadata {
    name      = "flux"
    namespace = var.namespace
    labels = {
      name = "flux"
    }
  }
}