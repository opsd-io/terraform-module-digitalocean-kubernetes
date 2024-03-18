resource "digitalocean_kubernetes_cluster" "main" {
  name                 = var.name
  region               = var.region
  version              = var.k8s_version
  vpc_uuid             = var.vpc_uuid
  auto_upgrade         = var.auto_upgrade
  surge_upgrade        = var.surge_upgrade
  ha                   = var.ha
  registry_integration = var.registry_integration

  tags = concat(["Name:${var.name}"], var.common_tags, var.cluster_tags)

  node_pool {
    name       = var.default_node_pool_name
    size       = var.default_node_pool_size
    node_count = var.default_node_pool_node_count
    auto_scale = var.default_node_pool_auto_scale
    min_nodes  = var.default_node_pool_min_nodes
    max_nodes  = var.default_node_pool_max_nodes
    tags       = concat(["Name:${var.default_node_pool_name}"], var.common_tags, var.default_node_pool_tags)
    labels     = var.default_node_pool_labels
  }

  dynamic "maintenance_policy" {
    for_each = var.maintenance_policy != null ? [var.maintenance_policy] : []

    content {
      start_time = var.maintenance_policy.start_time
      day        = var.maintenance_policy.day
    }
  }
}

resource "digitalocean_kubernetes_node_pool" "main" {
  for_each = var.node_pools

  cluster_id = digitalocean_kubernetes_cluster.main.id
  name       = each.key
  size       = each.value.size
  tags       = concat(["Name:${each.key}"], ["terraform:${each.key}"], var.common_tags, each.value.tags)

  auto_scale = each.value.auto_scale
  min_nodes  = each.value.min_nodes
  max_nodes  = each.value.max_nodes
  labels     = each.value.labels
}
