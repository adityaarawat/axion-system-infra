# Keep map keys stable: Terraform uses them as resource instance addresses.
variable "pips" {
  description = "Public IP resources to create, keyed by a stable local identifier."
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    allocation_method   = string
    sku                 = string
  }))
}
