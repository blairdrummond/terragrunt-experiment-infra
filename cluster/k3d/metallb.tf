resource "kubernetes_namespace" "metallb" {
  metadata {
    name = "metallb-system"
  }
}


data "docker_network" "network" {
  name = "k3d-${var.cluster_name}"
}


locals {
  ip_blocks = split(".", tolist(data.docker_network.network.ipam_config)[0].gateway)
}


resource "kubernetes_config_map" "metallb_config" {
  metadata {
    name = "config"
    namespace = kubernetes_namespace.metallb.metadata[0].name
  }

  data = {
    config = <<EOF
address-pools:
- name: default
  protocol: layer2
  addresses:
  - ${local.ip_blocks[0]}.${local.ip_blocks[1]}.200-${local.ip_blocks[0]}.${local.ip_blocks[1]}.255.250
EOF
  }
}

resource "helm_release" "metallb" {
  name       = "metallb"
  repository = "https://metallb.github.io/metallb"
  chart      = "metallb"
  version    = "0.12.1"

  timeout = 600

  cleanup_on_fail = true
  force_update    = true
  namespace       = kubernetes_namespace.metallb.metadata[0].name

  depends_on = [kubernetes_namespace.metallb]
}
