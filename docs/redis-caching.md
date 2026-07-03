# Redis caching & Contentful resilience

A walkthrough for devs. The site is a thin read layer over Contentful (the CMS);
Contentful is slow and occasionally flaky. This work caches Contentful content
**across app instances** in Redis, and makes the CMS calls **resilient** so a
Contentful blip never takes the site down.

> Want to see it populate on your machine? See
> [`redis-local-demo.md`](redis-local-demo.md).

---

## The one thing to understand first

**We cache the raw Contentful API *responses* (JSON), not the deserialized objects.**

`ContentfulModel` objects (`Page`, `Resource`, `Asset`) hold a live client and lazily
resolve their fields, so they do **not** survive `Marshal` → Redis → unmarshal — you
get back an object with `nil` fields. So we cache one level lower: the raw JSON the
Contentful API returns is just a String, which Redis stores perfectly, and the gem
rebuilds fresh, fully‑working objects from it on every cache hit.

This mirrors the sibling service
[check-an-early-years-qualification](https://github.com/DFE-Digital/check-an-early-years-qualification),
which caches Contentful responses the same way (at the HTTP layer).

---

## The layers

```
Controller / View
      │
   Page / Resource models            in-process object memo (per process, dry-core)
      │                               — avoids re-deserialising within one process
   Contentful gem
      │
   get_http  ◄── ContentfulResponseCache  ─►  Redis: raw JSON responses (cross-instance)
      │
   Contentful API
```

Plus two pieces of shared coordination state in Redis:
- the **`cache_key` version pointer** — bumped by a CMS webhook to invalidate everything;
- the **circuit‑breaker** state — shared so all instances back off together.

---

## 1. The response cache — `config/initializers/contentful_response_cache.rb`

Prepends onto `Contentful::Client.get_http` (the gem's stateless HTTP method):

- key = request URL + query, namespaced by `Page.cache_key` (the content version).
- **miss** → call Contentful, store the raw response (`status`, body, `Content-Encoding`)
  in Redis, return it.
- **hit** → rebuild a minimal response object from the cached bytes; the gem
  deserialises it into fresh objects exactly as if it came from the API.
- Only caches **delivery** (`cdn.contentful.com`) GETs, only `200`s, only when a real
  shared cache is configured (so dev/test on `NullStore` are unchanged). Read/write
  failures are swallowed — Redis is an optimisation, never a hard dependency.

This is the cross‑instance content cache. It covers everything that hits the delivery
API — pages, resources, assets, collections — uniformly.

## 2. In-process object memo — `app/models/concerns/caching.rb`

`fetch_or_store` / `fetch_or_store_non_nil` memoize objects **in the process** (dry-core),
so repeated `by_slug('home')` within one request/process don't re-deserialise. These are
**not** stored in Redis (objects don't marshal). `_non_nil` never memoizes a nil, so a
transient failure is retried next call. The key includes `cache_key`, so a webhook bump
rolls the in-process namespace too.

## 3. Resilience — `with_contentful_resilience` (`caching.rb`)

Wraps each Contentful call with:
- **retries** with exponential backoff + jitter on timeout / 5xx / 429 (honours `Retry-After`);
- a **circuit breaker** whose state lives in Redis (`INCR` a failure counter; after
  `CIRCUIT_FAILURE_THRESHOLD` failures within `CIRCUIT_OPEN_DURATION` the circuit opens and
  calls fail fast with `CIRCUIT_BREAKER_ERROR`). Because it's in Redis, **all instances
  cooperate** — one instance's failures protect the fleet.

Callers always rescue and degrade (`nil`, `[]`) — never raise to the user.

## 4. Versioned invalidation — `cache_key` / `reset_cache_key!`

Every cache key (HTTP response cache and in-process memo) is namespaced with a shared
version string held in Redis. A Contentful webhook → `hook_controller` →
`Page.reset_cache_key!` / `Resource.reset_cache_key!` bumps it, so **every instance**
rolls over to fresh content at once. (`config/environments/production.rb:61` picks
`:redis_cache_store` when `REDIS_URL` is set, else `:memory_store`.)

---

## Where the models use it

- `Page.by_slug` (`app/models/page.rb`) / `Resource.by_name` — in-process memo +
  resilience; the underlying API call is response‑cached in Redis.
- `Page.navigation_items` / `footer_items` — `layout_collection`: in-process memoized list
  + resilience; never memoizes an empty result, so the nav can't get stuck empty after a blip.
- `Page#thumbnail` — same shape for the asset.

---

## Tests

- `spec/initializers/contentful_response_cache_spec.rb` — the response cache: caches raw
  responses, reconstructs status/body/encoding, rolls on `cache_key` change, skips
  non‑200 / non‑delivery, no-ops without a shared cache.
- `spec/models/redis_caching_spec.rb` — the circuit breaker against a **real Redis**
  (`INCR`, cross‑instance), skips when `REDIS_URL` is absent.
- `spec/models/page_spec.rb` — `by_slug` in-process memo, nav/footer resilience,
  `with_contentful_resilience` retries/breaker.
- `.github/workflows/test.yml` runs a `redis` service so the real‑Redis spec runs in CI.

---

## Gotchas

- **Don't cache `ContentfulModel` objects in Redis.** They don't survive marshalling —
  cache responses (this design) or rendered HTML, never the live objects. (This is the bug
  the earlier version hit: cached pages came back with `nil` bodies.)
- **Redis failures are invisible by design** — logged, not raised. Verify caching is live
  positively (look for `contentful:resp:*` keys), don't assume.
- **Dev/test default to no shared cache** (`NullStore`), so you won't see Redis behaviour
  locally without `REDIS_URL`. Hosted Azure envs all use Redis.
