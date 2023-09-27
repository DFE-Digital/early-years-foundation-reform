# Create PIP for App Gateway
resource "azurerm_public_ip" "agw_pip" {
  # Application Gateway is not deployed to the Development subscription
  count = var.environment != "development" ? 1 : 0

  name                    = "${var.resource_name_prefix}-agw-pip"
  resource_group_name     = var.resource_group
  location                = var.location
  allocation_method       = "Static"
  ip_version              = "IPv4"
  sku                     = "Standard"
  sku_tier                = "Regional"
  zones                   = []
  idle_timeout_in_minutes = 4

  lifecycle {
    ignore_changes = [tags]
  }
}