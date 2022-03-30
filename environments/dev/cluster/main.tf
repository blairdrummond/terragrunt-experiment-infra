module "cluster" {
  source = "../../../modules/cluster/k3d/"

  cluster_name = "liatrio-demo"
}
