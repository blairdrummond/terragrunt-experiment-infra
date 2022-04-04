# Set the variable value in *.tfvars file
variable "cluster_name" {
  description = "A unique name for your cluster"
}

variable "kubernetes_host" {
  description = "Kubernetes API endpoint"
  sensitive   = true
}
variable "kubernetes_kubeconfig" {
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
