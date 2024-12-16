# Help For Early Years Providers

This is an application, written in Ruby on Rails (Version 7), based on the [DFE-Digital][rails-template] template. It uses a [Contentful](https://app.contentful.com/spaces/dvmeh832nmjc/) workspace for the content, managed by the content editors in the Help For Early Years Providers service.

Optionally create `.env` to override or set default variables.

## Dependencies

Ruby version `3.3.x`
Node version `20.18.x`
PostgreSQL version `13.1`
Yarn version `4.0.x`

Suggest using [asdf](asdf) for local development.

## Getting started

1. Clone the [repository](app-repo)
2. Obtain master key
3. Run `bundle install` to install the gem dependencies
4. Run `yarn` to install node dependencies
5. Copy the .env.development.example settings into the .env file
7. Run `bin/rails db:setup` to set up the database development and test schemas, and seed with test data
8. Run `bin/dev` to launch the app on http://localhost:3000

## Useful Links
- The Project Documentation is located within the EYFS Steady State team intranet 'site'
- [Production Environment][production]
- [Staging Environment][staging]
- [Prototype Repo][prototype-repo]
- [Deploy to Development](https://github.com/DFE-Digital/early-years-foundation-reform/actions)
- [Deploy to Staging](https://github.com/DFE-Digital/early-years-foundation-reform/actions)
- [Deploy to Production](https://github.com/DFE-Digital/early-years-foundation-reform/actions)

---

## Working locally

```sh
$ asdf plugin add ruby
$ asdf install ruby
$ asdf plugin add postgres
$ asdf install postgres
$ asdf plugin add nodejs
$ asdf install nodejs
```

**Development**

> Gemfile group :development

Use `bin/dev` to start the process workers (watching for changes to asset files).

**Testing**

> Gemfile group :test

Use `bin/rspec` to run the test suite under `/spec`.
Rails system specs use RackTest only for efficiency.

## Using Docker

There are a number of convenience scripts to make working with **Docker** easier.
All containers for the project are named with the prefix `reform_`.

- `bin/docker-build` creates tagged images for all the services
- `bin/docker-down` stops any active services
- `bin/docker-rails console` drops into a running development environment or starts one,
    containerised equivalent of `bin/rails console`
- `bin/docker-dev` starts `Procfile.dev`, containerised equivalent of `bin/dev`
- `bin/docker-rspec -f doc` runs the test suite with optional arguments, containerised
    equivalent of `bin/rspec`


## Credentials & Environment Variables

We use rails credentials to manage secrets; obtain the master key from the Dev team.

To edit:

```sh
$ EDITOR=vi bin/rails credentials:edit
```

Currently encrypts the following secrets:

```yml
secret_key_base:

contentful:
  environment: 
  space:
  delivery_access_token:
  preview_access_token:

user_password:
```

The contentful credentials can be overridden with environment variables:

```
CONTENTFUL_SPACE=
CONTENTFUL_ENVIRONMENT=
CONTENTFUL_DELIVERY_TOKEN=
CONTENTFUL_PREVIEW_TOKEN=
CONTENTFUL_MANAGEMENT_TOKEN=
```

The management token is not used in the application and each developer should have their own.  It is used to run the contentful migration and upload tasks.

## Deployment Pipelines

Visit the [Github Container Registry][ghcr].

[Development][development] is deployed automatically with the latest commit from `main`.

Individual branches may also be used as the source for the deployment, so you can set up the application to review a specific feature not yet merged with `main` branch.

[Staging][staging] is deployed from this [workflow][azure-deploy-stage].
[Production][production] is deployed from this [workflow][azure-deploy-prod].


## Azure

Console access:

- https://hfeyp-dev.scm.azurewebsites.net/webssh/host
- https://hfeyp-stage.scm.azurewebsites.net/webssh/host
- https://hfeyp-prod.scm.azurewebsites.net/webssh/host

## Monitoring

[Sentry][sentry] is used to monitor production environments

`$ brew install getsentry/tools/sentry-cli`

`$ sentry-cli projects list --org early-years-foundation-reform`

    +---------+--------------+-------------------------------+--------------+
    | ID      | Slug         | Team                          | Name         |
    +---------+--------------+-------------------------------+--------------+
    | 6274627 | eyf-reform   | early-years-foundation-reform | Rails        |
    | 6274651 | eyf-recovery | early-years-foundation-reform | eyf-recovery |
    +---------+--------------+-------------------------------+--------------+

## Hotjar

This project uses Hotjar for user insight. Hotjar records user journeys and
automatically redacts certain user information on recordings. All personally
identifiable information should be redacted. In order to override the default
settings the following classes can be added:

- `data-hj-suppress` to redact additional user information
- `data-hj-allow` to allow data that is automatically redacted

---

[app-repo]: https://github.com/DFE-Digital/early-years-foundation-reform
[asdf]: https://asdf-vm.com
[prototype-repo]: https://github.com/DFE-Digital/ey-hfeyp-prototype 
[rails-template]: https://github.com/DFE-Digital/rails-template
[ghcr]: https://ghcr.io/dfe-digital/help-for-early-years-providers 
[confluence]: https://dfedigital.atlassian.net/wiki/spaces/ER/overview
[sentry]: https://sentry.io/organizations/early-years-foundation-reform

<!-- Deployments -->

[prototype-repo]: https://github.com/DFE-Digital/ey-reform-prototype
[production]: https://help-for-early-years-providers.education.gov.uk
[staging]: https://staging.help-for-early-years-providers.education.gov.uk
[development]: https://hfeyp-dev.azurewebsites.net

<!-- GH workflows -->

[ci-workflow]: https://github.com/DFE-Digital/early-years-foundation-reform/actions/workflows/test.yml
[production-workflow]: https://github.com/DFE-Digital/early-years-foundation-reform/actions/workflows/azure-deploy-prod.yml
[staging-workflow]: https://github.com/DFE-Digital/early-years-foundation-reform/actions/workflows/azure-deploy-stage.yml
