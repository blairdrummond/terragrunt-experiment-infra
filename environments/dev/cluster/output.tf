output "host" {
  value = module.cluster.host
  description = "Kubernetes API endpoint"
  sensitive   = true
}

output "client_certificate" {
  value = module.cluster.client_certificate
  sensitive   = true
}

output "client_key" {
  value = module.cluster.client_key
  sensitive   = true
}

output "cluster_ca_certificate" {
  value = module.cluster.cluster_ca_certificate
  sensitive   = true
}
