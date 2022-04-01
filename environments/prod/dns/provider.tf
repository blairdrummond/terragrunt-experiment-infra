provider "digitalocean" {
  token = var.do_token
}

provider "kubernetes" {
  host = dependency.cluster.outputs.host

  cluster_ca_certificate = dependency.cluster.outputs.cluster_ca_certificate
  token                  = dependency.cluster.outputs.kubeconfig
}
