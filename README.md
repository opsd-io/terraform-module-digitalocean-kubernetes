<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/opsd-io/terraform-module-template/main/.github/img/opsd-github-repo-dark-mode.svg">
  <source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/opsd-io/terraform-module-template/main/.github/img/opsd-github-repo-light-mode.svg">
  <img alt="OPSd - the unique and effortless way of managing cloud infrastructure." src="https://raw.githubusercontent.com/opsd-io/terraform-module-template/update-tools/.github/img/opsd-github-repo-light-mode.svg" width="400">
</picture>

Meet **OPSd**. The unique and effortless way of managing cloud infrastructure.

# terraform-module-digitalocean-kubernetes

## Introduction

Terraform module to provision DigitalOcean Kubernetes service (DOKS).

## Usage

```hcl
module "k8s-cluster" {
  source  = "github.com/opsd-io/terraform-module-digitalocean-kubernetes"

  cluster_name = "my-cluster"
  region       = "ams3"

  default_node_pool_node_count = 1
  default_node_pool_tags       = ["default"]
  default_node_pool_labels = {
    service  = "default"
    priority = "high"
  }
  node_pools = local.node_pools

  cluster_tags = ["k8s-version:1-29-1"]
  common_tags  = ["ams3", "Owner:me"]
}
```

**IMPORTANT**: Make sure not to pin to master because there may be breaking changes between releases.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.7 |
| <a name="requirement_digitalocean"></a> [digitalocean](#requirement\_digitalocean) | >= 2.36.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_digitalocean"></a> [digitalocean](#provider\_digitalocean) | >= 2.36.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [digitalocean_kubernetes_cluster.main](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/kubernetes_cluster) | resource |
| [digitalocean_kubernetes_node_pool.main](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/kubernetes_node_pool) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auto_upgrade"></a> [auto\_upgrade](#input\_auto\_upgrade) | Indicates whether the cluster will be automatically upgraded to new patch releases during its maintenance window. | `bool` | `false` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The name of the cluster. | `string` | n/a | yes |
| <a name="input_cluster_tags"></a> [cluster\_tags](#input\_cluster\_tags) | A list of tag names to be applied exclusively to the Kubernetes cluster. | `list(string)` | `[]` | no |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | A list of tags to assign to every resource in this module. | `list(string)` | `[]` | no |
| <a name="input_default_node_pool_auto_scale"></a> [default\_node\_pool\_auto\_scale](#input\_default\_node\_pool\_auto\_scale) | Enable auto-scaling of the number of nodes in a default node pool. | `bool` | `false` | no |
| <a name="input_default_node_pool_labels"></a> [default\_node\_pool\_labels](#input\_default\_node\_pool\_labels) | A map of key/value pairs to apply to nodes in a default node pool. | `map(string)` | `{}` | no |
| <a name="input_default_node_pool_max_nodes"></a> [default\_node\_pool\_max\_nodes](#input\_default\_node\_pool\_max\_nodes) | Maximum number of nodes that a default node pool can be scaled up to. | `number` | `null` | no |
| <a name="input_default_node_pool_min_nodes"></a> [default\_node\_pool\_min\_nodes](#input\_default\_node\_pool\_min\_nodes) | Minimum number of nodes that a default node pool can be scaled down to. | `number` | `null` | no |
| <a name="input_default_node_pool_name"></a> [default\_node\_pool\_name](#input\_default\_node\_pool\_name) | A name for a default node pool. | `string` | `"k8s-default-node-pool"` | no |
| <a name="input_default_node_pool_node_count"></a> [default\_node\_pool\_node\_count](#input\_default\_node\_pool\_node\_count) | The number of Droplet instances in a default node pool. | `string` | `null` | no |
| <a name="input_default_node_pool_size"></a> [default\_node\_pool\_size](#input\_default\_node\_pool\_size) | The slug identifier for the type of Droplet to be used as workers in the node pool. | `string` | `"s-1vcpu-2gb"` | no |
| <a name="input_default_node_pool_tags"></a> [default\_node\_pool\_tags](#input\_default\_node\_pool\_tags) | A list of tag names applied to a default node pool. | `list(string)` | `[]` | no |
| <a name="input_default_node_pool_taints"></a> [default\_node\_pool\_taints](#input\_default\_node\_pool\_taints) | A list of taints to apply to all nodes in a default node pool. | <pre>list(object({<br>    key    = string<br>    value  = string<br>    effect = string<br>  }))</pre> | `[]` | no |
| <a name="input_ha"></a> [ha](#input\_ha) | Enable/disable the high availability control plane for a cluster. | `bool` | `false` | no |
| <a name="input_k8s_version"></a> [k8s\_version](#input\_k8s\_version) | The slug identifier for the version of Kubernetes used for the cluster. | `string` | `"1.29.1-do.0"` | no |
| <a name="input_maintenance_policy"></a> [maintenance\_policy](#input\_maintenance\_policy) | The cluster's maintenance window configuration. | <pre>object({<br>    start_time = string<br>    day        = string<br>  })</pre> | `null` | no |
| <a name="input_node_pools"></a> [node\_pools](#input\_node\_pools) | A map of the cluster node pools. | <pre>map(object({<br>    size       = optional(string, "s-1vcpu-2gb")<br>    node_count = optional(number)<br>    auto_scale = optional(bool)<br>    min_nodes  = optional(number)<br>    max_nodes  = optional(number)<br>    tags       = optional(list(string))<br>    labels     = optional(map(string))<br>    taints = optional(list(object({<br>      key    = string<br>      value  = string<br>      effect = string<br>    })), [])<br>  }))</pre> | `{}` | no |
| <a name="input_region"></a> [region](#input\_region) | The slug identifier for the region where the Kubernetes cluster will be created. | `string` | n/a | yes |
| <a name="input_registry_integration"></a> [registry\_integration](#input\_registry\_integration) | Enables or disables the DigitalOcean container registry integration for the cluster. | `bool` | `false` | no |
| <a name="input_surge_upgrade"></a> [surge\_upgrade](#input\_surge\_upgrade) | Enable/disable surge upgrades for a cluster. | `bool` | `false` | no |
| <a name="input_vpc_uuid"></a> [vpc\_uuid](#input\_vpc\_uuid) | The ID of the VPC where the Kubernetes cluster will be located. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_auto_upgrade"></a> [auto\_upgrade](#output\_auto\_upgrade) | A boolean value indicating whether the cluster will be automatically upgraded to new patch releases during its maintenance window. |
| <a name="output_cluster_subnet"></a> [cluster\_subnet](#output\_cluster\_subnet) | The range of IP addresses in the overlay network of the Kubernetes cluster. |
| <a name="output_endpoint"></a> [endpoint](#output\_endpoint) | The base URL of the API server on the Kubernetes master node. |
| <a name="output_extra_node_pools_actual_node_count"></a> [extra\_node\_pools\_actual\_node\_count](#output\_extra\_node\_pools\_actual\_node\_count) | The actual number of nodes in non-default node pools. |
| <a name="output_extra_node_pools_id"></a> [extra\_node\_pools\_id](#output\_extra\_node\_pools\_id) | A unique ID for every non-default node pool. |
| <a name="output_extra_node_pools_nodes"></a> [extra\_node\_pools\_nodes](#output\_extra\_node\_pools\_nodes) | A list of nodes in non-default pools. |
| <a name="output_extra_node_pools_taint"></a> [extra\_node\_pools\_taint](#output\_extra\_node\_pools\_taint) | A list of taints applied to all nodes in every non-default pool. |
| <a name="output_id"></a> [id](#output\_id) | A unique ID that can be used to identify and reference a Kubernetes cluster. |
| <a name="output_ipv4_address"></a> [ipv4\_address](#output\_ipv4\_address) | The public IPv4 address of the Kubernetes master node. |
| <a name="output_kube_config_cluster_ca_certificate"></a> [kube\_config\_cluster\_ca\_certificate](#output\_kube\_config\_cluster\_ca\_certificate) | The base64 encoded public certificate used by clients to access the cluster (derived from The cluster's kubeconfig). |
| <a name="output_maintenance_policy"></a> [maintenance\_policy](#output\_maintenance\_policy) | The cluster's maintenance window configuration. |
| <a name="output_node_pool"></a> [node\_pool](#output\_node\_pool) | Tthe cluster's default node pool attributes. |
| <a name="output_service_subnet"></a> [service\_subnet](#output\_service\_subnet) | The range of assignable IP addresses for services running in the Kubernetes cluster. |
| <a name="output_urn"></a> [urn](#output\_urn) | The uniform resource name (URN) for the Kubernetes cluster. |
<!-- END_TF_DOCS -->

## Examples of usage

Do you want to see how the module works? See all the [usage examples](examples).

## Related modules

The list of related modules (if present).

## Contributing

If you are interested in contributing to the project, see see our [guide](https://github.com/opsd-io/contribution).

## Support

If you have a problem with the module or want to propose a new feature, you can report it via the project's (Github) issue tracker.

If you want to discuss something in person, you can join our community on [Slack](https://join.slack.com/t/opsd-community/signup).

## License

[Apache License 2.0](LICENSE)
