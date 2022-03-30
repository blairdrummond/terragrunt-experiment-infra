terraform {
  required_providers {
    kubectl = {
      source = "gavinbunney/kubectl"
      version = "1.11.3"
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

    github = {
      source = "integrations/github"
      version = "4.23.0"
    }
  }
}
