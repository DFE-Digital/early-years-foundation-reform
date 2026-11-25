# Microsoft Defender for Cloud Plans
# Enables threat detection for Key Vault and App Service
# Reference: ITHC Report 2026, Findings 5.1.1 & 5.1.2

# Microsoft Defender for Key Vault
# Provides anomaly detection on secret access patterns, alerting on access from unusual locations,
# high volumes of secret retrievals, and visibility into suspicious administrative changes
resource "azurerm_security_center_subscription_pricing" "keyvault" {
  count         = var.environment != "development" ? 1 : 0
  tier          = "Standard"
  resource_type = "KeyVaults"

  depends_on = [azurerm_resource_group.rg]
}

# Microsoft Defender for App Service
# Provides runtime threat detection, e.g. command injection attempts and
# communication with known malicious IP addresses
resource "azurerm_security_center_subscription_pricing" "appservices" {
  count         = var.environment != "development" ? 1 : 0
  tier          = "Standard"
  resource_type = "AppServices"

  depends_on = [azurerm_resource_group.rg]
}
