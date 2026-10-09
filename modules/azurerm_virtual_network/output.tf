# Expose resource IDs so callers can integrate with these networks.
output "virtual_network_ids" {
  description = "Virtual network IDs keyed by the input map keys."
  value       = { for key, virtual_network in azurerm_virtual_network.vnets : key => virtual_network.id }
}
