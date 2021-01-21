![Deploy](https://github.com/DFE-Digital/govuk-rails-boilerplate/workflows/Deploy/badge.svg)

# Tim's secret Spike

## Getting started on Docker

On Mac OS, [Docker Desktop / Docker for Mac](https://docs.docker.com/docker-for-mac/install/)
will need to be installed first

Setup a `.env` file to hold environment variables and fill in the missing values
(do not commit this file)

`cp .env.example .env`

NOTE: Ensure no instances of PostgreSQL are running in the background as this can cause conflicts when attempting to run the docker instance of PostgreSQL
If PostgreSQL was installed using homebrew, in the terminal use:
1. `brew services` - to check for any running instances,
2. `brew services stop postgres`

Add the following lines at the end of the `docker-compose.yml` file (if not already present):

`environment:`
      `POSTGRES_PASSWORD: [REPLACE WITH THE DATABASE_PASSWORD IN .env FILE]`

To run the application locally with docker:

`docker-compose build && docker-compose up`

To setup the database running in a docker container:

`docker-compose exec app bundle exec rake db:setup`
`docker-compose exec app bundle exec rake db:migrate`

If there are issues with postgres password authentication failure:

`> FATAL:  password authentication failed for user "boilerplate_user"`

You can manually set a password for the user `boilerplate_user` by following these steps:

1. `docker-compose exec database psql -d postgres -U boilerplate_user`
2. in the postgres cli run `\password`
3. set the `DATABASE_PASSWORD` from `.env`

## Styling pages

See [this guide](https://design-system.service.gov.uk/get-started/) for
advice about how to layout html


# The following is from the template repository GOV.UK Rails Boilerplate

## Prerequisites

- Ruby 2.7.1
- PostgreSQL
- NodeJS 12.13.x
- Yarn 1.12.x

## Setting up the app in development

1. Run `bundle install` to install the gem dependencies
2. Run `yarn` to install node dependencies
3. Run `bin/rails db:setup` to set up the database development and test schemas, and seed with test data
4. Run `bundle exec rails server` to launch the app on http://localhost:3000
5. Run `./bin/webpack-dev-server` in a separate shell for faster compilation of assets

## Whats included in this boilerplate?

- Rails 6.0 with Webpacker
- [GOV.UK Frontend](https://github.com/alphagov/govuk-frontend)
- RSpec
- Dotenv (managing environment variables)
- Travis with Heroku deployment

## Running specs, linter(without auto correct) and annotate models and serializers
```
bundle exec rake
```

## Running specs
```
bundle exec rspec
```

## Linting

It's best to lint just your app directories and not those belonging to the framework, e.g.

```bash
bundle exec rubocop app config db lib spec Gemfile --format clang -a

or

bundle exec scss-lint app/webpacker/styles
```

## Deploying on GOV.UK PaaS

### Prerequisites

- Your department, agency or team has a GOV.UK PaaS account
- You have a personal account granted by your organisation manager
- You have downloaded and installed the [Cloud Foundry CLI](https://github.com/cloudfoundry/cli#downloads) for your platform

### Deploy

1. Run `cf login -a api.london.cloud.service.gov.uk -u USERNAME`, `USERNAME` is your personal GOV.UK PaaS account email address
2. Run `bundle package --all` to vendor ruby dependencies
3. Run `yarn` to vendor node dependencies
4. Run `bundle exec rails webpacker:compile` to compile assets
5. Run `cf push` to push the app to Cloud Foundry Application Runtime

Check the file `manifest.yml` for customisation of name (you may need to change it as there could be a conflict on that name), buildpacks and eventual services (PostgreSQL needs to be [set up](https://docs.cloud.service.gov.uk/deploying_services/postgresql/)).

The app should be available at https://govuk-rails-boilerplate.london.cloudapps.digital
