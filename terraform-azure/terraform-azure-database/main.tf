resource "random_pet" "name" {
  length = 1
}

# Create Database Server
resource "azurerm_postgresql_flexible_server" "psqlfs" {
  name                         = var.environment == "development" ? "${var.resource_name_prefix}-psqlfs" : "${var.resource_name_prefix}-psqls"
  resource_group_name          = var.resource_group
  location                     = var.location
  version                      = "13"
  delegated_subnet_id          = var.psqlfs_subnet_id
  private_dns_zone_id          = var.psqlfs_dns_zone_id
  administrator_login          = var.psqlfs_username
  administrator_password       = var.psqlfs_password
  zone                         = "2"
  storage_mb                   = var.psqlfs_storage
  sku_name                     = var.psqlfs_sku
  backup_retention_days        = 7
  geo_redundant_backup_enabled = var.psqlfs_geo_redundant_backup

  dynamic "high_availability" {
    for_each = var.psqlfs_ha_enabled ? [1] : []
    content {
      mode                      = "SameZone"
      standby_availability_zone = "2"
    }
  }

  lifecycle {
    ignore_changes = [tags, zone, high_availability]
  }

  #checkov:skip=CKV2_AZURE_57:Ensure PostgreSQL Flexible Server is configured with private endpoint
  #checkov:skip=CKV_AZURE_136:Geo-redundant backup is configurable depending on environment
}

# Allow PostgreSQL extensions
resource "azurerm_postgresql_flexible_server_configuration" "psqlfs_config" {
  name      = "azure.extensions"
  server_id = azurerm_postgresql_flexible_server.psqlfs.id
  value     = var.environment == "production" ? "CITEXT,FUZZYSTRMATCH,PGCRYPTO,PLPGSQL,UUID-OSSP" : "CITEXT,FUZZYSTRMATCH,PGCRYPTO,UUID-OSSP"
}

# Create Database
resource "azurerm_postgresql_flexible_server_database" "psqldb" {
  name      = "${var.resource_name_prefix}-${random_pet.name.id}-psqldb"
  server_id = azurerm_postgresql_flexible_server.psqlfs.id
  collation = "en_US.utf8"
  charset   = "utf8"
}

resource "azurerm_postgresql_flexible_server_database" "psqldb_slot" {
  # Secondary database only deployed for Green Web App slot on Production subscription
  count = var.environment == "production" ? 1 : 0

  name      = "${var.resource_name_prefix}-${random_pet.name.id}-psqldb-slot"
  server_id = azurerm_postgresql_flexible_server.psqlfs.id
  collation = "en_US.utf8"
  charset   = "utf8"
}
