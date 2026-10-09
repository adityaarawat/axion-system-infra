# Server definitions are keyed by stable identifiers used in Terraform resource addresses.
variable "postgresql_servers" {
  description = "PostgreSQL flexible servers to create, keyed by a stable local identifier."
  type = map(object({
    name                   = string
    resource_group_name    = string
    location               = string
    administrator_login    = string
    administrator_password = string
    database_name          = string
    zone                   = string
  }))
}
