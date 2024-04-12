variable "cluster_name" {
  description = "The name of the cluster."
  type        = string
}

variable "region" {
  description = "The slug identifier for the region where the Kubernetes cluster will be created."
  type        = string
}

variable "k8s_version" {
  description = "The slug identifier for the version of Kubernetes used for the cluster."
  type        = string
  default     = "1.29.1-do.0"
}

variable "vpc_uuid" {
  description = "The ID of the VPC where the Kubernetes cluster will be located."
  type        = string
  default     = null
}

variable "auto_upgrade" {
  description = "Indicates whether the cluster will be automatically upgraded to new patch releases during its maintenance window."
  type        = bool
  default     = false
}

variable "surge_upgrade" {
  description = "Enable/disable surge upgrades for a cluster."
  type        = bool
  default     = false
}

variable "ha" {
  description = "Enable/disable the high availability control plane for a cluster."
  type        = bool
  default     = false
}

variable "registry_integration" {
  description = "Enables or disables the DigitalOcean container registry integration for the cluster."
  type        = bool
  default     = false
}

variable "maintenance_policy" {
  description = "The cluster's maintenance window configuration."
  type = object({
    start_time = string
    day        = string
  })
  default = null
}

variable "cluster_tags" {
  description = "A list of tag names to be applied exclusively to the Kubernetes cluster."
  type        = list(string)
  default     = []
}

variable "common_tags" {
  description = "A list of tags to assign to every resource in this module."
  type        = list(string)
  default     = []
}

variable "default_node_pool_name" {
  description = "A name for a default node pool."
  type        = string
  default     = "k8s-default-node-pool"
}

variable "default_node_pool_size" {
  description = "The slug identifier for the type of Droplet to be used as workers in the node pool."
  type        = string
  default     = "s-1vcpu-2gb"
}

variable "default_node_pool_node_count" {
  description = "The number of Droplet instances in a default node pool."
  type        = string
  default     = null
}

variable "default_node_pool_auto_scale" {
  description = "Enable auto-scaling of the number of nodes in a default node pool."
  type        = bool
  default     = false
}

variable "default_node_pool_min_nodes" {
  description = "Minimum number of nodes that a default node pool can be scaled down to."
  type        = number
  default     = null
}

variable "default_node_pool_max_nodes" {
  description = "Maximum number of nodes that a default node pool can be scaled up to."
  type        = number
  default     = null
}

variable "default_node_pool_tags" {
  description = "A list of tag names applied to a default node pool."
  type        = list(string)
  default     = []
}

variable "default_node_pool_labels" {
  description = "A map of key/value pairs to apply to nodes in a default node pool."
  type        = map(string)
  default     = {}
}

variable "default_node_pool_taints" {
  description = "A list of taints to apply to all nodes in a default node pool."
  type = list(object({
    key    = string
    value  = string
    effect = string
  }))
  default = []
}

variable "node_pools" {
  description = "A map of the cluster node pools."
  type = map(object({
    size       = optional(string, "s-1vcpu-2gb")
    node_count = optional(number)
    auto_scale = optional(bool)
    min_nodes  = optional(number)
    max_nodes  = optional(number)
    tags       = optional(list(string))
    labels     = optional(map(string))
    taints = optional(list(object({
      key    = string
      value  = string
      effect = string
    })), [])
  }))
  default = {}
}
