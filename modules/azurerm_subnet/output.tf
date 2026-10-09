# Expose resource IDs for downstream network interface and service configuration.
output "subnet_ids" {
  description = "Subnet IDs keyed by the input map keys."
  value       = { for key, subnet in azurerm_subnet.snets : key => subnet.id }
}
