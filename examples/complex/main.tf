locals {
  node_pools = {
    "k8s-apps-node-pool" = {
      size = "s-1vcpu-2gb"
      tags = ["apps"]

      auto_scale = true
      min_nodes  = 1
      max_nodes  = 2
      labels = {
        service  = "apps"
        priority = "high"
      }
      taints = [
        {
          key    = "workloadKind",
          value  = "database",
          effect = "NoSchedule"
        }
      ]
    },
    "k8s-utils-node-pool" = {
      size = "s-1vcpu-2gb"
      tags = ["utils"]

      auto_scale = true
      min_nodes  = 1
      max_nodes  = 2
      labels = {
        service  = "utils"
        priority = "low"
      }
    }
  }
}

module "example" {
  source = "github.com/opsd-io/terraform-module-digitalocean-kubernetes"
  name   = "my-cluster"
  region = "ams3"
  ha     = true

  maintenance_policy = {
    start_time = "02:00"
    day        = "monday"
  }

  cluster_tags = ["k8s-version:1-29-1"]
  common_tags  = ["ams3", "Owner:me"]

  default_node_pool_node_count = 1
  default_node_pool_tags       = ["default"]
  default_node_pool_labels = {
    service  = "default"
    priority = "high"
  }

  node_pools = local.node_pools
}
