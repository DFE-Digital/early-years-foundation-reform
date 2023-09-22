output "vnet_id" {
  description = "ID of the Virtual Network"
  value       = azurerm_virtual_network.vnet.id
}

output "vnet_name" {
  description = "Name of the Virtual Network"
  value       = azurerm_virtual_network.vnet.name
}

output "psqlfs_subnet_id" {
  description = "ID of the delegated Subnet for the Database Server"
  value       = azurerm_subnet.psqlfs_snet.id
}

output "psqlfs_dns_zone_id" {
  description = "ID of the Private DNS Zone for the Database Server"
  value       = azurerm_private_dns_zone.psqlfs_dnsz.id
}

output "webapp_subnet_id" {
  description = "ID of the delegated Subnet for the Web Application"
  value       = azurerm_subnet.webapp_snet.id
}

output "app_worker_subnet_id" {
  description = "ID of the delegated Subnet for the Background Worker"
  value       = azurerm_subnet.app_worker_snet.id
}

output "agw_subnet_id" {
  description = "ID of the Subnet for the App Gateway"
  value       = var.environment != "development" ? azurerm_subnet.agw_snet[0].id : null
}

output "agw_pip_id" {
  description = "ID of the Public IP address for the App Gateway"
  value       = var.environment != "development" ? azurerm_public_ip.agw_pip[0].id : null
}

output "kv_id" {
  description = "ID of the Key Vault"
  value       = var.environment != "development" ? azurerm_key_vault.kv[0].id : null
}

output "kv_cert_secret_id" {
  description = "SSL certificate Secret ID"
  value       = var.environment != "development" ? azurerm_key_vault_certificate.kv_cert[0].secret_id : null
}

output "kv_mi_id" {
  description = "ID of the Managed Identity for the Key Vault"
  value       = var.environment != "development" ? azurerm_user_assigned_identity.kv_mi[0].id : null
}