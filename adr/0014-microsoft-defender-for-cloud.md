# 0014. Microsoft Defender for Cloud Plans

**Status:** Accepted
**Date Created:** 2026-08-21
**ITHC Reference:** Issues 5.1.1 & 5.1.2, 2026 ITHC Report (pages 9–17)

---

## Summary

Microsoft Defender for Cloud plans were flagged as missing in the 2026 ITHC report. The Key Vault plan requires enablement:

1. **Microsoft Defender for Key Vault** – enables anomaly detection on secret access patterns, alerting on unusual locations, high-volume retrievals, and suspicious vault configuration changes
This provides critical security monitoring aligned with DfE baseline security requirements while avoiding the additional cost of App Service protection.

---

## Context & Problem Statement

- **ITHC Finding:** Microsoft Defender plans not enabled in Azure subscription
- **Current State:** Only basic Azure monitoring is configured (diagnostic logs for App Gateway, Web App, and App Service Plan autoscaling); no threat detection or anomaly detection capabilities
- **Impact:**
  - No anomaly detection on Key Vault secret access (used for certificate retrieval and potential secrets storage)
  - Reduced visibility into suspicious administrative changes
  - Compliance gap against DfE security baseline

---

## Solution Decision

**Enable Microsoft Defender for Key Vault using Terraform-managed Infrastructure-as-Code.**

1. **Defender for Key Vault** – enables anomaly detection on secret access patterns, alerting on unusual locations, high-volume retrievals, and suspicious vault configuration changes

### Rationale

- **Infrastructure-as-Code discipline:** Managed via Terraform ensures consistent, auditable, and reproducible configuration across environments
- **Compliance alignment:** Closes ITHC findings 5.1.1 & 5.1.2
- **Low friction:** These are subscription-level Azure settings with no code refactoring required
- **Auditability:** Full code review trail and Terraform state history for compliance and debugging
- **Risk:** Enablement presents no risk to application functionality
- **Cost:** Defender for Key Vault is a paid workload-protection plan with ongoing monthly charges;

### Implementation Method

The Defender plan is managed via an `azurerm_security_center_subscription_pricing` Terraform resource in `terraform-azure/security.tf`:

```hcl
# Microsoft Defender for Key Vault
resource "azurerm_security_center_subscription_pricing" "keyvault" {
   count         = var.environment != "development" ? 1 : 0
  tier          = "Standard"
  resource_type = "KeyVaults"

   depends_on = [azurerm_resource_group.rg]
}

```

**Rationale for Method:** Terraform-managed approach aligns with existing Infrastructure-as-Code pattern used for all Azure resources in this project, ensuring consistency, peer review, and state management.

---

## Implementation Status

### Completed

- [x] Created `terraform-azure/security.tf` with the Defender for Key Vault resource
- [x] Branch: `HEYP-206/microsoft-defender`

- [X] PR review by infrastructure team
- [X] Merge to `main`
- [X] Apply Terraform to production subscription

### Next Steps

1. **Apply Terraform:**
   ```bash
   run terraform apply
   ```

2. **Validation:**
   - [X] Check Azure Portal: **Microsoft Defender for Cloud** → **Environment Settings**
   - [X] Confirm Defender for Key Vault shows as **Enabled** with **Standard** tier
   - [X] Monitor for alerts (may take 24–48 hours for initial data)
   - [X] Verify no errors in Azure Activity Log

3. **Close ITHC Findings:**
   - [X] Document completion with evidence of enablement
   - [X] Mark ITHC 5.1.1 & 5.1.2 as **Resolved**

---

## Acceptance Criteria

- [X] PR with `terraform-azure/security.tf` is merged to `main`
- [X] Terraform is successfully applied to production subscription
- [X] Microsoft Defender for Key Vault shows **Enabled** and **Standard** tier in Azure Portal > Environment Settings
- [X] No errors or warnings in Azure Portal Health Check
- [X] Terraform state reflects the enabled Key Vault plan
- [X] ITHC findings 5.1.1 & 5.1.2 can be closed with evidence of enablement

---

## Dependencies & Considerations

- **Terraform Provider Version:** Requires Azure provider v2.5.0+ (supports `azurerm_security_center_subscription_pricing`)
- **Azure Subscription:** DfE must have Azure Security Center (Microsoft Defender for Cloud) available in their subscription tier
- **Cost Verification:** Microsoft publishes explicit billing for Defender for Key Vault. Charges vary by agreement/currency; confirm exact rates and commit-unit coverage with DfE cloud ops/finance before production enablement
- **Timeline:** Terraform apply immediately after merge; alerts may take 24–48 hours to become active
- **Risk:** Minimal – enablement does not modify application code or existing infrastructure resources

---

## Related Documents

- 2026 ITHC Report (Issues 5.1.1 & 5.1.2, pages 9–17)
- [ADR-0010: Contentful](./0010-contentful.md) (external service monitoring context)
- [ADR-0011: Sentry Monitoring](./0011-sentry-monitoring.md) (existing error tracking)
- Implementation ticket: HEYP-206

## Consequences

**Positive:**
- Closes ITHC findings 5.1.1 & 5.1.2 with production-grade threat detection
- Enables anomaly detection on Key Vault access patterns (unusual locations, high-volume retrievals)
- Infrastructure-as-Code managed for auditability and reproducibility
- Consistent with existing Terraform patterns

**Neutral:**
- Defender for Key Vault introduces ongoing monthly cost (pricing may differ by agreement, currency, and pre-purchase discounts)

**Negative:**
- Defender for Key Vault is intentionally not enabled in the development subscription to avoid unnecessary cost
