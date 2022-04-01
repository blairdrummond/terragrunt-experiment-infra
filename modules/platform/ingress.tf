locals {
  domain_name = "happylittlecloud.xyz"
}

resource "kubernetes_namespace" "web_system" {
  metadata {
    name = "web-system"
  }
}

