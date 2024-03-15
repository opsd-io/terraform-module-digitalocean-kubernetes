terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "2.36.0"
    }
  }
}

module "k8s" {
  source = "../terraform-module-digitalocean-kubernetes"
  name   = "my-cluster"
  region = "ams3"

  common_tags  = ["ams3", "owner:me"]

  default_node_pool_node_count = 1
  default_node_pool_tags       = ["default"]
}
