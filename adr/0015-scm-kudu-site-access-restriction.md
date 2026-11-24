# 0015. Restrict Access to the SCM/Kudu Management Site

* Status: proposed
* Date: 2026-11-20
* ITHC Reference: Issue 5.1.2, 2026 ITHC Report (pages 13–17)

## Context and Problem Statement

The 2026 ITHC found that the App Service SCM/Kudu management site (`<app>.scm.azurewebsites.net`) had no access restrictions. The main site only accepts traffic from the Application Gateway subnet, but the SCM site does not inherit those rules. Anyone who finds the SCM URL can reach the Kudu console directly, bypassing the WAF and Application Gateway.

The team uses the SCM site for the portal SSH blade, Advanced Tools (Kudu) and `az webapp ssh`. Blocking it for everyone would stop that access, so the fix has to keep it available to approved administrators.

## Decision Drivers

* Close ITHC finding 5.1.2 on the SCM route.
* Keep SSH and Advanced Tools working for named administrators.
* Keep the change in Terraform, consistent with [ADR-0008](0008-infrastructure-as-code.md).
* Don't cause an outage. An empty allowlist must not lock everyone out.
* Networks change, so the allowlist must be easy to update.

## Considered Options

1. **Use main site rules** (`scm_use_main_ip_restriction = true`). The SCM site inherits the App Gateway allow rule. Simple, but it blocks portal SSH and Kudu for everyone, since admins don't route through the gateway.
2. **Deny all on the SCM site, with no exceptions.** This is what the recovery service does. It closes the finding but removes admin access entirely, and the team relies on it.
3. **Deny by default, with allow rules for named admin ranges.** Closes the finding and keeps admin access for listed networks. Needs upkeep when networks change.
4. **Restrict access through Azure RBAC and PIM** instead of IP rules. Fits the ITHC's RBAC concern best, but is a larger change to how admins get access.

## Decision Outcome

Chosen option: **3. Deny by default, with allow rules for named admin ranges.**

* The `scm_admin_ip_ranges` Terraform variable (default `[]`) lists the CIDR ranges allowed to reach the SCM site.
* Each range gets an allow rule at priority 100 and up.
* A deny-all rule for `0.0.0.0/0` at priority 500 is added to the web app and the `green` slot. It only applies when the list is non-empty, and never in development.
* With the default empty list, nothing changes. The deny rule takes effect only after ranges are set, so an apply can't lock out admins by accident.

The ranges are not yet filled in. The change must not be applied to stage or prod until the ranges are agreed and set.

### Consequences

**Positive**

* Closes the public SCM route (ITHC 5.1.2) once ranges are set.
* Keeps portal SSH, Advanced Tools and `az webapp ssh` working for listed networks.
* Lets the team choose ranges and roll out without a code change to the rule logic.

**Negative**

* The allowlist needs upkeep when office, VPN or home networks change.
* Terraform owns these rules, so temporary portal whitelist edits are overwritten on the next apply. Add ranges to `scm_admin_ip_ranges` instead.
* Admin access depends on IP ranges, not identity. RBAC/PIM (option 4) is still the longer-term option.

**Neutral**

* Kudu's publishing-credential basic auth is not changed by this decision and needs a separate check.

## Implementation

* [webapp.tf](../terraform-azure/terraform-azure-web/webapp.tf): SCM allow and deny rules on the web app and slot.
* [variables.tf](../terraform-azure/terraform-azure-web/variables.tf) and [variables.tf](../terraform-azure/variables.tf): `scm_admin_ip_ranges`.
* [main.tf](../terraform-azure/main.tf): passes the variable to the web module.
* [README.md](../README.md) and [docs/redis-local-demo.md](../docs/redis-local-demo.md): console access notes.

### Open items

1. Agree the admin CIDR ranges and set `scm_admin_ip_ranges`.
2. Wire the variable through [tf-azure-deploy.yml](../.github/workflows/tf-azure-deploy.yml), sourced from a GitHub variable.
3. Verify on stage: portal SSH and Advanced Tools work from an allowed range and are denied from elsewhere.
4. Check Kudu basic-auth publishing credentials.
5. Update this ADR's status to accepted once the change is applied to production.
