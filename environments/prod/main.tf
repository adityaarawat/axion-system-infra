module "rg" {
  source = "../../modules/azurerm_resource_group"
  rgs    = var.rgs
}

module "snets" {
  depends_on = [module.vnets]
  source     = "../../modules/azurerm_subnet"
  snets      = var.snets
}

module "vnets" {
  depends_on = [module.rg]
  source     = "../../modules/azurerm_virtual_network"
  vnets      = var.vnets
}

module "pips" {
  depends_on = [ module.rg ]
  source = "../../modules/azurerm_public_ip"
  pips   = var.pips
}

module "vms" {
  depends_on = [module.snets, module.pips, module.nsgs]
  source     = "../../modules/azurerm_virtual_machine"
  vms        = var.vms
}

module "nsgs" {
  source = "../../modules/azurerm_network_security_group"
  nsgs   = var.nsgs
}

module "postgreSQL" {
  depends_on         = [module.rg]
  source             = "../../modules/azurerm_postgres_flexible_server"
  postgresql_servers = var.postgresql_servers
}

