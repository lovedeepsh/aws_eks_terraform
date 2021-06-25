resource "kubernetes_namespace" "flux-ns" {
  metadata {
    annotations = {
      name = var.namespace
    }
    labels = {
      name = var.namespace
    }
    name = var.namespace
  }
}