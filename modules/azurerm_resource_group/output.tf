# Expose resource IDs so the root module can publish stable infrastructure outputs.
output "resource_group_ids" {
  description = "Resource group IDs keyed by the input map keys."
  value       = { for key, resource_group in azurerm_resource_group.rgs : key => resource_group.id }
}
