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

# Create Subnet for Database Server
resource "azurerm_subnet" "psqlfs_snet" {
  name                 = "${var.resource_name_prefix}-psqlfs-snet"
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name  = var.resource_group
  address_prefixes     = ["172.1.0.0/24"]
  service_endpoints    = ["Microsoft.Storage"]

  delegation {
    name = "${var.resource_name_prefix}-psqlfs-dn"

    service_delegation {
      name    = "Microsoft.DBforPostgreSQL/flexibleServers"
      actions = ["Microsoft.Network/virtualNetworks/subnets/join/action"]
    }
  }

  #checkov:skip=CKV2_AZURE_31:NSG not required
}

# Create a Private DNS Zone for Database Server
resource "azurerm_private_dns_zone" "psqlfs_dnsz" {
  name                = "${var.resource_name_prefix}.postgres.database.azure.com"
  resource_group_name = var.resource_group

  lifecycle {
    ignore_changes = [tags]
  }
}

# Link the Private DNS Zone to the Virtual Network
resource "azurerm_private_dns_zone_virtual_network_link" "psqlfs_dnsz_vnetl" {
  name                  = "${var.resource_name_prefix}-psqlfs-dnsz-vnetl"
  private_dns_zone_name = azurerm_private_dns_zone.psqlfs_dnsz.name
  virtual_network_id    = azurerm_virtual_network.vnet.id
  resource_group_name   = var.resource_group

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

# Create Subnet for Background Worker App
resource "azurerm_subnet" "app_worker_snet" {
  name                 = "${var.resource_name_prefix}-app-worker-snet"
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name  = var.resource_group
  address_prefixes     = ["172.1.2.0/24"]
  service_endpoints    = ["Microsoft.Storage"]

  delegation {
    name = "${var.resource_name_prefix}-app-worker-dn"

    service_delegation {
      name    = "Microsoft.ContainerInstance/containerGroups"
      actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
    }
  }

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