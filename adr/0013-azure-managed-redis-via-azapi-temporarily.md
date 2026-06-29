# Use AzAPI for Azure Managed Redis temporarily

* Status: accepted

## Context and Problem Statement

We are adding Azure Managed Redis for caching. A portfolio example uses
`azurerm_managed_redis`, but this repository currently pins `azurerm` to
`3.71.0` in `terraform-azure/terraform.tf`.

At this pinned provider version, `azurerm_managed_redis` is not available.
Using only native `azurerm` resources at this version would force older Redis
Enterprise resource patterns and does not align with the managed Redis model we
want to adopt.

## Decision Drivers

* Deliver Azure Managed Redis safely.
* Avoid a broad provider-major upgrade while introducing new infrastructure.
* Keep implementation aligned with current provider constraints.
* Leave a clear migration path to native `azurerm_managed_redis`.

## Considered Options

* **Upgrade `azurerm` to 4.x now and use `azurerm_managed_redis`.**
  Not chosen for this PR due to medium upgrade risk and broader infra impact.
* **Use `azurerm_redis_enterprise_*` resources on `3.71.0`.**
  Not chosen as the SKU and model differ from Azure Managed Redis requirements.
* **Use AzAPI now for Managed Redis, then migrate later.**
  Chosen.

## Decision Outcome

For this PR, we implement Azure Managed Redis using:

* `azapi_resource` for `Microsoft.Cache/redisEnterprise` and child database.
* `azurerm_private_endpoint` and private DNS scaffolding for private access.
* `azurerm` data source usage where possible for key retrieval.
* A compatibility-first toggle for access-key authentication (enabled by default).

This keeps delivery moving without taking on a provider-major upgrade in the
same change set.

## Consequences

### Positive

* Enables Azure Managed Redis now on the existing provider baseline.
* Reduces blast radius of this PR by isolating provider-upgrade risk.
* Keeps private networking and app wiring moving forward.

### Negative

* We rely on `azapi_resource` with limited schema-time validation.
* Configuration is split across providers (`azurerm` + `azapi`).
* Access-key authentication remains enabled by default for current app compatibility.
* Migration work remains to move to native `azurerm_managed_redis`.

## Follow-up / Migration Trigger

Create a follow-up infra PR to upgrade `azurerm` to a compatible 4.x version and
migrate Redis resources to `azurerm_managed_redis` when:

* Terraform plan/apply for existing modules is validated against 4.x.
* Required provider-breaking changes are addressed and reviewed.
* A migration plan for Redis resource/state transition is approved.
