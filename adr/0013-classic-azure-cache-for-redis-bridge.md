# Use Classic Azure Cache for Redis as a bridge

* Status: accepted

## Context and Problem Statement

The service needs a shared Redis cache for cross-instance caching in production
workloads.

The previously implemented path used `Microsoft.Cache/redisEnterprise` via
AzAPI. In this subscription/region, new Redis Enterprise style creation is now
blocked with provider-side errors indicating retirement and requiring Azure
Managed Redis.

At the same time, Azure Managed Redis provisioning was not available through a
stable, working path in our current deployment constraints for this rollout.
That left us with a delivery blocker for staging/production cache rollout.

## Decision Drivers

* Unblock deployment of shared Redis caching now.
* Avoid further rollout delays caused by blocked Redis Enterprise creation.
* Keep private networking and app cache wiring intact.
* Keep a clear migration path to Azure Managed Redis when available.

## Considered Options

* **Continue with Redis Enterprise / AzAPI (`Microsoft.Cache/redisEnterprise`).**
  Not chosen: creation path is blocked for new resources in this environment.
* **Migrate immediately to Azure Managed Redis for all environments.**
  Not chosen for this change set due to current platform/enablement constraints
  and need to unblock delivery.
* **Use classic Azure Cache for Redis (`Microsoft.Cache/Redis`) as a bridge.**
  Chosen.

## Decision Outcome

For this implementation, we use classic Azure Cache for Redis via
`azurerm_redis_cache` with private endpoint integration.

Key implementation details:

* Redis resource uses `azurerm_redis_cache` (not AzAPI).
* Private endpoint targets subresource `redisCache`.
* Private DNS zone is `privatelink.redis.cache.windows.net`.
* Application settings (`REDIS_HOST`, `REDIS_PORT`, `REDIS_PASSWORD`,
  `REDIS_URL`) are wired from `azurerm_redis_cache` outputs.
* Environment sizing is cost-aware:
  * development: Standard C1
  * non-development: Premium P1

This unblocks current deployment while preserving private networking and app
cache integration.

## Consequences

### Positive

* Unblocks Redis provisioning for staging/production rollout.
* Removes dependency on blocked Redis Enterprise creation path.
* Uses first-class `azurerm` resource support for Redis.
* Keeps current Rails cache integration unchanged (still driven by `REDIS_URL`).

### Negative

* This is an interim bridge, not the target long-term Redis platform.
* Classic Azure Cache for Redis has published retirement timelines and should be
  migrated.
* A future migration to Azure Managed Redis is still required.

## Follow-up / Migration Trigger

Create a follow-up infrastructure change to migrate from classic Azure Cache for
Redis to Azure Managed Redis when all of the following are true:

* Azure Managed Redis provisioning is available and approved for this
  subscription/region.
* A migration/cutover plan (data, DNS/private endpoint, rollback) is reviewed
  and approved.
* Operational runbooks and monitoring are updated for the target service.
