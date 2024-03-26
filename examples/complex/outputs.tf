output "cluster_id" {
  value = module.k8s.id
}

output "cluster_subnet" {
  value = module.k8s.cluster_subnet
}

output "urn" {
  value = module.k8s.urn
}

output "kube_config" {
  value     = module.k8s.kube_config
  sensitive = true
}

output "default_node_pool_id" {
  value = module.k8s.node_pool[0].id
}

output "default_node_pool_node_count" {
  value = module.k8s.node_pool[0].actual_node_count
}

output "extra_node_pools_id" {
  value = module.k8s.extra_node_pools_id
}

output "extra_node_pools_actual_node_count" {
  value = module.k8s.extra_node_pools_actual_node_count
}

output "apps_node_pool_node_count" {
  value = module.k8s.extra_node_pools_actual_node_count["k8s-apps-node-pool"]
}

output "utils_node_pool_node_count" {
  value = module.k8s.extra_node_pools_actual_node_count["k8s-utils-node-pool"]
}
