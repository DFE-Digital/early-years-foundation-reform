# Create App Service Plan
resource "azurerm_service_plan" "asp" {
  name                = "${var.resource_name_prefix}-asp"
  location            = var.location
  resource_group_name = var.resource_group
  os_type             = "Linux"
  sku_name            = var.asp_sku
  worker_count        = var.webapp_worker_count

  lifecycle {
    ignore_changes = [tags]
  }

  #checkov:skip=CKV_AZURE_212:Argument not available
}

# Create Web Application
resource "azurerm_linux_web_app" "webapp" {
  name                      = var.webapp_name
  location                  = var.location
  resource_group_name       = var.resource_group
  service_plan_id           = azurerm_service_plan.asp.id
  https_only                = true
  virtual_network_subnet_id = var.webapp_subnet_id
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

    dynamic "ip_restriction" {
      # Deploy App Gateway rules only to the Test and Production subscription
      for_each = var.environment != "development" ? [1] : []
      content {
        name                      = "Allow app gateway"
        action                    = "Allow"
        priority                  = 300
        virtual_network_subnet_id = var.agw_subnet_id
      }
    }

    dynamic "ip_restriction" {
      # Deploy App Gateway rules only to the Test and Production subscription
      for_each = var.environment != "development" ? [1] : []
      content {
        name       = "Allow health check"
        action     = "Allow"
        priority   = 400
        ip_address = "127.0.0.1/0"
      }
    }

    dynamic "ip_restriction" {
      # Deploy App Gateway rules only to the Test and Production subscription
      for_each = var.environment != "development" ? [1] : []
      content {
        name       = "Deny public"
        action     = "Deny"
        priority   = 500
        ip_address = "0.0.0.0/0"
      }
    }
  }

  sticky_settings {
    app_setting_names = keys(var.webapp_app_settings)
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

# Create Web Application Deployment Slot
resource "azurerm_linux_web_app_slot" "webapp_slot" {
  name                      = "green"
  app_service_id            = azurerm_linux_web_app.webapp.id
  https_only                = true
  virtual_network_subnet_id = var.webapp_subnet_id
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
}

# Create Log Analytics
resource "azurerm_log_analytics_workspace" "webapp_logs" {
  name                = "${var.resource_name_prefix}-log"
  location            = var.location
  resource_group_name = var.resource_group
  sku                 = "PerGB2018"
  retention_in_days   = 30
  daily_quota_gb      = 1

  lifecycle {
    ignore_changes = [tags]
  }
}

resource "azurerm_monitor_diagnostic_setting" "webapp_logs_monitor" {
  name                       = "${var.resource_name_prefix}-webapp-mon"
  target_resource_id         = azurerm_linux_web_app.webapp.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.webapp_logs.id

  enabled_log {
    category = "AppServiceConsoleLogs"
  }

  enabled_log {
    category = "AppServicePlatformLogs"
  }

  timeouts {
    read = "30m"
  }

  lifecycle {
    ignore_changes = [metric]
  }
}

resource "azurerm_monitor_diagnostic_setting" "webapp_slot_logs_monitor" {
  name                       = "${var.resource_name_prefix}-webapp-green-mon"
  target_resource_id         = azurerm_linux_web_app_slot.webapp_slot.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.webapp_logs.id

  enabled_log {
    category = "AppServiceConsoleLogs"
  }

  enabled_log {
    category = "AppServicePlatformLogs"
  }

  timeouts {
    read = "30m"
  }

  lifecycle {
    ignore_changes = [metric]
  }
}

# Configure Web App Autoscaling
resource "azurerm_monitor_autoscale_setting" "asp_as" {
  # Autoscaling rules only deployed to the Test and Production subscription
  count = var.environment != "development" ? 1 : 0

  name                = "${var.resource_name_prefix}-asp-as"
  location            = var.location
  resource_group_name = var.resource_group
  target_resource_id  = azurerm_service_plan.asp.id

  profile {
    name = "Autoscaling conditions"

    capacity {
      default = 2
      minimum = 2
      maximum = 5
    }

    rule {
      metric_trigger {
        metric_name        = "CpuPercentage"
        metric_namespace   = "microsoft.web/serverfarms"
        metric_resource_id = azurerm_service_plan.asp.id
        statistic          = "Average"
        operator           = "GreaterThan"
        threshold          = 75
        time_aggregation   = "Average"
        time_grain         = "PT1M"
        time_window        = "PT10M"
      }

      scale_action {
        direction = "Increase"
        type      = "ChangeCount"
        value     = "1"
        cooldown  = "PT5M"
      }
    }

    rule {
      metric_trigger {
        metric_name        = "CpuPercentage"
        metric_namespace   = "microsoft.web/serverfarms"
        metric_resource_id = azurerm_service_plan.asp.id
        statistic          = "Average"
        operator           = "LessThan"
        threshold          = 20
        time_aggregation   = "Average"
        time_grain         = "PT1M"
        time_window        = "PT10M"
      }

      scale_action {
        direction = "Decrease"
        type      = "ChangeCount"
        value     = "1"
        cooldown  = "PT5M"
      }
    }

    rule {
      metric_trigger {
        metric_name        = "MemoryPercentage"
        metric_namespace   = "microsoft.web/serverfarms"
        metric_resource_id = azurerm_service_plan.asp.id
        statistic          = "Average"
        operator           = "GreaterThan"
        threshold          = 70
        time_aggregation   = "Average"
        time_grain         = "PT1M"
        time_window        = "PT10M"
      }

      scale_action {
        direction = "Increase"
        type      = "ChangeCount"
        value     = "1"
        cooldown  = "PT5M"
      }
    }

    rule {
      metric_trigger {
        metric_name        = "MemoryPercentage"
        metric_namespace   = "microsoft.web/serverfarms"
        metric_resource_id = azurerm_service_plan.asp.id
        statistic          = "Average"
        operator           = "LessThan"
        threshold          = 50
        time_aggregation   = "Average"
        time_grain         = "PT1M"
        time_window        = "PT10M"
      }

      scale_action {
        direction = "Decrease"
        type      = "ChangeCount"
        value     = "1"
        cooldown  = "PT5M"
      }
    }
  }

  notification {
    email {
      send_to_subscription_administrator    = true
      send_to_subscription_co_administrator = true
      custom_emails                         = [var.webapp_admin_email_address]
    }
  }

  lifecycle {
    ignore_changes = [tags]
  }
}

# Create Custom Domain Name
resource "azurerm_app_service_custom_hostname_binding" "webapp_custom_domain" {
  # Custom hostname only deployed to the Test and Production subscription
  count = var.environment != "development" ? 1 : 0

  resource_group_name = var.resource_group
  hostname            = var.webapp_custom_domain_name
  app_service_name    = azurerm_linux_web_app.webapp.name

  lifecycle {
    ignore_changes = [ssl_state, thumbprint]
  }
}

data "azurerm_client_config" "az_config" {}

resource "azurerm_key_vault_access_policy" "webapp_kv_ap" {
  # Custom hostname only deployed to the Test and Production subscription
  count = var.environment != "development" ? 1 : 0

  key_vault_id = var.kv_id
  tenant_id    = data.azurerm_client_config.az_config.tenant_id
  # Can be retrieved using 'az ad sp show --id abfa0a7c-a6b6-4736-8310-5855508787cd --query id'
  object_id               = var.as_service_principal_object_id
  secret_permissions      = ["Get"]
  certificate_permissions = ["Get"]
}

resource "azurerm_app_service_certificate" "webapp_custom_domain_cert" {
  # Custom hostname only deployed to the Test and Production subscription
  count = var.environment != "development" ? 1 : 0

  name                = var.webapp_custom_domain_cert_secret_label
  resource_group_name = var.resource_group
  location            = var.location
  key_vault_secret_id = var.kv_cert_secret_id
}

resource "azurerm_app_service_certificate_binding" "webapp_custom_domain_cert_bind" {
  # Custom hostname only deployed to the Test and Production subscription
  count = var.environment != "development" ? 1 : 0

  hostname_binding_id = azurerm_app_service_custom_hostname_binding.webapp_custom_domain[0].id
  certificate_id      = azurerm_app_service_certificate.webapp_custom_domain_cert[0].id
  ssl_state           = "SniEnabled"
}