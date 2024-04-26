# Contentful

- [EY Reform Service](https://app.contentful.com/spaces/dvmeh832nmjc)
- [API Keys](https://app.contentful.com/spaces/dvmeh832nmjc/api/keys/) are granted access to new environments but targeting aliases is preferred.
- [User roles](https://app.contentful.com/spaces/dvmeh832nmjc/settings/users).

## Tasks

Contentful tasks are namespaced under `hfeyp:cms`, list them using `rake --tasks hfeyp:cms`.

Running these tasks requires a developer to have a `Contentful Management Access Token`.

[Management Tokens](https://app.contentful.com/spaces/dvmeh832nmjc/api/cma_tokens) offer [per-developer](https://app.contentful.com/account/profile/cma_tokens) write access.

1. Define Contentful entry models
  `rake hfeyp:cms:migrate`
2. Upload content from local database
  `rake hfeyp:cms:upload`

## Environments & aliases

[Environments](https://app.contentful.com/spaces/dvmeh832nmjc/settings/environments) are accessed via aliases.

The current tier is limited to 3 aliases and 4 environments:

| Alias     | Environment(s)          | Content                      | Usage                                  |
| ---       | ---                     | ---                          | ---                                    |
| `master`  | `production`            | Child development training   | Public                                 |
| `staging` | `production`            | "                            | Preview                                |
|           | `production-backup-xxx` | "                            | Archive                                |
| `test`    | `demo`                  | CMS and application training | CI pipeline and service knowledge base |
|           | `sandbox`               | Repurposed as required       | Experimentation                        |

CMS administrators can retarget an alias.

Published content in the aliased `demo` environment is used in automated testing and should be checked for accuracy before relying on results.

## Migrations

[Model migrations](https://github.com/contentful/contentful-migration/blob/master/README.md#reference-documentation) are defined in `./lib/cms/migrate`.

The [Merge](https://app.contentful.com/spaces/dvmeh832nmjc/environments/master/apps/app_installations/merge/) app is used to compare differences in models in different environments.

Developers can export JS migration files and update `test` to keep track with `master` as it evolves.

## Terminology

Information for onboarding content editors:

- `CMS`: Content Management System.
- `ERD`: Entity Relationship Diagram. (tbc in UML)
- `Space`: The Early Years Recovery content, team management, release schedule, mock data for application test, all exist within a space.
- `Alias`: Content in environments is accessed using aliases. The target an alias points to can be changed. We have access to three aliases.
- `Environment`: Content exists within an environment. We have access to four environments.
- `Content model`: The entities used to author entries. Used to define attributes, validations and control the editor interface. For example `Training Module`, `Question`
- `Content`: Instances of a content model. Used to create entries.
- `Master content`: The alias used by the public facing website which links to an environment. The environments this can point to can be named, cloned and destroyed by the content team.
- `Staging content`: An alias linking to an environment that can be used for testing, demoing. A potential use for this is when significant changes are made to models and code together.
- `Test content`: The alias used by the developer integration pipeline which links to the demo environment.
- `Demo content`: The environment linked to by the test alias containing a simplified abstraction of course content.
- `Integrity check`: An automated checklist to determine whether module content meets minimum standards.
- `Release`: A scheduled action that publishes a collection of content entries.
- `Launch`: The Contentful product that allows content editors to orchestrate a release.
- `Webhook`: A method of communication used by the CMS to alert a deployed environment that content has changed.
- `Cache`: An automatic snapshot of course content used to speed up pages in the browser.
- `Production deployment`: The public facing application using the current code and published content.
- `Staging deployment`: The latest code release candidate accessing draft content.
- `Development deployment`: The latest code accessing demo content. (currently standing in for production)
- `Review deployment`: A temporary deployment that can use either the Delivery or Preview APIs, demo or genuine content.
- `API`: Application Programming Interface.
- `Delivery API`: The mechanism that returns published content.
- `Preview API`: The mechanism that returns both published and draft content.
