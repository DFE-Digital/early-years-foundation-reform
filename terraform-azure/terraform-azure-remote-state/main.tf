# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.65.0"
    }
  }

  required_version = ">= 1.5.0"
}

provider "azurerm" {
  skip_provider_registration = "true"

  features {}
}

locals {
  # Common tags to be assigned to all resources
  common_tags = {
    "Environment"      = var.default_environment
    "Parent Business"  = "Children’s Care"
    "Portfolio"        = "Newly Onboarded"
    "Product"          = "Help for Early Years Providers"
    "Service"          = "Newly Onboarded"
    "Service Line"     = "Newly Onboarded"
    "Service Offering" = "Help for Early Years Providers"
  }
}

# Create Remote State Storage
resource "azurerm_resource_group" "tfstate" {
  name     = "${var.resource_name_prefix}-tfstate-rg"
  location = var.default_azure_region

  tags = merge(local.common_tags, {
    "Region" = var.default_azure_region
  })
}

resource "random_string" "resource_code" {
  length  = 5
  special = false
  upper   = false
}

resource "azurerm_storage_account" "tfstate" {
  name                            = "hfeyptfstate${random_string.resource_code.result}st"
  resource_group_name             = azurerm_resource_group.tfstate.name
  location                        = var.default_azure_region
  account_tier                    = "Standard"
  min_tls_version                 = "TLS1_2"
  account_replication_type        = "LRS"
  allow_nested_items_to_be_public = false

  queue_properties {
    logging {
      delete                = true
      read                  = true
      write                 = true
      version               = "1.0"
      retention_policy_days = 10
    }
    hour_metrics {
      enabled               = true
      include_apis          = true
      version               = "1.0"
      retention_policy_days = 10
    }
    minute_metrics {
      enabled               = true
      include_apis          = true
      version               = "1.0"
      retention_policy_days = 10
    }
  }

  tags = merge(local.common_tags, {
    "Region" = var.default_azure_region
  })

  #checkov:skip=CKV_AZURE_206:GRS not required
  #checkov:skip=CKV_AZURE_59:Argument has been deprecated
  #checkov:skip=CKV2_AZURE_18:Microsoft Managed keys are sufficient
  #checkov:skip=CKV2_AZURE_1:Microsoft Managed keys are sufficient
  #checkov:skip=CKV2_AZURE_38:Soft-delete not required
  #checkov:skip=CKV2_AZURE_33:VNet not configured
  #checkov:skip=CKV2_AZURE_41:Ensure storage account is configured with SAS expiration policy
  #checkov:skip=CKV2_AZURE_40:Ensure storage account is not configured with Shared Key authorization
}

resource "azurerm_storage_container" "tfstate" {
  name                  = "${var.resource_name_prefix}-tfstate-stc"
  storage_account_name  = azurerm_storage_account.tfstate.name
  container_access_type = "private"

  #checkov:skip=CKV2_AZURE_21:Logging not required
}

