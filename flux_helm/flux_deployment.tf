resource "kubernetes_deployment" "flux-dep" {
  metadata {
    name      = "flux"
    namespace = var.namespace
    labels = {
      name = "flux"
    }
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        name = "flux"
      }
    }
    strategy {
      type = "Recreate"
    }
    template {
      metadata {
        labels = {
          name = "flux"
        }
        annotations = {
          "prometheus.io.port" = "3031"
        }
      }
      spec {
        service_account_name            = "flux"
        automount_service_account_token = true
        container {
          name              = "flux"
          image             = var.image
          image_pull_policy = "IfNotPresent"
          resources {
            requests = {
              cpu    = "200m"
              memory = "256Mi"
            }
          }
          port {
            container_port = 3030
          }
          volume_mount {
            name       = "git-key"
            mount_path = "/etc/fluxd/ssh"
            read_only  = true
          }
          volume_mount {
            name       = "git-keygen"
            mount_path = "/var/fluxd/keygen"
          }
          volume_mount {
            name = "ssh-config"
            mount_path = "~/.ssh"
          }
          args = [
            "--git-url=git@github.com:tarungoel1995/fluxcd-demo.git",
            "--git-branch=main",
            "--git-path=workloads",
            "--git-label=flux",
            "--git-email=tarun.goel1995@gmail.com",
            "--listen-metrics=:3031",
            "--git-poll-interval=2m",
            "--sync-interval=2m",
            "--git-ci-skip=true",
            "--sync-garbage-collection=true"
          ]
        }
        volume {
          name = "git-key"
          secret {
            secret_name  = "flux-git-deploy"
            default_mode = "0400"
          }
        }
        volume {
          name = "git-keygen"
          empty_dir {
            medium = "Memory"
          }
        }
        volume {
          name = "ssh-config"
          config_map {
            name = "flux-ssh-config"
          }
        }
      }
    }
  }
  depends_on = [kubernetes_service_account.flux-sa]
}