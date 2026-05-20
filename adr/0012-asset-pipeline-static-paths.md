# Serve govuk-frontend assets statically and disable runtime asset compilation

* Status: accepted

## Context and Problem Statement

Production had `config.assets.compile = true` from day one, with a comment
explaining why: *"govuk css contains fixed paths to assets without digests"*.
Compiling at request time is inefficient and expensive, but it was
the quickest way to get things working and never got revisited.

The hardcoded `/assets/...` URLs in the compiled CSS come from three places:

* `govuk-frontend`'s `$govuk-assets-path` (default `/assets/`), used for fonts
  and crest images;
* an inline `content: url(/assets/dfe-logo-alt.png)` in `header.scss`;
* a relative `url('icon-print@1x.png')` in `print.scss`.

## Decision Drivers

* Stop using `config.assets.compile = true` in production.
* Keep govuk-frontend upgrades to a `yarn upgrade`.
* Keep digests on `application.css`/`application.js`.
* No new asset host or CDN — keep serving from the Rails app on App Service.

## Considered Options

* **Status quo.** Not chosen.
* **Override `$govuk-assets-path` and serve govuk assets from `public/`.**
  Chosen.

## Decision Outcome

Override `$govuk-assets-path` to `/govuk-assets/` and have `yarn` postinstall
copy govuk-frontend's fonts and images there; the filenames already embed a
content hash so cache-busting still works on upgrade. The two CSS only app
images move to `public/static-images/` and are referenced as `/static-images/...`
from `header.scss` and `print.scss`. The Dockerfile carries
`public/govuk-assets` from the deps stage into the runtime image, and
`RAILS_SERVE_STATIC_FILES` being set to true serves the lot. Sprockets still 
fingerprints everything else, and `config.assets.compile = false` in production.
