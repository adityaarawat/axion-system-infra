resource "azurerm_public_ip" "pips" {
  for_each = var.pips
  name                    = each.value.name
  location                = each.value.location
  resource_group_name     = each.value.resource_group_name
  allocation_method       = each.value.allocation_method
  # Use the caller's SKU so the declared input matches the Azure resource.
  sku                     = each.value.sku
}
