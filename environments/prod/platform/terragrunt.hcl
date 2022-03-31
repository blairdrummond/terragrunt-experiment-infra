include "root" {
  path = find_in_parent_folders()
}

dependency "cluster" {
  config_path = "../cluster"
}

terraform {
  source = "../../../modules/platform/"
}

#inputs = {
#  # Github
#  github_username = var.github_username
#  github_repo     = var.github_repo
#  github_token    = var.github_token
#
#  # Docker
#  registry_server      = var.registry_server
#  registry_username    = var.registry_username
#  registry_read_token  = var.registry_read_token
#  registry_write_token = var.registry_write_token
#}

inputs = {
  kubernetes_host                   = dependency.cluster.outputs.host
  kubernetes_client_key             = dependency.cluster.outputs.client_key
  kubernetes_client_certificate     = dependency.cluster.outputs.client_certificate
  kubernetes_cluster_ca_certificate = dependency.cluster.outputs.cluster_ca_certificate
  kubernetes_kubeconfig             = dependency.cluster.outputs.kubeconfig
}

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
provider "kubernetes" {
  host = var.kubernetes_host

  cluster_ca_certificate = var.kubernetes_cluster_ca_certificate
  token                  = var.kubernetes_kubeconfig
}

provider "kubectl" {
  host = var.kubernetes_host

  cluster_ca_certificate = var.kubernetes_cluster_ca_certificate
  token                  = var.kubernetes_kubeconfig
}

provider "helm" {
  kubernetes {
    host = var.kubernetes_host

    cluster_ca_certificate = var.kubernetes_cluster_ca_certificate
    token                  = var.kubernetes_kubeconfig
  }
}

provider "github" {
  token = var.github_deploy_token
}
EOF
}

