module "example" {
  source       = "github.com/opsd-io/terraform-module-digitalocean-kubernetes"
  cluster_name = "my-cluster"
  region       = "ams3"

  common_tags = ["ams3", "Owner:me"]

  default_node_pool_node_count = 1
  default_node_pool_tags       = ["default"]
}
