# Create a new domain
resource "digitalocean_domain" "happylittlecloud" {
  name = "happylittlecloud.xyz"
}

data "digitalocean_loadbalancer" "happylittlecloud" {
  name = var.cluster_name
}

resource "digitalocean_record" "www" {

  for_each = {
    "root" = "@"
    "www" = "www"
    "wildcard" = "*"
  }

  domain = digitalocean_domain.happylittlecloud.name
  type   = "A"
  name   = each.value
  value  = data.digitalocean_loadbalancer.happylittlecloud.ip
}
