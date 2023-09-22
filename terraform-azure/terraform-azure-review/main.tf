# Create App Service Plan
resource "azurerm_service_plan" "asp" {
  name                = "${var.resource_name_prefix}-asp"
  location            = var.location
  resource_group_name = var.resource_group
  os_type             = "Linux"
  sku_name            = var.asp_sku

  lifecycle {
    ignore_changes = [tags]
  }

  #checkov:skip=CKV_AZURE_212:Argument not available
}

# Create Review Application
resource "azurerm_linux_web_app" "review-app" {
  name                      = var.webapp_name
  location                  = var.location
  resource_group_name       = var.resource_group
  service_plan_id           = azurerm_service_plan.asp.id
  https_only                = true
  virtual_network_subnet_id = azurerm_subnet.reviewapp_snet.id
  app_settings              = var.webapp_app_settings

  site_config {
    app_command_line                  = var.webapp_startup_command
    health_check_path                 = var.webapp_health_check_path
    health_check_eviction_time_in_min = var.webapp_health_check_eviction_time_in_min
    http2_enabled                     = true
    vnet_route_all_enabled            = true

    application_stack {
      docker_image_name   = "${var.webapp_docker_image}:${var.webapp_docker_image_tag}"
      docker_registry_url = var.webapp_docker_registry_url
    }
  }

  logs {
    detailed_error_messages = true
    failed_request_tracing  = true

    application_logs {
      file_system_level = "Warning"
    }

    http_logs {
      file_system {
        retention_in_days = 1
        retention_in_mb   = 25
      }
    }
  }

  lifecycle {
    ignore_changes = [tags]
  }

  #checkov:skip=CKV_AZURE_13:App uses built-in authentication
  #checkov:skip=CKV_AZURE_88:Using Docker
  #checkov:skip=CKV_AZURE_17:Argument not available
  #checkov:skip=CKV_AZURE_78:Disabled by default in Terraform version used
  #checkov:skip=CKV_AZURE_16:Using VNET Integration
  #checkov:skip=CKV_AZURE_71:Using VNET Integration
  #checkov:skip=CKV_AZURE_222:Network access rules configured
}

# Create Subnet for Review Application
resource "azurerm_subnet" "reviewapp_snet" {
  name                 = "${var.resource_name_prefix}-reviewapp-snet"
  virtual_network_name = var.webapp_vnet_name
  resource_group_name  = var.resource_group
  address_prefixes     = ["172.1.3.0/26"]
  service_endpoints    = ["Microsoft.Storage"]

  delegation {
    name = "${var.resource_name_prefix}-reviewapp-dn"

    service_delegation {
      name    = "Microsoft.Web/serverFarms"
      actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
    }
  }

  #checkov:skip=CKV2_AZURE_31:NSG not required
}