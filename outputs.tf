output "id" {
  description = "A unique ID that can be used to identify and reference a Kubernetes cluster."
  sensitive   = false
  value       = digitalocean_kubernetes_cluster.main.id
}

output "cluster_subnet" {
  description = "The range of IP addresses in the overlay network of the Kubernetes cluster."
  sensitive   = false
  value       = digitalocean_kubernetes_cluster.main.cluster_subnet
}

output "service_subnet" {
  description = "The range of assignable IP addresses for services running in the Kubernetes cluster."
  sensitive   = false
  value       = digitalocean_kubernetes_cluster.main.service_subnet
}

output "ipv4_address" {
  description = "The public IPv4 address of the Kubernetes master node."
  sensitive   = false
  value       = digitalocean_kubernetes_cluster.main.ipv4_address
}

output "endpoint" {
  description = "The base URL of the API server on the Kubernetes master node."
  sensitive   = false
  value       = digitalocean_kubernetes_cluster.main.endpoint
}

output "auto_upgrade" {
  description = "A boolean value indicating whether the cluster will be automatically upgraded to new patch releases during its maintenance window."
  sensitive   = false
  value       = digitalocean_kubernetes_cluster.main.auto_upgrade
}

output "kube_config" {
  description = "A representation of the Kubernetes cluster's kubeconfig."
  sensitive   = false
  value       = digitalocean_kubernetes_cluster.main.kube_config.0
}

output "node_pool" {
  description = "Tthe cluster's default node pool attributes."
  sensitive   = false
  value       = digitalocean_kubernetes_cluster.main.node_pool
}

output "urn" {
  description = "The uniform resource name (URN) for the Kubernetes cluster."
  sensitive   = false
  value       = digitalocean_kubernetes_cluster.main.urn
}

output "maintenance_policy" {
  description = "The cluster's maintenance window configuration."
  sensitive   = false
  value       = digitalocean_kubernetes_cluster.main.maintenance_policy
}

output "extra_node_pools_id" {
  description = "A unique ID for every non-default node pool."
  sensitive   = false
  value = {
    for k, node_pool in digitalocean_kubernetes_node_pool.main : k => node_pool.id
  }
}

output "extra_node_pools_actual_node_count" {
  description = "The actual number of nodes in non-default node pools."
  sensitive   = false
  value = {
    for k, node_pool in digitalocean_kubernetes_node_pool.main : k => node_pool.actual_node_count
  }
}

output "extra_node_pools_nodes" {
  description = "A list of nodes in non-default pools."
  sensitive   = false
  value = {
    for k, node_pool in digitalocean_kubernetes_node_pool.main : k => node_pool.nodes
  }
}

output "extra_node_pools_taint" {
  description = "A list of taints applied to all nodes in every non-default pool."
  sensitive   = false
  value = {
    for k, node_pool in digitalocean_kubernetes_node_pool.main : k => node_pool.taint
  }
}
