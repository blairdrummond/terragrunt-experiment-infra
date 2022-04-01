terraform {
  required_providers {
    k3d = {
      source = "pvotal-tech/k3d"
      version = "0.0.5"
    }

    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.9.0"
    }

    helm = {
      source = "hashicorp/helm"
      version = "2.3.0"
    }

    docker = {
      source  = "kreuzwerker/docker"
      version = "2.16.0"
    }
  }
}
