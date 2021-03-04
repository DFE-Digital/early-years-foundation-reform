## Debugging in GovPaaS
There situations in the dev environment where it would be useful to see server logs, have database access, or rails console access.
This should not be used in other environments.

### Setup
The following assumed you have the cloudfoundry CLI set up on your machine, and have logged in.
When you log in, you should select the dev space. Instructions can be found [here](https://docs.cloud.service.gov.uk/get_started.html#set-up-the-cloud-foundry-command-line)

### View logs
To view logs, you will first need to know the service name. `cf a` will list services, but the service name will probably be `eyfs-dev`.

To view recent logs:

```cf logs --recent <app_name>```

To tail logs (view them as they are generated)

```cf logs <app_name>```

### Get access to the database
You will need to have the `psql` command on your path for this to work.

The first time you try this, you will need to install the conduit plugin:

`cf install-plugin conduit`

You can list the services with `cf s`, but the service name will generally be `eyfs-postgres-dev`. For interactive access, use:

`cf conduit eyfs-postgres-dev -- psql`

### Rails console
First, ssh into the host instance

`cf ssh <app_name>`

Then,

`cd /app`

and finally

`/usr/local/bin/bundle exec rails console`

### ssh connect to PaaS

Make sure you have been added to the PasS services list for the app:

Which you can do by messaging the channel #digital-tools-support and requesting access

We are using docker for deployment not a standard build pack

Install the cloud foundry CLI https://github.com/cloudfoundry/cli/wiki/V7-CLI-Installation-Guide

On a Mac this is:

`brew install cloudfoundry/tap/cf-cli@7`

Connecting to test server

`cf login`

and enter the the following:

- API endpoint: https://api.london.cloud.service.gov.uk
- Email: <youremailaddedtopaas>
- Password: <asecretthing>

If you have access to multiple spaces, select one to be the target:

e.g.

1. eyfs-dev
1. eyfs-pre-prod
1. eyfs-test
1. eyfs-production

To verify you have targeted the correct space:

`cf target`

Ssh connection:

`cf ssh -i 0 <spacename>`

To inspect logs

`cf logs --recent <spacename>`
