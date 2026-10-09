# The address is computed by Azure after the public IP resource is created.
output "public_ip_addresses" {
  description = "Azure-assigned public IP addresses keyed by the input map keys."
  value       = { for key, public_ip in azurerm_public_ip.pips : key => public_ip.ip_address }
}
