![Deploy](https://github.com/DFE-Digital/govuk-rails-boilerplate/workflows/Deploy/badge.svg)

# What it is and what it is for

This project is really a tiny content management system for producing GOV.UK web sites.  

It was developed to create the [Help for Early Years Providers](https://help-for-early-years-providers.education.gov.uk/)
web site. The aim is to remove as many technical barriers as possible between editors and the public

Editors can create a set of nested pages, and edit the headings and content as 
[GovSpeak Markdown](https://github.com/alphagov/govspeak). It is much simpler to use than Wordpress or Contentful because there are only about five things
to learn about Govspeak.  

The CSS and SCSS styling and html structure is all taken from the [UK GOV Design System](https://design-system.service.gov.uk)
so pages will look like a typical government site.

The person editing pages does not have to learn anything about menus, styling or page layout.

Here are a couple of screenshots of typical pages

![An example page](docs/cms-view.png?raw=true "An example page")
<br/><br/><br/>
Its easy to add pictures, lists, headings, links, paragraphs and embedded to You Tube videos
<br/><br/><br/>
![An embedded video](docs/public-view-of-a-page.png?raw=true "An embedded video")


# Installing and running

This is a Ruby on Rails project that uses a Postgres database.

## Running locally
This assumes you have ruby 2.7.2 installed, and postgres.

```
# Clone the repository
git clone git@github.com:DFE-Digital/early-years-foundation-reform.git

bundle install

rake db:setup

rake db:seed
```

In one terminal run 
```
rails server
```
and in another terminal, run web packer, which serves assets
```
yarn

./bin/webpack-dev-server
```

Then open http://localhost:3000

## To deploy to a cloud server
Please read the documents in the ./documentation directory.

## How to add CMS content
The seed data gives some example of the markdown needed.   

Add a user in the rails console
```
rails console
u=User.new
u.email="somebody@somewhere.com"
u.password="oewrhourohawwieof"
u.save!
```

Visit http://localhost:3000/cms/pages and login using the new credential




## Run the tests

```
rspec
```

There are cucumber tests in ./e2etests, that test the specific content for the EYFS project, not the workings of the CMS editor pages

# Rubocop
Rubocop lints the code before each commit.  To run it,
```
rubocop
```

## Running in a Docker instance

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

### Authentication
Devise is used for the CMS routes.  Basic Auth can be turned on for the whole site by setting 
and environment variable called AUTH_ON_EVERYTHING.

The ContentController will then use the devise accounts to check the basic auth, but it does
not log users in.


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

### Documentation

Check out [documentation](/documentation) folder



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

## Cucumber Tests

### To run
- They can be run manually in IDE
- Command line
- Intention for these integration / e2e tests to run in AWS CI pipeline

#### IDE
Right click on 'Feature' and run 
Or 
Run - Edit Configurations (depending on IDE)

#### Command Line  
cucumber --color -r e2etestname.feature
 
#### AWS CI pipeline (Drone.yml configuration)
``` 
- Ruby E2E Tests
-   e2e-test:
-     group: ?
-     image: ruby:2.7.2
-     commands:
-       - cd e2etests
-       - gem install bundler
-       - bundle install
-       - cucumber --color -r features -p [insert env]
-     when:
-       trigger:
-         branch:
-           - tbc/*
-         event:
-           - push


## Antivirus

We use (clamav)[https://clamav.net] to scan files for viruses 
via a clamav-rest docker image. To create locally follow the
instructions on here:

https://github.com/niilo/clamav-rest

`docker run -p 9000:9000 --rm -it niilo/clamav-rest`

This will run a clamav-rest server at http://localhost:9000

