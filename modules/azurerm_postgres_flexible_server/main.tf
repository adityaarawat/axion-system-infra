resource "azurerm_postgresql_flexible_server" "postgres" {
  for_each = var.postgresql_servers
  name                   = each.value.name
  resource_group_name    = each.value.resource_group_name
  location               = each.value.location
  zone                   = each.value.zone
  version                = "12"
  public_network_access_enabled = true
  administrator_login    = each.value.administrator_login
  administrator_password = each.value.administrator_password
  storage_mb             = 32768
  sku_name               = "GP_Standard_D4s_v3"
}

resource "azurerm_postgresql_flexible_server_database" "database" {
  for_each  = azurerm_postgresql_flexible_server.postgres
  name      = var.postgresql_servers[each.key].database_name
  server_id = each.value.id
  collation = "en_US.utf8"
  charset   = "UTF8"
}
