# Microsoft Defender for Cloud Plans
# Enables threat detection and anomaly detection for Key Vault
# Reference: ITHC Report 2026, Issues 5.1.1 & 5.1.2

# Microsoft Defender for Key Vault
# Provides anomaly detection on secret access patterns, alerting on access from unusual locations,
# high volumes of secret retrievals, and visibility into suspicious administrative changes
resource "azurerm_security_center_subscription_pricing" "keyvault" {
  tier          = "Standard"
  resource_type = "KeyVaults"

  depends_on = [azurerm_resource_group.rg]
}
