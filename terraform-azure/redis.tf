resource "azapi_resource" "redis" {
  type      = "Microsoft.Cache/redisEnterprise@2025-07-01"
  name      = "${var.resource_name_prefix}-redis"
  location  = var.azure_region
  parent_id = azurerm_resource_group.rg.id
  tags      = local.common_tags

  body = {
    properties = {
      highAvailability    = "Disabled"
      minimumTlsVersion   = "1.2"
      publicNetworkAccess = "Disabled"
    }
    sku = {
      name = "Enterprise_E1"
    }
  }

  schema_validation_enabled = false
}

resource "azapi_resource" "redis_default_database" {
  type      = "Microsoft.Cache/redisEnterprise/databases@2025-07-01"
  name      = "default"
  parent_id = azapi_resource.redis.id

  body = {
    properties = {
      accessKeysAuthentication = var.redis_access_keys_authentication_enabled ? "Enabled" : "Disabled"
      clientProtocol           = "Encrypted"
      clusteringPolicy         = "OSSCluster"
      evictionPolicy           = "AllKeysLRU"
      port                     = 10000
    }
  }

  schema_validation_enabled = false
}

data "azurerm_redis_enterprise_database" "redis_default" {
  name       = "default"
  cluster_id = azapi_resource.redis.id

  depends_on = [azapi_resource.redis_default_database]
}

resource "azurerm_private_endpoint" "redis" {
  name                = "${var.resource_name_prefix}-redis-pe"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.azure_region
  subnet_id           = module.network.redis_private_endpoint_subnet_id
  tags                = local.common_tags

  private_service_connection {
    name                           = "${var.resource_name_prefix}-redis-psc"
    private_connection_resource_id = azapi_resource.redis.id
    is_manual_connection           = false
    subresource_names              = ["redisEnterprise"]
  }

  private_dns_zone_group {
    name                 = "default"
    private_dns_zone_ids = [module.network.redis_private_dns_zone_id]
  }

  lifecycle {
    ignore_changes = [tags]
  }
}
