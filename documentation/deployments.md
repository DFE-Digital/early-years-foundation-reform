### Deployment

Github workflow is used to deploy to environments on Gov.uk PaaS.

Upon merging a PR to `main` a deployment to the development environment will be triggered. This will:

1. Checkout the branch
1. Login to Docker Hub
1. Build docker image
1. Upload docker image to Docker Hub
1. Initialise Terraform
1. Run the Terraform plan
1. Apply the Terraform changes

### PaaS

Some useful things to know about PaaS...

GOV.UK Platform as a Service (PaaS) is a cloud-hosting platform built by the Government Digital Service (GDS). GOV.UK PaaS manages the deployment of your apps, services and background tasks so you don’t need to hire people with specialist cloud skills.

GOV.UK PaaS uses the open source Cloud Foundry project, and runs on Amazon Web Services.

This repo has an organisation setup on PaaS. Speak to the org manager to authorise the [creation of a personal account](https://docs.cloud.service.gov.uk/get_started.html#get-started)

The Cloud Coundry CLI can be used to manage apps hosted on PaaS - [Setup Cloud Foundry CLI](https://docs.cloud.service.gov.uk/get_started.html#set-up-the-cloud-foundry-command-line)

### Environments

This application runs through four environments:

- dev
- test
- pre prod
- prod

`dev` is deployed to automatically when a PR is merged into the `main` branch.

`test`, `pre prod` and `prod` deployments are triggered manually from the Github workflow tab

Each environment has a dedicated PaaS user account to run CI/CD jobs using Github workflows.

To find out the user account details, contact the org manager.


### Github Actions

Actions are standalone commands that are combined into steps to create a job.

Workflows are made up of one or more jobs and can be scheduled or triggered by an event. The workflow is used to build, test, package, release, and deploy the application.


[This repo has the following actions](https://github.com/DFE-Digital/early-years-foundation-reform/actions):

- Build: This builds the Docker image
- Test: Runs RSpec
- Rubocop: Runs Rubocop
- Deploy to Dev: Automatically triggers the 'Deploy to Environment' workflow when a PR is merged to `main`
- Deploy to Test: Manual deployment trigger. Choose a a branch and that will trigger the 'Deploy to Environment' workflow
- Deploy to Pre Prod: Manual deployment trigger. Choose a a branch and that will trigger the 'Deploy to Environment' workflow
- Deploy to Production: Manual deployment trigger. Choose a a branch and that will trigger the 'Deploy to Environment' workflow
- Deploy to Environment: Triggered by one of the above workflows. This is a generic workflow that accepts a target environment and git ref to checkout the code, build the docker image and deploy to the target environment.


### Seed data

[Seed data is destroyed](../db/seeds.rb) and recreated in `dev`, `test` and `pre prod` environments.

`prod` does not get seeded with data automatically.

### Environment variables

The application requires the following environment variables to deploy to an environment:

- TF_VAR_paas_app_docker_image
- TF_VAR_paas_user
- TF_VAR_paas_password
- AWS_ACCESS_KEY_ID
- AWS_SECRET_ACCESS_KEY

They are stored in github secrets and consumed by the deploy jobs.

### Databases

The application is backed by a [PostgreSQL database hosted on PaaS](https://docs.cloud.service.gov.uk/deploying_services/postgresql/#postgresql).

The Conduit plugin on Cloud Foundry can be used [to connect to a PostgreSQL database from your local machine](https://docs.cloud.service.gov.uk/deploying_services/postgresql/#connect-to-a-postgresql-service-from-your-local-machine)

If you don't want to use Conduit, you can [connect to a backing service via an SSH tunnel from your local machine](https://docs.cloud.service.gov.uk/managing_apps.html#connecting-to-a-non-publicly-available-backing-service). You might want to do this is to access the Postgres via a GUI for example.

### Managing apps

PaaS hosted applications are run in a container. [Connecting using SSH](https://docs.cloud.service.gov.uk/managing_apps.html#connecting-with-ssh) gives you secure access to the applications container.

### Some thigns to be aware of... querks

1. Read only DB mapping to the website (FYI)

The following command has been run on the CF CLI to restricts the website
app to read only permissions of the Postgres instance

```
cf bind-service eyfs-ENV eyfs-postgres-ENV -c '{"read_only": true}'
```

This has been set on each environment because it can not be done using Terraform.

Note: When deploying to a new space or recreating the environment from scratch, this is a required
manual step


2. DNS remapping in production

On deploy to production, the DNS mapping is lost, meaning to the domain will 404.
The the DNS route needs to be remapped to the domain again.
Running the following using CF CLI will set the domain again.

```
cf target -s eyfs-prod
cf map-route eyfs-prod education.gov.uk --hostname help-for-early-years-providers
```

After deployment to production, this is run as part of the deploy task, no manual intervention required.

### Documentation cross reference

Lots of how the infrastructure is created for this project has been made ontop of the shoulders of the Become a teacher team (BAT)
They have more comprehensive documentation that shouldn't be repeated but referenced for completness

- [BAT Gov.uk PaaS](https://dfedigital.atlassian.net/wiki/spaces/BaT/pages/1905066044/Gov.uk+PaaS)
- [BAT Github Actions](https://dfedigital.atlassian.net/wiki/spaces/BaT/pages/1649672271/Github+Actions)
- [DockerHub](https://dfedigital.atlassian.net/wiki/spaces/BaT/pages/1602650124/DockerHub)
- [DNS](https://dfedigital.atlassian.net/wiki/spaces/BaT/pages/1905262678/DNS)
- [Custom Domain setup](https://dfedigital.atlassian.net/wiki/spaces/BaT/pages/2012938241/Create+a+custom+domain)
- [Terraform](https://dfedigital.atlassian.net/wiki/spaces/BaT/pages/1935179870/Terraform)
