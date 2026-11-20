# Network Security Groups for subnets
# Reference: ITHC Report 2026, Issue 5.1.3 (Network security)

# NSG for the Web App (delegated) subnet.
# VNet integration only uses outbound rules; inbound traffic to the app reaches it via the public endpoint.
resource "azurerm_network_security_group" "webapp_nsg" {
  name                = "${var.resource_name_prefix}-webapp-nsg"
  location            = var.location
  resource_group_name = var.resource_group

  security_rule {
    name                       = "Allow-DNS-Outbound"
    priority                   = 100
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "53"
    source_address_prefix      = "*"
    destination_address_prefix = "168.63.129.16/32"
  }

  security_rule {
    name                       = "Allow-Redis-Outbound"
    priority                   = 110
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "6380"
    source_address_prefix      = "*"
    destination_address_prefix = azurerm_subnet.redis_pe_snet.address_prefixes[0]
  }

  # Contentful, Sentry, container image pulls and other HTTPS dependencies
  security_rule {
    name                       = "Allow-HTTPS-Internet-Outbound"
    priority                   = 120
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "*"
    destination_address_prefix = "Internet"
  }

  security_rule {
    name                       = "Deny-All-Outbound"
    priority                   = 4096
    direction                  = "Outbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "Deny-All-Inbound"
    priority                   = 4096
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  lifecycle {
    ignore_changes = [tags]
  }
}

resource "azurerm_subnet_network_security_group_association" "webapp_nsg" {
  subnet_id                 = azurerm_subnet.webapp_snet.id
  network_security_group_id = azurerm_network_security_group.webapp_nsg.id
}

# NSG for the Redis private endpoint subnet
resource "azurerm_network_security_group" "redis_pe_nsg" {
  name                = "${var.resource_name_prefix}-redis-pe-nsg"
  location            = var.location
  resource_group_name = var.resource_group

  security_rule {
    name                       = "Allow-Redis-TLS-From-Webapp-Inbound"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "6380"
    source_address_prefix      = azurerm_subnet.webapp_snet.address_prefixes[0]
    destination_address_prefix = azurerm_subnet.redis_pe_snet.address_prefixes[0]
  }

  security_rule {
    name                       = "Deny-All-Inbound"
    priority                   = 4096
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "Deny-All-Outbound"
    priority                   = 4096
    direction                  = "Outbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  lifecycle {
    ignore_changes = [tags]
  }
}

resource "azurerm_subnet_network_security_group_association" "redis_pe_nsg" {
  subnet_id                 = azurerm_subnet.redis_pe_snet.id
  network_security_group_id = azurerm_network_security_group.redis_pe_nsg.id
}

# NSG for the Application Gateway subnet.
# Outbound internet access must remain allowed for Application Gateway v2, so no outbound deny rules are added.
resource "azurerm_network_security_group" "agw_nsg" {
  # Subnet only deployed to the Test and Production subscription
  count = var.environment != "development" ? 1 : 0

  name                = "${var.resource_name_prefix}-agw-nsg"
  location            = var.location
  resource_group_name = var.resource_group

  security_rule {
    name                       = "Allow-HTTPS-Inbound"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "Internet"
    destination_address_prefix = azurerm_subnet.agw_snet[0].address_prefixes[0]
  }

  # Application Gateway v2 health probes from the Azure control plane
  security_rule {
    name                       = "Allow-GatewayManager-Inbound"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "65200-65535"
    source_address_prefix      = "GatewayManager"
    destination_address_prefix = "*"
  }

  # Must be explicit so that the Deny-All-Inbound rule below does not block Azure Load Balancer probes
  security_rule {
    name                       = "Allow-AzureLoadBalancer-Inbound"
    priority                   = 120
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "AzureLoadBalancer"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "Deny-All-Inbound"
    priority                   = 4096
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  lifecycle {
    ignore_changes = [tags]
  }
}

resource "azurerm_subnet_network_security_group_association" "agw_nsg" {
  # Subnet only deployed to the Test and Production subscription
  count = var.environment != "development" ? 1 : 0

  subnet_id                 = azurerm_subnet.agw_snet[0].id
  network_security_group_id = azurerm_network_security_group.agw_nsg[0].id
}
