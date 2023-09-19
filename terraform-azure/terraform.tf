# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "= 3.71.0"
    }
  }

  required_version = ">= 1.5.0"

  backend "azurerm" {
    use_oidc = true
  }
}
