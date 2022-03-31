output "host" {
  value = digitalocean_kubernetes_cluster.cluster.endpoint
  description = "Kubernetes API endpoint"
  sensitive   = true
}

output "client_certificate" {
  value = base64decode(
    digitalocean_kubernetes_cluster.cluster.kube_config[0].client_certificate
  )
  sensitive   = true
}

output "client_key" {
  value = base64decode(
    digitalocean_kubernetes_cluster.cluster.kube_config[0].client_key
  )
  sensitive   = true
}

output "cluster_ca_certificate" {
  value = base64decode(
    digitalocean_kubernetes_cluster.cluster.kube_config[0].cluster_ca_certificate
  )
  sensitive   = true
}

output "kubeconfig" {
  value = digitalocean_kubernetes_cluster.cluster.kube_config[0].token
  sensitive   = true
}
