# Demoing the Redis cache locally

A quick way to prove that the Redis caching actually
populates and is served from cache — without touching any deployed environment.

It works because `config/environments/development.rb` switches the cache store to
the real `:redis_cache_store` whenever `REDIS_URL` is set; otherwise local dev is
unchanged (null/memory store). See [`redis-caching.md`](redis-caching.md) for how the
caching itself works.

> Use a **local** Redis for this. The deployed (dev/staging/prod) caches sit behind a
> private endpoint and aren't reachable from local — that's expected. A throwaway
> local Redis behaves identically for demo purposes.

---

## Prerequisites

- Docker or Podman (for a throwaway Redis), or a Redis already running locally.
- `redis-cli` (ships with the `redis` package; or use `docker exec` into the container).
- `config/master.key` present (so Contentful is reachable and there's real data to cache).

---

## Setup

```bash
# 1. Start a throwaway Redis
docker run --rm -p 6379:6379 redis:7-alpine        # or: podman run --rm -p 6379:6379 redis:7-alpine

# 2. Point the app at it via .env (dotenv-rails loads this on boot)
echo 'REDIS_URL=redis://localhost:6379/0' >> .env

# 3. (Re)start the server so dotenv picks up the new value
bin/rails server
```

To confirm the app actually switched stores, in a console:

```bash
REDIS_URL=redis://localhost:6379/0 bin/rails runner 'puts Rails.cache.class'
# => ActiveSupport::Cache::RedisCacheStore
```

(If it prints `NullStore`/`MemoryStore`, `REDIS_URL` isn't set in the process — see
Troubleshooting.)

---

## The demo — watch it fill, then watch it serve from cache

Open a second terminal with a live view of every command Redis receives:

```bash
redis-cli monitor
```

Then run through this with the app:

| Step | Do this | What proves the point |
|------|---------|-----------------------|
| 1 | `redis-cli dbsize` | **0** — cache starts empty |
| 2 | Load the homepage / a tier page in the browser | `monitor` streams `SET page:home-…`, `SET page:navigation_items:fresh-…`, etc. — it's **filling** |
| 3 | `redis-cli keys '*'` | shows the populated keys (see below) |
| 4 | `redis-cli dbsize` | now **N** — it filled |
| 5 | **Reload the same page** | `monitor` now shows `GET`s, not `SET`s — it's **served from cache**, not re-fetched from Contentful (and the page renders faster) |
| 6 | `redis-cli ttl page:navigation_items:fresh-initial` | shows the ~5‑min fresh TTL (the stale‑while‑revalidate window) |

Empty → fills on first visit → reads on second visit *is* the proof it works.

### Keys you should see
```
page:cache_key                      # the cache-version pointer
page:home-initial                   # Page.by_slug('home')
page:areas-of-learning-initial      # other pages you visited
page:navigation_items:fresh-initial # header nav (fresh copy)
page:navigation_items:stale-initial # header nav (stale copy)
resource:…-initial                  # any Resource.by_name lookups
```

> Expected wrinkle: you'll see `thumbnail` keys get `SET` but their reads miss. A
> `ContentfulModel::Asset` marshals on write but doesn't deserialise back, so the
> thumbnail cache is a no‑op (it just re‑fetches). Everything else shows clean `GET`
> hits on the second load. This is documented as future work in `redis-caching.md`.

---

## Teardown

```bash
# stop using Redis locally — remove the line from .env and restart the server
# (then dev goes back to its normal null/memory store)
```
The `docker run --rm …` Redis disappears as soon as you stop it; nothing persists.

---

## Troubleshooting — "nothing is populating"

- **`Rails.cache` is NullStore/MemoryStore** → `REDIS_URL` isn't in the process. Did you
  restart the server after editing `.env`? dotenv only loads at boot.
- **Connection warnings in the Rails log, `dbsize` stays 0** → Redis isn't actually
  running on that host/port. `redis-cli ping` should return `PONG`. (The app won't crash
  if Redis is down — it logs and behaves like a cache miss.)
- **Keys appear but data looks empty / pages error** → Contentful isn't reachable. Check
  `config/master.key` is present so the CMS lookups return data to cache.
- **Only `thumbnail` keys miss on read** → expected (the asset no‑op above), not a bug.

---

## Proving it in a real environment (optional, pre-merge)

If you want it verified in an actual deployed env before merging, add the **`review`**
label to the PR — `azure-deploy-review.yml` deploys a review app with its own Redis.
Verify that one from **inside** the environment (App Service → SSH/Kudu console, which is
on the VNet and can reach the private Redis), e.g. a `rails runner` that reads back a
`page:*` key after you browse the review URL — not from your laptop.
