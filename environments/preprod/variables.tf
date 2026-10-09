# Environment inputs are strongly typed so misspelled keys and incompatible
# values are caught during Terraform validation, before Azure changes are made.

variable "rgs" {
  description = "Resource groups managed by this environment, keyed by a stable local identifier."
  type = map(object({
    name     = string
    location = string
  }))
}

variable "snets" {
  description = "Subnets managed by this environment, keyed by a stable local identifier."
  type = map(object({
    name                 = string
    resource_group_name  = string
    virtual_network_name = string
    address_prefixes     = list(string)
  }))
}

variable "vnets" {
  description = "Virtual networks managed by this environment, keyed by a stable local identifier."
  type = map(object({
    name                = string
    resource_group_name = string
    address_space       = list(string)
    location            = string
  }))
}

variable "pips" {
  description = "Public IP resources managed by this environment, keyed by a stable local identifier."
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    allocation_method   = string
    sku                 = string
  }))
}

variable "vms" {
  description = "Linux virtual machines managed by this environment, keyed by a stable local identifier."
  type = map(object({
    name                 = string
    location             = string
    resource_group_name  = string
    subnet_name          = string
    virtual_network_name = string
    nic_name             = string
    nsg_name             = string
    pip_name             = string
    ip_config_name       = string
    vm_size              = string
    publisher            = string
    offer                = string
    sku                  = string
    version              = string
    storage_os_name      = string
    caching              = string
    create_option        = string
    managed_disk_type    = string
    computer_name        = string
    admin_username       = string
    admin_password       = string
  }))
}

variable "nsgs" {
  description = "Network security groups and their inbound or outbound rules, keyed by a stable local identifier."
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

variable "postgresql_servers" {
  description = "PostgreSQL flexible servers managed by this environment, keyed by a stable local identifier."
  type = map(object({
    name                   = string
    resource_group_name    = string
    location               = string
    administrator_login    = string
    administrator_password = string
    database_name          = string
    zone                   = string
  }))
}

