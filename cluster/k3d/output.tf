output "kubernetes_host" {
  value = k3d_cluster.cluster.credentials[0].host
  description = "Kubernetes API endpoint"
  sensitive   = true
}

output "kubernetes_client_certificate" {
  value = k3d_cluster.cluster.credentials[0].client_certificate
  sensitive   = true
}

output "kubernetes_client_key" {
  value = k3d_cluster.cluster.credentials[0].client_key
  sensitive   = true
}

output "kubernetes_cluster_ca_certificate" {
  value = k3d_cluster.cluster.credentials[0].cluster_ca_certificate
  sensitive   = true
}
