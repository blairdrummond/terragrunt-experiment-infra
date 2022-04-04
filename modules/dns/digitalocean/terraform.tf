terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "2.16.0"
    }

    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.9.0"
    }

    kubectl = {
      source = "gavinbunney/kubectl"
      version = "1.11.3"
    }
  }
}
