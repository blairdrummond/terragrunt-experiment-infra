resource "kubernetes_namespace" "metallb" {
  metadata {
    name = "metallb-system"
  }
}


data "docker_network" "network" {
  name = "k3d-${var.cluster_name}"

  depends_on = [k3d_cluster.cluster]
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
  - ${tolist(data.docker_network.network.ipam_config)[0].subnet}
EOF
  }
}

resource "helm_release" "metallb" {
  name       = "metallb"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "metallb"
  version    = "2.6.10"

  timeout = 600

  cleanup_on_fail = true
  force_update    = true
  namespace       = kubernetes_namespace.metallb.metadata[0].name

  depends_on = [kubernetes_namespace.metallb]

  set {
    name  = "existingConfigMap"
    value = "config"
  }
}
