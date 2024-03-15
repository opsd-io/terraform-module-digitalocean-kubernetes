# output "variable" {
#   description = "output variable description"
#   value       = variable.main.name
# }

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
