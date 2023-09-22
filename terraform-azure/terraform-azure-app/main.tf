# Create Background Worker Application
resource "azurerm_container_group" "app_worker" {
  name                = var.app_worker_name
  location            = var.location
  resource_group_name = var.resource_group
  ip_address_type     = "Private"
  os_type             = "Linux"
  restart_policy      = "OnFailure"

  container {
    name                  = var.container_name
    image                 = "${var.app_worker_docker_registry}/${var.app_worker_docker_image}:${var.app_worker_docker_image_tag}"
    cpu                   = "1.0"
    memory                = "2.0"
    environment_variables = var.app_worker_environment_variables
    commands              = var.app_worker_startup_command

    ports {
      port     = 80
      protocol = "TCP"
    }
  }

  diagnostics {
    log_analytics {
      workspace_id  = azurerm_log_analytics_workspace.app_worker_logs.workspace_id
      workspace_key = azurerm_log_analytics_workspace.app_worker_logs.primary_shared_key
    }
  }

  subnet_ids = [var.app_worker_subnet_id]

  lifecycle {
    ignore_changes = [tags]
  }

  #checkov:skip=CKV2_AZURE_28:Using VNet
}

# Create Log Analytics
resource "azurerm_log_analytics_workspace" "app_worker_logs" {
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