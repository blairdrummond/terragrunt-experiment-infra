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

    docker = {
      source  = "kreuzwerker/docker"
      version = "2.16.0"
    }
  }
}

provider "k3d" {
  # Configuration options
}

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
