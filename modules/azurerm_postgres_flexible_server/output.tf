# The server FQDN is assigned by Azure and is useful to dependent applications.
output "server_fqdns" {
  description = "PostgreSQL flexible server fully qualified domain names keyed by the input map keys."
  value       = { for key, server in azurerm_postgresql_flexible_server.postgres : key => server.fqdn }
}
