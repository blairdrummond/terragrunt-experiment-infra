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
  kubernetes_client_certificate     = dependency.cluster.outputs.client_certificate
  kubernetes_client_key             = dependency.cluster.outputs.client_key
  kubernetes_cluster_ca_certificate = dependency.cluster.outputs.cluster_ca_certificate
}

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
provider "kubernetes" {
  host = var.kubernetes_host

  client_certificate     = var.kubernetes_client_certificate
  client_key             = var.kubernetes_client_key
  cluster_ca_certificate = var.kubernetes_cluster_ca_certificate
}

provider "kubectl" {
  host = var.kubernetes_host

  client_certificate     = var.kubernetes_client_certificate
  client_key             = var.kubernetes_client_key
  cluster_ca_certificate = var.kubernetes_cluster_ca_certificate
}

provider "helm" {
  kubernetes {
    host = var.kubernetes_host

    client_certificate     = var.kubernetes_client_certificate
    client_key             = var.kubernetes_client_key
    cluster_ca_certificate = var.kubernetes_cluster_ca_certificate
  }
}

provider "github" {
  token = var.github_deploy_token
}
EOF
}

