# Platform
environment = "sandbox"
app_environment = "sandbox"

# Gov.UK PaaS
paas_api_url = "https://api.london.cloud.service.gov.uk"
paas_space_name = "eyfs-sandbox"
paas_postgres_service_plan = "small-11"
paas_app_start_timeout = "180"
paas_app_stopped = "false"
paas_postgres_create_timeout = "30m"
paas_web_app_deployment_strategy = "blue-green"
paas_web_app_instances = 1
paas_web_app_memory = 512
paas_cms_app_start_command = "bundle exec rake db:prepare"
