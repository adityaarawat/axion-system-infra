# Expose NSG IDs for downstream network interface associations.
output "network_security_group_ids" {
  description = "Network security group IDs keyed by the input map keys."
  value       = { for key, network_security_group in azurerm_network_security_group.nsgs : key => network_security_group.id }
}
