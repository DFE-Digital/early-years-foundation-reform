# Redis caching & Contentful resilience

A walkthrough of the caching refactor for devs. The site is a thin read layer over
Contentful (the CMS); Contentful is slow and occasionally flaky. This work makes
caching **shared across app instances** (via Redis) instead of per‑process, and makes
the CMS calls **resilient** so a Contentful blip never takes the site down.

There are two independent concerns bundled together — keep them separate in your head:

- **A. Where the cache lives** — Redis (shared) in prod/staging, in‑process memory in local/test.
- **B. How we behave when Contentful misbehaves** — retries, a circuit breaker, and stale fallbacks.

---

## Mental model

```
Controller / View
      │
   Page / Resource models      (by_slug, navigation_items, thumbnail…)
      │
   Caching concern   ─────────► Rails.cache ──► Redis (all hosted envs) | NullStore (Rails test/dev)
      │
   with_contentful_resilience ─► Contentful API
```

Almost everything funnels through one mixin: **`app/models/concerns/caching.rb`**.

> Want to see it actually populate on your machine? See
> [`redis-local-demo.md`](redis-local-demo.md) for a 2‑minute local setup + demo.

---

## Where the store is chosen — `config/environments/production.rb:61`

```ruby
config.cache_store = if ENV['REDIS_URL'].present?
                       [:redis_cache_store, { url: ENV['REDIS_URL'], … , error_handler: … }]
                     else
                       [:memory_store, { size: 128.megabytes }]
                     end
```

- `REDIS_URL` present → Redis; absent → in‑process memory store.
- The **`error_handler`** logs and *swallows* Redis failures — the app keeps serving.
  Framing: **Redis is an optimisation, never a hard dependency.**
- Aggressive 1s connect/read/write timeouts + `reconnect_attempts` so a slow Redis
  can't slow down requests.
- This branch is **production‑only**. All hosted Azure environments (dev, staging,
  production) run Rails in `production` mode and each has its own provisioned Redis
  (`redis.tf` — staging/prod are Premium P1, the dev env is Standard C1), so all three
  use Redis. The Rails **test** env ignores `REDIS_URL` (see [Tests](#tests)).

`REDIS_URL` itself is not set by hand — it's built in Terraform
(`terraform-azure/local.tf:32`) from the provisioned cache and injected as an Azure
App Service app setting, which the container sees as an env var. See
[Deployment](#deployment).

---

## The caching concern — `app/models/concerns/caching.rb`

The engine. A few key pieces:

### `shared_cache?` (`:121`) — the gate
```ruby
def shared_cache?
  Rails.cache.present? && !Rails.cache.is_a?(ActiveSupport::Cache::NullStore)
end
```
True only when a real shared store is configured. **Every** shared‑cache code path
checks this, which is why dev/test (NullStore) behave exactly like before — they fall
back to the original in‑process `dry-core` cache.

### `fetch_or_store` (`:18`) and `fetch_or_store_non_nil` (`:48`) — the two primitives
Both: if `shared_cache?` → use `Rails.cache.fetch`; otherwise → in‑process cache.

`fetch_or_store_non_nil` uses `skip_nil: true` so a **transient failure (which returns
nil) is never cached** — we retry on the next request instead of remembering the
failure. This is what the primary lookups (`by_slug`, `by_name`) use.

### Versioned cache keys — `to_key` (`:28`), `cache_key` (`:33`), `reset_cache_key!` (`:66`)
Every cache key is suffixed with a version string:

```ruby
to_key('home')  # => "home-<version>"   e.g. "home-initial" or "home-29-06-2026-14-30"
```

To invalidate **everything**, we don't delete keys — we just **bump the version**
(`reset_cache_key!`). Old keys become orphaned and expire by TTL; new reads compute a
new key and miss → refetch. Cheap, atomic, and works across all instances because the
version lives in Redis. This is how a CMS publish busts the cache (see
[Invalidation](#cache-invalidation)).

---

## Resilience layer — `with_contentful_resilience` (`caching.rb:79`)

Wraps a Contentful call with three protections:

1. **Retries with backoff** — on timeout / 5xx / 429, retry up to `max_retries`
   (default 2) with exponential backoff + jitter, honouring a `Retry-After` header
   if present.
2. **Circuit breaker** — shared failure state in Redis:
   - `register_circuit_failure!` (`:137`) increments a counter (Redis `INCR`).
   - After `CIRCUIT_FAILURE_THRESHOLD` (5) failures within `CIRCUIT_OPEN_DURATION`
     (60s), the circuit **opens** (`circuit_open?` `:131`) and calls fail fast with
     `CIRCUIT_BREAKER_ERROR` instead of hammering a struggling Contentful.
   - A successful call clears it (`clear_circuit_breaker!` `:146`).
   - Because the state is in Redis, **all instances cooperate** — one instance's
     failures protect the whole fleet.

Callers always rescue and degrade (return `nil`, stale data, or `[]`) — never raise to
the user.

---

## Primary lookups — `by_slug` / `by_name`

`Page.by_slug` (`app/models/page.rb:27`) and `Resource.by_name`
(`app/models/resource.rb:10`) are the workhorses:

```ruby
def self.by_slug(slug)
  fetch_or_store_non_nil to_key(slug) do
    with_contentful_resilience(context: "Page.by_slug('#{slug}')") do
      find_by(slug: slug.to_s)&.first
    end
  rescue ::HTTP::TimeoutError, ::Contentful::Error, Caching::CIRCUIT_BREAKER_ERROR
    nil
  end
end
```

Simple: cache (skip nil) + resilience. If it ultimately fails it returns `nil`, and that
one page 404s/errors — acceptable for a single page. Contrast this with the layout
collections below, which need much stronger guarantees.

---

## Layout collections — `navigation_items` & `footer_items`

These are the **header nav links** and **footer links**, and they render on **every
page**. A failure here would break the whole site's chrome, not one page — so they get
a more elaborate **stale‑while‑revalidate** treatment.

`navigation_items` (`page.rb:38`):
```ruby
def self.navigation_items
  read_collection_with_stale_fallback('navigation_items') do
    home&.pages.to_a          # the actual CMS fetch: home's child pages
  end
end
```
The block is just "how to fetch fresh." All the cleverness is in
`read_collection_with_stale_fallback`. `footer_items` is identical for `footer`'s
children.

### Two copies in Redis
| Copy | TTL (constant) | Meaning |
|------|----------------|---------|
| `…:fresh` | `LAYOUT_CACHE_TTL` = **5 min** (+ jitter) | recent enough — just use it |
| `…:stale` | `LAYOUT_STALE_TTL` = **30 min** | old but serviceable — serve while refreshing |

### The flow — `read_collection_with_stale_fallback` (`page.rb:150`)
```ruby
fresh = Rails.cache.read(fresh_key)
return fresh if fresh.present?          # (1) fresh hit — instant, no CMS call

stale = Rails.cache.read(stale_key)
if stale.present?                       # (2) fresh expired, stale exists
  enqueue_refresh(key)                  #     → schedule a background refresh
  return stale                          #     → serve stale NOW, don't wait
end

data = with_contentful_resilience(...)  # (3) cold cache — fetch inline once
write_collection_caches(key, data)      #     → store both fresh + stale
data
rescue …, Caching::CIRCUIT_BREAKER_ERROR
  stale || []                           # (4) everything failed → stale, else empty
```

Four outcomes, in priority order:
1. **Fresh hit** — most requests; instant, no Contentful.
2. **Stale hit** — instant *and* schedules a refresh (the stale‑while‑revalidate magic).
3. **Cold** — fetch inline once, populate both copies.
4. **Total failure** — stale if we have it, else `[]` (empty nav, but the page still
   renders — never a 500).

### Single‑refresh lock (no stampede)
When step (2) serves stale, you don't want every request across every instance firing
refresh jobs. `enqueue_refresh` (`page.rb:178`) takes a lock first:
```ruby
def self.enqueue_refresh(key)
  return unless acquire_refresh_lock(key)      # Redis SET NX — exactly one winner
  ContentfulLayoutCacheRefreshJob.perform_later(key)
end
```
- `acquire_refresh_lock` (`:187`) is `Rails.cache.write(…, unless_exist: true)` → an
  atomic **`SET NX`** in Redis. First caller wins; everyone else gets `false` and skips.
- Lock auto‑expires after `LAYOUT_REFRESH_LOCK_TTL` = **30 s**, and the job releases it
  in an `ensure` (`refresh_layout_collection!`, `page.rb:53`).
- Net: across the whole fleet, a stale nav triggers **exactly one** background refresh
  every ~30s.

### TTL jitter (`write_collection_caches`, `page.rb:170`)
```ruby
ttl_with_jitter = LAYOUT_CACHE_TTL + rand(15..75).seconds
```
Without jitter, every instance's fresh copy would expire at the same instant →
synchronized refresh spike ("thundering herd"). The random 15–75s spreads expiries out.

### 20‑second summary
> `navigation_items` is the header links (home's child pages). We keep a 5‑min *fresh*
> copy and a 30‑min *stale* copy in Redis. Normal requests hit fresh. When fresh
> expires we serve stale instantly and refresh in the background, with a Redis lock so
> only one instance refreshes. If Contentful is down we fall back to stale, then an
> empty list — the page never breaks. The footer works the same way.

---

## Background job — `ApplicationJob` & the refresh job

`app/jobs/application_job.rb`:
```ruby
class ApplicationJob < ActiveJob::Base
end
```
- The conventional base class for all jobs (the jobs equivalent of
  `ApplicationController` / `ApplicationRecord`).
- **New in this work** because the app had no background jobs before — the refresh job
  is the first one, so it needed a parent. Normally `rails generate job` scaffolds this;
  here it was added by hand.
- Empty on purpose — it's an extension point for cross‑cutting job config
  (`retry_on`, `discard_on`, etc.). Nothing shared is needed yet.

`app/jobs/contentful_layout_cache_refresh_job.rb` just calls
`Page.refresh_layout_collection!(key)`, which re‑fetches, rewrites both `fresh` +
`stale`, and releases the lock.

**Runtime reality:** no queue adapter is configured, so ActiveJob uses the Rails
default **`:async`** (an in‑process thread pool):
- No Sidekiq/Resque/worker to deploy. (The Redis here is the **cache**, *not* a job
  queue — don't conflate them.)
- Jobs are **best‑effort / ephemeral** — if the process restarts mid‑refresh the job is
  lost, which is fine: the cache just refreshes on the next request.
- In tests the adapter is `:test`, so `perform_later` only records the enqueue (doesn't
  run) — which is why specs assert `have_received(:perform_later)`.

---

## Cache invalidation

Contentful webhook → `app/controllers/hook_controller.rb:27`:
```ruby
Resource.reset_cache_key!(timestamp)
Page.reset_cache_key!(timestamp)
```
This bumps the cache‑key version (see [Versioned cache keys](#the-caching-concern--appmodelsconcernscachingrb)),
so every cached entry is effectively invalidated at once across all instances. This is
the "publish in the CMS → site updates" path.

---

## Deployment

The app reads exactly **one** variable: `ENV['REDIS_URL']`. It is **not** set manually:

```
redis.tf        → provisions azurerm_redis_cache.redis (Classic Premium, private endpoint)
local.tf  :32   → REDIS_URL = "rediss://:<urlencoded key>@<host>:<ssl_port>/0"
main.tf   :63   → webapp_app_settings = local.webapp_app_settings
webapp.tf :37   → app_settings = var.webapp_app_settings   (Azure App Service)
        ↓
Azure surfaces app settings as container env vars → ENV['REDIS_URL'] → production.rb
```

Set on both the main app and the staging slot. Added in #1170 (EYP‑264), on `main`.

**To confirm it's live** (not "add a var"):
```bash
az webapp config appsettings list -g <rg> -n <webapp> --query "[?name=='REDIS_URL'].name" -o tsv
```

> ⚠️ Because Redis failures are logged and swallowed, a broken connection looks like
> "no cache," not an error. Verify *positively* after deploy — look for `page:…` keys in
> Redis, or the absence of the `"Redis cache failure…"` warning in logs. The most likely
> failure point is the private‑endpoint DNS/route (the cache is
> `public_network_access_enabled = false`).

---

## Tests

The Rails **test env's default cache is `:null_store`** (`config/environments/test.rb:28`),
and unlike `production.rb` it does **not** read `REDIS_URL`. So the app's normal code path
under test doesn't use Redis — specs that want shared‑cache behaviour **explicitly swap
`Rails.cache`** in an `around` block.

- `spec/models/page_spec.rb` — shared‑cache `by_slug`, nav/footer stale fallback,
  resilience/circuit breaker. Swaps in a `MemoryStore` (no service needed).
- `spec/models/redis_caching_spec.rb` — swaps in a **real `RedisCacheStore`** and
  exercises the genuine Redis paths (cross‑instance marshaling, `INCR` circuit breaker,
  `SET NX` lock). Skips cleanly when Redis / Contentful are unavailable.
- `docker-compose.test.yml` — adds a `redis` service + `REDIS_URL`, so the Redis spec
  actually connects (rather than skipping) in CI/local.

So we *do* use a real Redis in the test run — but only inside `redis_caching_spec.rb` via
that deliberate store swap, not as the global test cache.

---

## Gotchas / future work

- **Thumbnail caching is a no‑op in Redis.** A `ContentfulModel::Asset` marshals on
  write but doesn't deserialize back, so `Page#thumbnail` silently re‑fetches. Harmless,
  but to make it actually cache we'd store the asset URL/id, not the object.
- **Redis failures are invisible by design** — logged, not raised. "Is it caching?" must
  be verified, not assumed.
- **Local Rails dev/test default to no shared cache** — `NullStore` means
  `shared_cache?` is false, so the app's normal path won't show Redis behaviour locally
  even though the test run provisions a `redis` service (only `redis_caching_spec.rb`
  uses it, via an explicit store swap). Hosted Azure envs (dev/staging/prod) all *do*
  use Redis.
- **Bridge infra** — `redis.tf` notes Classic Azure Cache is a stopgap (new creation
  blocked Oct 2026, tier retires 2028); migrate to Azure Managed Redis later.

---

## Quick file reference

| File | What to look at |
|------|-----------------|
| `config/environments/production.rb:61` | Redis vs memory store selection, error_handler, timeouts |
| `app/models/concerns/caching.rb` | the engine: `shared_cache?`, `fetch_or_store[_non_nil]`, versioned keys, resilience, circuit breaker |
| `app/models/page.rb:27` | `by_slug` (primary lookup) |
| `app/models/page.rb:38` `:150` | `navigation_items` + stale‑while‑revalidate |
| `app/models/page.rb:178` `:187` | background refresh + Redis lock |
| `app/models/resource.rb:10` | `by_name` (Resource twin of by_slug) |
| `app/jobs/contentful_layout_cache_refresh_job.rb` | the refresh job |
| `app/controllers/hook_controller.rb:27` | webhook → cache invalidation |
| `terraform-azure/redis.tf`, `local.tf:32` | provisioning + `REDIS_URL` injection |

### 5‑minute version
Open three files: `production.rb:61` (**where** the cache lives), `caching.rb` (the
**engine** — `shared_cache?`, `fetch_or_store_non_nil`, `with_contentful_resilience`),
and `page.rb:38` (`navigation_items` as the **showcase** of stale‑while‑revalidate).
That triangle tells the whole story.
