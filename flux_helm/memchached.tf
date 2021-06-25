resource "kubernetes_service" "memcached-svc" {
  metadata {
    name      = "memcached"
    namespace = var.namespace
  }
  spec {
    selector = {
      name = "memcached"
    }
    port {
      port = 11211
      name = "memcached"
    }
    cluster_ip = "None"
  }
}
resource "kubernetes_deployment" "memcached-dep" {
  metadata {
    name      = "memcached"
    namespace = var.namespace
    labels = {
      name = "memcached"
    }
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        name = "memcached"
      }
    }
    template {
      metadata {
        labels = {
          name = "memcached"
        }
      }
      spec {
        container {
          name              = "memcached"
          image             = var.memcache_image
          image_pull_policy = "IfNotPresent"
          port {
            container_port = 11211
            name           = "clients"
          }
          args = [
            "-m 64",
            "-p 11211"
          ]
        }
      }
    }
  }
}