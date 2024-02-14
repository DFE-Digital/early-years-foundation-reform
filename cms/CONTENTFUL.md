# Contentful

- [EY Recovery Service](https://app.contentful.com/spaces/dvmeh832nmjc)
- [API Keys](https://app.contentful.com/spaces/dvmeh832nmjc/api/keys/) are granted access to new environments but targeting aliases is preferred.
- [User roles](https://app.contentful.com/spaces/dvmeh832nmjc/settings/users).

### TrainingModule text fields

**upcoming** only used in `Future modules in this course`

- editor: multiline
- validations: No markdown by checking for new lines

**about** only used in the `About` pages

- editor: multiline
- validations: No markdown by checking for new lines

**description**

- editor: multiline
- validations: No markdown by checking for new lines

**outcomes** bullet-pointed list

- editor: markdown
- validations: None

**criteria** bullet-pointed list

- editor: markdown
- validations: None

## Tasks

Contentful tasks are namespaced under `eyfs:cms`, list them using `rake --tasks eyfs:cms`.

Running these tasks requires a developer to have a `Contentful Management Access Token`.

[Management Tokens](https://app.contentful.com/spaces/dvmeh832nmjc/api/cma_tokens) offer [per-developer](https://app.contentful.com/account/profile/cma_tokens) write access.


1. Define Contentful entry models
  `rake eyfs:cms:migrate`
2. Upload asset files to Contentful
  `rake eyfs:cms:seed_images`
3. Seed static pages from YAML
  `rake eyfs:cms:seed_static`
4. Seed course content from YAML
  `rake eyfs:cms:seed`
5. [Validate CMS content](https://github.com/DFE-Digital/early-years-foundation-recovery/actions/workflows/cms-validate.yml)
  `rake eyfs:cms:validate`
6. [Search CMS Question JSON fields](https://github.com/DFE-Digital/early-years-foundation-recovery/actions/workflows/cms-search.yml)
  `rake eyfs:cms:search`


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

For example, to preview experimental content or test model changes made within an environment called `sandbox` in the `ey-recovery-staging` deployment, `staging` can be made to point to `sandbox` requiring no developer intervention.

The Rails `development` and `test` env credentials define the `CONTENTFUL_ENVIRONMENT` as `test`.

The Rails `production` env credentials define the `CONTENTFUL_ENVIRONMENT` as `master`.

Published content in the aliased `demo` environment is used in automated testing and should be checked for accuracy before relying on results.

Draft content in `demo` is available in `ey-recovery-dev`.

## Migrations

[Model migrations](https://github.com/contentful/contentful-migration/blob/master/README.md#reference-documentation) are defined in `./cms/migrate`.

The [Merge](https://app.contentful.com/spaces/dvmeh832nmjc/environments/master/apps/app_installations/merge/) app is used to compare differences in models in different environments.

Developers can export JS migration files and update `test` to keep track with `master` as it evolves.

## Preview

We will use 3 [preview](https://app.contentful.com/spaces/dvmeh832nmjc/settings/content_preview) buttons.

**Local**

Used by developers when editing module content, usually demo content.

- **Page Resource**
  `http://localhost:3000/snippets/{entry.fields.name}`
- **Static Page**
  `http://localhost:3000/{entry.fields.name}`
- **Page**
  `http://localhost:3000/modules/{entry.linkedBy.fields.name}/content-pages/{entry.fields.name}`
- **Question**
  `http://localhost:3000/modules/{entry.linkedBy.fields.name}/questionnaires/{entry.fields.name}`
- **Video**
  `http://localhost:3000/modules/{entry.linkedBy.fields.name}/content-pages/{entry.fields.name}`
- **Training Module**
  `http://localhost:3000/modules/{entry.fields.name}`

**Development**

Used by developers when editing demo module content.

As above replace `http://localhost:3000` with `https://eyrecovery-dev.azurewebsites.net`

**Staging**

Used by content editors when editing genuine module content.

As above replace `http://localhost:3000` with `https://staging.child-development-training.education.gov.uk`


## Webhooks

**Common settings**

- Headers: Secret `BOT`
- Content type: `application/vnd.contentful.management.v1+json`
- Content length: enabled
- Payload: default

**1. Preview (all content)**

- Name: `Autosave content for Staging (preview)`
- Filters: `sys.environment.sys.id` equals `staging`
- URL: `POST` to `https://staging.child-development-training.education.gov.uk/change`
- Content events triggers: `Autosave` of `Entry` or `Asset`
- Other API events: N/A

**2. Release (training)**

- Name: `Release content for Production (delivery)`
- Filters: `sys.environment.sys.id` equals `master`
- URL: `POST` to `https://child-development-training.education.gov.uk/release`
- Content events triggers: N/A
- Other API events: `Release` action `Execute`

**3. Publish (non-training)**

- Name: `Publish stand-alone pages for Production (delivery)`
- Filters: `sys.environment.sys.id` equals `master` and `sys.contentType.sys.id` in `static` or `resource`
- URL: `POST` to `https://child-development-training.education.gov.uk/change`
- Content events triggers: `Publish` of `Entry` if `static`
- Other API events: N/A

**4. Developer integration and CMS training**

- Name: `Autosave demo training content for Dev (preview)`
- Filters: `sys.environment.sys.id` equals `test`
- URL: `POST` to `https://eyrecovery-dev.azurewebsites.net/change`
- Content events triggers: `Autosave` of `Entry` or `Asset`
- Other API events: N/A

## Validations

- https://www.contentful.com/developers/docs/references/content-management-api/#/reference/content-types/content-type
- https://contentful.com/help/available-validations/

## Interface

- https://www.contentful.com/developers/docs/extensibility/app-framework/editor-interfaces/


## Markup

Content designers can author text in markdown which is parsed using [govuk_markdown](https://github.com/DFE-Digital/govuk-markdown) which applies default frontend classes.

This service uses bespoke tags for customised components, including:

- Button links:
    `{button}[Continue](/path/to/page){/button}`
- External links:
    `{external}[Read more](https://example.com){/external}`
- User prompts:
    ```
    {quote}
    This is the quote

    This is the citation
    {/quote}
    ```

## Review

<http://localhost:3000/modules/alpha/structure>

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
