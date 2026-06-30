# Classic Azure Cache for Redis (Premium tier).
#
# This replaces the previous Microsoft.Cache/redisEnterprise (Azure Managed Redis)
# implementation. Redis Enterprise creation is retired, and Azure Managed Redis
# Balanced SKUs could not be provisioned in this subscription/region (West Europe) —
# both returned errors. Classic Premium uses the separate Microsoft.Cache/Redis
# resource type, is available in West Europe, and is supported by the azurerm
# provider directly (no azapi).
#
# NOTE: This is a bridge. New classic Azure Cache for Redis creation is blocked from
# 1 Oct 2026 and the tier retires 30 Sep 2028. Migrate to Azure Managed Redis once it
# is available/enabled for this subscription and region.
#
# Tier by environment: dev uses Standard C1 (1 GB) for cost; everything else uses
# Premium P1 (6 GB) for the better SLA and private-link maturity.
locals {
  redis_is_dev   = var.environment == "development"
  redis_family   = "C"
  redis_sku_name = "Standard"
}

resource "azurerm_redis_cache" "redis" {
  name                          = "${var.resource_name_prefix}-redis"
  location                      = var.azure_region
  resource_group_name           = azurerm_resource_group.rg.name
  capacity                      = 0
  family                        = local.redis_family
  sku_name                      = local.redis_sku_name
  minimum_tls_version           = "1.2"
  public_network_access_enabled = false
  tags                          = local.common_tags

  lifecycle {
    ignore_changes = [tags]
  }
}

resource "azurerm_private_endpoint" "redis" {
  name                = "${var.resource_name_prefix}-redis-pe"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.azure_region
  subnet_id           = module.network.redis_private_endpoint_subnet_id
  tags                = local.common_tags

  private_service_connection {
    name                           = "${var.resource_name_prefix}-redis-psc"
    private_connection_resource_id = azurerm_redis_cache.redis.id
    is_manual_connection           = false
    subresource_names              = ["redisCache"]
  }

  private_dns_zone_group {
    name                 = "default"
    private_dns_zone_ids = [module.network.redis_private_dns_zone_id]
  }

  lifecycle {
    ignore_changes = [tags]
  }
}
