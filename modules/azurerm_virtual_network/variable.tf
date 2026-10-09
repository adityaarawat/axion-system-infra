# Keep map keys stable: Terraform uses them as resource instance addresses.
variable "vnets" {
  description = "Virtual networks to create, keyed by a stable local identifier."
  type = map(object({
    name                = string
    resource_group_name = string
    address_space       = list(string)
    location            = string
  }))
}
