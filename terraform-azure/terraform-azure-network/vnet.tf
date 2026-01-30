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
