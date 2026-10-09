# Keep map keys stable: Terraform uses them as resource instance addresses.
variable "snets" {
  description = "Subnets to create, keyed by a stable local identifier."
  type = map(object({
    name                 = string
    resource_group_name  = string
    virtual_network_name = string
    address_prefixes     = list(string)
  }))
}
