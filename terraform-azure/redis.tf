resource "azapi_resource" "redis" {
  type      = "Microsoft.Cache/redisEnterprise@2025-04-01"
  name      = "${var.resource_name_prefix}-redis"
  location  = var.azure_region
  parent_id = azurerm_resource_group.rg.id
  tags      = local.common_tags

  body = {
    properties = {
      highAvailability  = "Disabled"
      minimumTlsVersion = "1.2"
      publicNetworkAccess = "Disabled"
    }
    sku = {
      name = "Balanced_B0"
    }
  }

  schema_validation_enabled = false
}

resource "azapi_resource" "redis_default_database" {
  type      = "Microsoft.Cache/redisEnterprise/databases@2025-04-01"
  name      = "default"
  parent_id = azapi_resource.redis.id

  body = {
    properties = {
      accessKeysAuthentication = "Enabled"
      clientProtocol           = "Encrypted"
      clusteringPolicy         = "EnterpriseCluster"
      evictionPolicy           = "AllKeysLRU"
    }
  }

  schema_validation_enabled = false
}
