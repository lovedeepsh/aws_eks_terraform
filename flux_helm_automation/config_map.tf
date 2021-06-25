resource "kubernetes_config_map" "flux-ssh-config" {
  metadata {
    name      = "flux-ssh-config"
    namespace = var.namespace
  }
  data = {
    known_hosts = local.github_known_hosts
  }
}