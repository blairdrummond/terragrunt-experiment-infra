module "cluster" {
  source = "../../../modules/cluster/digitalocean/"

  cluster_name = "liatrio-demo"
  do_token     = var.do_token
}
