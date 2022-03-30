resource "k3d_cluster" "cluster" {
  name    = var.cluster_name
  servers = 1
  agents  = 0

  image = "rancher/k3s:v1.21.5-k3s2"

  k3d {
    disable_load_balancer = true
  }

  kubeconfig {
    update_default_kubeconfig = true
    #switch_current_context    = true
  }
}
