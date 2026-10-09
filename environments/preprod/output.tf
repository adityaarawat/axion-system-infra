# These outputs are the environment's operational interface. Maps retain the
# stable keys from the input objects, which keeps related values easy to match.

output "resource_group_ids" {
  description = "Azure resource group IDs keyed by the rgs input keys."
  value       = module.rg.resource_group_ids
}

output "virtual_network_ids" {
  description = "Azure virtual network IDs keyed by the vnets input keys."
  value       = module.vnets.virtual_network_ids
}

output "subnet_ids" {
  description = "Azure subnet IDs keyed by the snets input keys."
  value       = module.snets.subnet_ids
}

output "public_ip_addresses" {
  description = "Azure-assigned public IP addresses keyed by the pips input keys."
  value       = module.pips.public_ip_addresses
}

output "network_security_group_ids" {
  description = "Azure network security group IDs keyed by the nsgs input keys."
  value       = module.nsgs.network_security_group_ids
}

output "virtual_machine_ids" {
  description = "Azure virtual machine IDs keyed by the vms input keys."
  value       = module.vms.virtual_machine_ids
}

output "virtual_machine_private_ip_addresses" {
  description = "Private IP addresses assigned to virtual machine NICs, keyed by the vms input keys."
  value       = module.vms.private_ip_addresses
}

output "virtual_machine_public_ip_addresses" {
  description = "Public IP addresses associated with virtual machine NICs, keyed by the vms input keys."
  value       = module.vms.public_ip_addresses
}

output "postgresql_server_fqdns" {
  description = "PostgreSQL flexible server FQDNs keyed by the postgresql_servers input keys."
  value       = module.postgreSQL.server_fqdns
}

