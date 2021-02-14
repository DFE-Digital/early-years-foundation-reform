![Deploy](https://github.com/DFE-Digital/govuk-rails-boilerplate/workflows/Deploy/badge.svg)

# Early Years Reform Framework

This is a minimalistic content management system, written in Ruby on Rails
for use by content editors in the Early Years Reform Framework project.

It allows editors to create a set of nested pages, and to edit the headings,
overview and content as [Markdown](https://en.wikipedia.org/wiki/Markdown).

These are some examples of the cut down CMS and two resulting pages
all in UK.GOV style

![The CMS view](docs/cms-view.png?raw=true "The CMS view"seed)
![Example page](docs/public-view-of-a-page.png?raw=true "Example page")
![Landing Page](docs/landing-page-view.png?raw=true "Landing Page")

## Prerequisites

Ruby version `2.7.2`

Node version `14.x.x`
## Getting started on Docker

On Mac OS, [Docker Desktop / Docker for Mac](https://docs.docker.com/docker-for-mac/install/)
will need to be installed first and running

Setup a `.env` file to hold environment variables and fill in the missing values
(do not commit this file)

`cp .env.example .env`

add development database to .env: govuk_rails_boilerplate_development

### To run the application locally with docker:

NOTE: Ensure no instances of PostgreSQL are running in the background as this can cause conflicts when attempting to run the docker instance of PostgreSQL
If PostgreSQL was installed using homebrew, in the terminal use:
1. `brew services` - to check for any running instances,
2. `brew services stop postgres`

To run the application locally with docker:

`docker-compose build && docker-compose up`

If docker has been setup correctly, running `sudo docker ps`, you should see 2 containers running like this:

```
CONTAINER ID   IMAGE                   COMMAND                  CREATED       STATUS         PORTS                    NAMES
005b86d0b4dc   eyfs-reform-spike_app   "./entrypoints/docke…"   5 hours ago   Up 5 minutes   0.0.0.0:3000->3000/tcp   eyfs-reform-spike_app_1
460c5fe17d37   postgres:13.1           "docker-entrypoint.s…"   5 hours ago   Up 5 minutes   0.0.0.0:5432->5432/tcp   eyfs-reform-spike_database_1
```

### To setup the database running in a docker container (runs terminal command inside of your docker container):

`docker-compose exec app bundle exec rake db:setup`
`docker-compose exec app bundle exec rake db:migrate`
`docker-compose exec app bundle exec rake db:seed`

### To restart the server

cancel the running docker process and then run `docker-compose down` (for a full reset on your environment)

### To connect to the docker container and run commands

`docker exec -it eyfs-reform-spike_app_1 sh`

### If there are issues with postgres password authentication failure:

`> FATAL:  password authentication failed for user "boilerplate_user"`

You can manually set a password for the user `boilerplate_user` by following these steps:

1. `docker-compose exec database psql -d postgres -U boilerplate_user`
2. in the postgres cli run `\password`
3. set the `DATABASE_PASSWORD` from `.env`

## Styling pages

See [this guide](https://design-system.service.gov.uk/get-started/) for
advice about how to layout html

## CI/CD

When a branch is merged into `main`

- a docker image is built and pushed to [DockerHub](https://hub.docker.com/repository/docker/dfedigital/eyfsreform)


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

Vscode - Rubocop has a vscode extension, linting may need to be turned on

## Using Amazon S3 Bucket for asset storage (e.g. in production)

Ensure you have added 4 parameters to the .env file, these are (ACCESS_KEY_ID, SECRET_ACCESS_KEY, REGION, BUCKET) e.g:

```
ACCESS_KEY_ID=7867867687
SECRET_ACCESS_KEY=876876876
REGION=eu-west-2
BUCKET=eyfsreformspike

```

These 4 parameters will be picked up by the Amazon config setting in config/storage.yml
You can obtain the access key ID and secret access key as a download from the AWS account
Region should be eu-west-2 (London)
You must create the parent bucket in AWS first and then add this bucket name to the final parameter(line)
Do not encapsulate the strings

Ensure that the appropriate environment file (e.g. environments/production.rb) has been set to use Amazon as storage service:

```
config.active_storage.service = :amazon
```

Note: Docker can't be used to connect to AWS

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

