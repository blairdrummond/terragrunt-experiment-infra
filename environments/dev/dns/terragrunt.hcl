include "root" {
  path = find_in_parent_folders()
}

dependency "cluster" {
  config_path  = "../cluster"
}

dependency "platform" {
  config_path  = "../platform"
  skip_outputs = true
}

terraform {
  source = "../../../modules/dns/none"
}

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
EOF
}
