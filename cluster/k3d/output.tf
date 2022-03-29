#output "kubernetes_host" {
#  value = k3d_cluster.cluster.credentials.host
#  description = "Kubernetes API endpoint"
#}
#
#output "kubernetes_client_certificate" {
#  value = k3d_cluster.cluster.credentials.client_certificate
#  sensitive   = true
#}
#
#output "kubernetes_client_key" {
#  value = k3d_cluster.cluster.credentials.client_key
#  sensitive   = true
#}
#
#output "kubernetes_cluster_ca_certificate" {
#  value = k3d_cluster.cluster.credentials.cluster_ca_certificate
#  sensitive   = true
#}
