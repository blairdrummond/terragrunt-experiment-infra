#provider "k3d" {
#  # Configuration options
#}

# Probably linux only. No idea how this would work on
# MacOS or Windows/WSL...
provider "docker" {
  host = "unix:///var/run/docker.sock"
}

provider "kubernetes" {
  host = k3d_cluster.cluster.credentials[0].host

  client_certificate     = k3d_cluster.cluster.credentials[0].client_certificate
  client_key             = k3d_cluster.cluster.credentials[0].client_key
  cluster_ca_certificate = k3d_cluster.cluster.credentials[0].cluster_ca_certificate
}


provider "helm" {
  kubernetes {
    host = k3d_cluster.cluster.credentials[0].host

    client_certificate     = k3d_cluster.cluster.credentials[0].client_certificate
    client_key             = k3d_cluster.cluster.credentials[0].client_key
    cluster_ca_certificate = k3d_cluster.cluster.credentials[0].cluster_ca_certificate
  }
}
