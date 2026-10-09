# Rules are keyed maps so callers can update individual rules without changing list indexes.
variable "nsgs" {
  description = "Network security groups and their rules, keyed by a stable local identifier."
  type = map(object({
    nsg_name            = string
    location            = string
    resource_group_name = string
    security_rules = map(object({
      name                       = string
      priority                   = number
      direction                  = string
      access                     = string
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string
    }))
  }))
}
