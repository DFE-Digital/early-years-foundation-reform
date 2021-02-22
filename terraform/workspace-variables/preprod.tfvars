# Platform
environment = "preprod"
app_environment = "preprod"

# Gov.UK PaaS
paas_api_url = "https://api.london.cloud.service.gov.uk"
paas_space_name = "eyfs-pre-prod"
paas_postgres_service_plan = "small-ha-11"
paas_app_start_timeout = "180"
paas_app_stopped = false
paas_postgres_create_timeout = "30m"
paas_web_app_deployment_strategy = "blue-green-v2"
paas_web_app_instances = 1
paas_web_app_memory = 512