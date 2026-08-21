# 0014. Microsoft Defender for Cloud Plans

**Status:** Accepted  
**Date Created:** 2026-08-21  
**ITHC Reference:** Issues 5.1.1 & 5.1.2, 2026 ITHC Report (pages 9–17)

---

## Summary

Microsoft Defender for Cloud plans were flagged as missing in the 2026 ITHC report. Two specific plans require enablement:

1. **Microsoft Defender for Key Vault** – enables anomaly detection on secret access patterns, alerting on unusual locations, high-volume retrievals, and suspicious vault configuration changes
2. **Microsoft Defender for App Service** – enables runtime threat detection for application-level attacks (command injection, suspicious file access, malicious IP communication)

Both provide critical security monitoring aligned with DfE baseline security requirements.

---

## Context & Problem Statement

- **ITHC Finding:** Microsoft Defender plans not enabled in Azure subscription
- **Current State:** Only basic Azure monitoring is configured (diagnostic logs for App Gateway, Web App, and App Service Plan autoscaling); no threat detection or anomaly detection capabilities
- **Impact:** 
  - No runtime threat detection for the App Service hosting the application
  - No anomaly detection on Key Vault secret access (used for certificate retrieval and potential secrets storage)
  - Reduced visibility into suspicious administrative changes
  - Compliance gap against DfE security baseline

---

## Solution Decision

**Enable both Microsoft Defender for Cloud plans using Terraform-managed Infrastructure-as-Code.**

1. **Defender for Key Vault** – enables anomaly detection on secret access patterns, alerting on unusual locations, high-volume retrievals, and suspicious vault configuration changes
2. **Defender for App Service** – enables runtime threat detection for application-level attacks (command injection, suspicious file access, malicious IP communication)

### Rationale

- **Infrastructure-as-Code discipline:** Managed via Terraform ensures consistent, auditable, and reproducible configuration across environments
- **Compliance alignment:** Closes ITHC findings 5.1.1 & 5.1.2
- **Low friction:** These are subscription-level Azure settings with no code refactoring required
- **Auditability:** Full code review trail and Terraform state history for compliance and debugging
- **Risk:** Enablement presents no risk to application functionality
- **Cost:** Defender plans typically included in Azure Security Center standard tier; minimal or no incremental cost

### Implementation Method

Defender plans are managed via `azurerm_security_center_subscription_pricing` Terraform resources in `terraform-azure/security.tf`:

```hcl
# Microsoft Defender for Key Vault
resource "azurerm_security_center_subscription_pricing" "keyvault" {
  tier          = "Standard"
  resource_type = "KeyVaults"
  depends_on = [azurerm_resource_group.rg]
}

# Microsoft Defender for App Service
resource "azurerm_security_center_subscription_pricing" "appservice" {
  tier          = "Standard"
  resource_type = "AppServices"
  depends_on = [azurerm_resource_group.rg]
}
```

**Rationale for Method:** Terraform-managed approach aligns with existing Infrastructure-as-Code pattern used for all Azure resources in this project, ensuring consistency, peer review, and state management.

---

## Implementation Status

### Completed

- [x] Created `terraform-azure/security.tf` with Terraform resources for both Defender plans
- [x] Branch: `HEYP-206/microsoft-defender`

### In Progress

- [ ] PR review by infrastructure team
- [ ] Merge to `main`
- [ ] Apply Terraform to production subscription

### Next Steps

1. **Create Pull Request** from branch `HEYP-206/microsoft-defender`
   - Reference this ADR (0014) and ITHC findings (5.1.1 & 5.1.2)
   - Include link to original ticket

2. **Code Review & Approval** by infrastructure team

3. **Apply Terraform:**
   ```bash
   cd terraform-azure
   terraform plan
   terraform apply
   ```

4. **Validation:**
   - [ ] Check Azure Portal: **Microsoft Defender for Cloud** → **Environment Settings**
   - [ ] Confirm both plans show as **Enabled** with **Standard** tier
   - [ ] Monitor for alerts (may take 24–48 hours for initial data)
   - [ ] Verify no errors in Azure Activity Log

5. **Close ITHC Findings:**
   - [ ] Document completion with evidence of enablement
   - [ ] Mark ITHC 5.1.1 & 5.1.2 as **Resolved**

---

## Acceptance Criteria

- [ ] PR with `terraform-azure/security.tf` is merged to `main`
- [ ] Terraform is successfully applied to production subscription
- [ ] Microsoft Defender for Key Vault shows **Enabled** and **Standard** tier in Azure Portal > Environment Settings
- [ ] Microsoft Defender for App Service shows **Enabled** and **Standard** tier in Azure Portal > Environment Settings
- [ ] No errors or warnings in Azure Portal Health Check
- [ ] Terraform state reflects both enabled plans
- [ ] ITHC findings 5.1.1 & 5.1.2 can be closed with evidence of enablement

---

## Dependencies & Considerations

- **Terraform Provider Version:** Requires Azure provider v2.5.0+ (supports `azurerm_security_center_subscription_pricing`)
- **Azure Subscription:** DfE must have Azure Security Center (Microsoft Defender for Cloud) available in their subscription tier
- **Cost Verification:** Defender plans typically included in Azure Security Center standard tier; no incremental cost expected but confirm with DfE cloud ops
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
- Enables runtime threat detection for App Service (command injection, suspicious file access)
- Infrastructure-as-Code managed for auditability and reproducibility
- Consistent with existing Terraform patterns

**Neutral:**
- Defender plans may incur cost depending on DfE Azure subscription tier (typically included in standard tier)
- Alerts may take 24–48 hours to become active after deployment

**Negative:**
- None identified; enablement presents no functional or operational risk
