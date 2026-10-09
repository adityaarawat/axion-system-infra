# Machine definitions are keyed by stable identifiers used by the NIC, VM and data lookups.
variable "vms" {
  description = "Linux virtual machines and their network and image settings, keyed by a stable local identifier."
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
