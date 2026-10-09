data "azurerm_subnet" "snets" {
  for_each = var.vms
  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_public_ip" "pips" {
  for_each = var.vms
  name                = each.value.pip_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_network_security_group" "nsgs" {

  for_each = var.vms

  name                = each.value.nsg_name
  resource_group_name = each.value.resource_group_name
}