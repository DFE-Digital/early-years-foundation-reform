# Create Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name                = "${var.resource_name_prefix}-vnet"
  location            = var.location
  resource_group_name = var.resource_group
  address_space       = ["172.1.0.0/16"]

  lifecycle {
    ignore_changes = [tags]
  }
}

# Create Subnet for Web App
resource "azurerm_subnet" "webapp_snet" {
  name                 = "${var.resource_name_prefix}-webapp-snet"
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name  = var.resource_group
  address_prefixes     = ["172.1.1.0/26"]
  service_endpoints    = ["Microsoft.Storage"]

  delegation {
    name = "${var.resource_name_prefix}-webapp-dn"

    service_delegation {
      name    = "Microsoft.Web/serverFarms"
      actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
    }
  }

  #checkov:skip=CKV2_AZURE_31:NSG not required
}

# Create Subnet for Redis Private Endpoint
resource "azurerm_subnet" "redis_pe_snet" {
  name                 = "${var.resource_name_prefix}-redis-pe-snet"
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name  = var.resource_group
  address_prefixes     = [var.redis_private_endpoint_subnet_cidr]

  #checkov:skip=CKV2_AZURE_31:NSG not required
}

# Create Subnet for App Gateway
resource "azurerm_subnet" "agw_snet" {
  # Subnet only deployed to the Test and Production subscription
  count = var.environment != "development" ? 1 : 0

  name                 = "${var.resource_name_prefix}-agw-snet"
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name  = var.resource_group
  address_prefixes     = ["172.1.3.0/24"]
  service_endpoints    = ["Microsoft.Storage", "Microsoft.Web"]

  #checkov:skip=CKV2_AZURE_31:NSG not required
}

# Create Private DNS Zone for Azure Managed Redis
resource "azurerm_private_dns_zone" "redis" {
  name                = "privatelink.redisenterprise.cache.azure.net"
  resource_group_name = var.resource_group
}

resource "azurerm_private_dns_zone_virtual_network_link" "redis" {
  name                  = "${var.resource_name_prefix}-redis-pdz-vnet-link"
  private_dns_zone_name = azurerm_private_dns_zone.redis.name
  resource_group_name   = var.resource_group
  virtual_network_id    = azurerm_virtual_network.vnet.id
}
