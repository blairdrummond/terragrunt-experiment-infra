# # Create a new domain
# resource "digitalocean_domain" "happylittlecloud" {
#   name       = var.domain_name
# }
#
# data "digitalocean_loadbalancer" "happylittlecloud" {
#   name = "happylittlecloud"
# }
#
# resource "digitalocean_record" "www" {
#
#   for_each = {
#     "root" = "@"
#     "www" = "www"
#     "wildcard" = "*"
#   }
#
#   domain = digitalocean_domain.happylittlecloud.name
#   type   = "A"
#   name   = each.value
#   value  = data.digitalocean_loadbalancer.happylittlecloud.ip
# }
