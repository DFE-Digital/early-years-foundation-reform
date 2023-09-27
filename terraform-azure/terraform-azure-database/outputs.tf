output "psqlfs_name" {
  description = "Name of the Database Server"
  value       = azurerm_postgresql_flexible_server.psqlfs.name
}

output "psqldb_name" {
  description = "Name of the Database"
  value       = azurerm_postgresql_flexible_server_database.psqldb.name
}