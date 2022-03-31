locals {
  domain_name = "happylittlecloud.xyz"
}

resource "kubernetes_ingress" "liatrio" {
  wait_for_load_balancer = true
  metadata {
    name = "liatrio"
    namespace = "web-system"
    annotations = {
      "kubernetes.io/ingress.class" = "nginx"
    }
  }
  spec {
    rule {
      host = join(".", ["hello-world", local.domain_name])
      http {
        path {
          path = "/"
          backend {
            service_name = "liatrio-demo"
            service_port = 80
          }
        }
      }
    }
  }
}
