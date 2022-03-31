# $ doctl kubernetes options versions
resource "digitalocean_kubernetes_cluster" "cluster" {
  name    = var.cluster_name
  region  = "tor1"
  version = "1.22.7-do.0"

  node_pool {
    name       = "autoscale-worker-pool"
    # doctl kubernetes options sizes
    size       = "s-2vcpu-4gb"
    auto_scale = true
    min_nodes  = 1
    max_nodes  = 3
  }
}

