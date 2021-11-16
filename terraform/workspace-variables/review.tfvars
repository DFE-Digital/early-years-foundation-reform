# Platform
environment = "dev"
app_environment = "review"

# Gov.UK PaaS
paas_api_url = "https://api.london.cloud.service.gov.uk"
paas_space_name = "eyfs-dev"
paas_postgres_service_plan = "tiny-unencrypted-11"
paas_app_start_timeout = "360"
paas_app_stopped = false
paas_web_app_deployment_strategy = "blue-green-v2"
paas_web_app_instances = 1
paas_web_app_memory = 1024
paas_cms_app_start_command = "bundle exec rake db:prepare db:seed && bundle exec rails s  -b 0.0.0.0"
