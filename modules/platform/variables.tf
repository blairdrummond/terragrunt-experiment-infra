# Set the variable value in *.tfvars file
# or using -var="do_token=..." CLI option
variable "github_username" {
  description = "Your github username"
}
variable "github_repo" {
  description = "Your github argocd manifests repo"
}
variable "github_token" {
  description = "Github Read Token"
}


variable "registry_server" {
  description = "Registry server"
}
variable "registry_username" {
  description = "Registry Username"
}
variable "registry_read_token" {
  description = "Registry read token"
}
variable "registry_write_token" {
  description = "Registry write token"
}


variable "kubernetes_host" {
  description = "Kubernetes API endpoint"
  sensitive   = true
}

variable "kubernetes_client_certificate" {
  sensitive   = true
}

variable "kubernetes_client_key" {
  sensitive   = true
}

variable "kubernetes_cluster_ca_certificate" {
  sensitive   = true
}
