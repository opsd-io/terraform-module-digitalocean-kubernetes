terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "2.36.0"
    }
  }
}

locals {
  node_pools = {
    "k8s-apps-node-pool" = {
      size = "s-1vcpu-2gb"
      tags = ["apps", "terraform:k8s-apps-node-pool"]

      auto_scale = true
      min_nodes  = 1
      max_nodes  = 2
      labels = {
        service  = "apps"
        priority = "high"
      }
    }
  }
}

module "k8s" {
  source = "../terraform-module-digitalocean-kubernetes"
  name   = "my-cluster"
  region = "ams3"
  ha     = true

  maintenance_policy = {
    start_time = "02:00"
    day        = "monday"
  }

  cluster_tags = ["k8s-version:1-29-1"]
  common_tags  = ["ams3", "owner:me"]

  default_node_pool_node_count = 1
  default_node_pool_tags       = ["default"]
  default_node_pool_labels = {
    service  = "default"
    priority = "high"
  }

  node_pools = local.node_pools
}
