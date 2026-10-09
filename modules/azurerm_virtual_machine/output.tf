# Keep outputs limited to identifiers and connection addresses; never publish credentials.
output "virtual_machine_ids" {
  description = "Virtual machine IDs keyed by the input map keys."
  value       = { for key, virtual_machine in azurerm_virtual_machine.vms : key => virtual_machine.id }
}

output "private_ip_addresses" {
  description = "Private IP addresses assigned to the virtual machine network interfaces."
  value       = { for key, network_interface in azurerm_network_interface.nics : key => network_interface.private_ip_address }
}

output "public_ip_addresses" {
  description = "Public IP addresses associated with the virtual machine network interfaces."
  value       = { for key, public_ip in data.azurerm_public_ip.pips : key => public_ip.ip_address }
}
