terraform {
  required_providers {
    k3d = {
      source = "pvotal-tech/k3d"
      version = "0.0.5"
    }

    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.4.1"
    }

    helm = {
      source = "hashicorp/helm"
      version = "2.3.0"
    }

    http = {
      source = "hashicorp/http"
      version = "2.1.0"
    }

    tls = {
      source = "hashicorp/tls"
      version = "3.1.0"
    }

    random = {
      source = "hashicorp/random"
      version = "3.1.0"
    }
  }
}

provider "k3d" {
  # Configuration options
}

#provider "kubernetes" {
#  host = k3d_cluster.cluster.credentials.host
#
#  client_certificate     = k3d_cluster.cluster.credentials.client_certificate
#  client_key             = k3d_cluster.cluster.credentials.client_key
#  cluster_ca_certificate = k3d_cluster.cluster.credentials.cluster_ca_certificate
#}
#
#
#provider "helm" {
#  kubernetes {
#    host = k3d_cluster.cluster.credentials.host
#
#    client_certificate     = k3d_cluster.cluster.credentials.client_certificate
#    client_key             = k3d_cluster.cluster.credentials.client_key
#    cluster_ca_certificate = k3d_cluster.cluster.credentials.cluster_ca_certificate
#  }
#}
