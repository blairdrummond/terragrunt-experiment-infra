output "host" {
  value = k3d_cluster.cluster.credentials[0].host
  description = "Kubernetes API endpoint"
  sensitive   = true
}

output "client_certificate" {
  value = k3d_cluster.cluster.credentials[0].client_certificate
  sensitive   = true
}

output "client_key" {
  value = k3d_cluster.cluster.credentials[0].client_key
  sensitive   = true
}

output "cluster_ca_certificate" {
  value = k3d_cluster.cluster.credentials[0].cluster_ca_certificate
  sensitive   = true
}

output "kubeconfig" {
  value = k3d_cluster.cluster.credentials[0].raw
  sensitive   = true
}
