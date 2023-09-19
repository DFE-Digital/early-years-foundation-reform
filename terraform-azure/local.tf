locals {
  # Common tags to be assigned to resources
  common_tags = {
    "Environment"      = var.environment
    "Parent Business"  = "Children’s Care"
    "Portfolio"        = "Newly Onboarded"
    "Product"          = "Help for Early Years Providers"
    "Service"          = "Newly Onboarded"
    "Service Line"     = "Newly Onboarded"
    "Service Offering" = "Help for Early Years Providers"
  }

  # Web Application Configuration
  webapp_app_settings = {
    "ENVIRONMENT"                         = var.environment
    "DATABASE_URL"                        = var.webapp_database_url
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"
    "GOVUK_APP_DOMAIN"                    = "london.cloudapps.digital" #TODO: Remove this dependency post-migration to Azure
    "GOVUK_WEBSITE_ROOT"                  = "ey-reform-dev"            #TODO: Remove this dependency post-migration to Azure
    "BOT_TOKEN"                           = var.webapp_config_bot_token
    "CONTENTFUL_ENVIRONMENT"              = var.webapp_config_contentful_environment
    "CONTENTFUL_PREVIEW"                  = var.webapp_config_contentful_preview
    "DOMAIN"                              = var.webapp_config_domain
    "EDITOR"                              = var.webapp_config_editor
    "FEEDBACK_URL"                        = var.webapp_config_feedback_url
    "GROVER_NO_SANDBOX"                   = var.webapp_config_grover_no_sandbox
    "NODE_ENV"                            = var.webapp_config_node_env
    "RAILS_ENV"                           = var.webapp_config_rails_env
    "RAILS_LOG_TO_STDOUT"                 = var.webapp_config_rails_log_to_stdout
    "RAILS_MASTER_KEY"                    = var.webapp_config_rails_master_key
    "RAILS_MAX_THREADS"                   = var.webapp_config_rails_max_threads
    "RAILS_SERVE_STATIC_FILES"            = var.webapp_config_rails_serve_static_files
    "TRACKING_ID"                         = var.tracking_id
    "WEB_CONCURRENCY"                     = var.webapp_config_web_concurrency
    "WEBSITES_CONTAINER_START_TIME_LIMIT" = 1800
  }

  # Background Worker Application Configuration
  app_worker_environment_variables = {
    "DATABASE_URL"        = var.webapp_database_url
    "GOVUK_APP_DOMAIN"    = "localhost" #TODO: Remove this dependency post-migration to Azure
    "GOVUK_WEBSITE_ROOT"  = "www"       #TODO: Remove this dependency post-migration to Azure
    "GCS_CREDENTIALS"     = var.gcs_credentials
    "GOOGLE_CLOUD_BUCKET" = var.webapp_config_google_cloud_bucket
    "RAILS_ENV"           = var.webapp_config_rails_env
    "RAILS_LOG_TO_STDOUT" = var.webapp_config_rails_log_to_stdout
    "RAILS_MASTER_KEY"    = var.webapp_config_rails_master_key
  }

  # Review Application Configuration
  reviewapp_app_settings = {
    "ENVIRONMENT"                         = var.environment
    "DATABASE_URL"                        = var.webapp_database_url
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"
    "GOVUK_APP_DOMAIN"                    = "london.cloudapps.digital" #TODO: Remove this dependency post-migration to Azure
    "GOVUK_WEBSITE_ROOT"                  = "ey-reform-dev"            #TODO: Remove this dependency post-migration to Azure
    "BOT_TOKEN"                           = var.webapp_config_bot_token
    "CONTENTFUL_ENVIRONMENT"              = var.webapp_config_contentful_environment
    "DASHBOARD_UPDATE"                    = false
    "DOMAIN"                              = var.webapp_config_domain
    "EDITOR"                              = var.webapp_config_editor
    "FEEDBACK_URL"                        = var.webapp_config_feedback_url
    "GROVER_NO_SANDBOX"                   = var.webapp_config_grover_no_sandbox
    "NODE_ENV"                            = var.webapp_config_node_env
    "RAILS_ENV"                           = var.webapp_config_rails_env
    "RAILS_LOG_TO_STDOUT"                 = var.webapp_config_rails_log_to_stdout
    "RAILS_MASTER_KEY"                    = var.webapp_config_rails_master_key
    "RAILS_MAX_THREADS"                   = var.webapp_config_rails_max_threads
    "RAILS_SERVE_STATIC_FILES"            = var.webapp_config_rails_serve_static_files
    "WEB_CONCURRENCY"                     = var.webapp_config_web_concurrency
    "WEBSITES_CONTAINER_START_TIME_LIMIT" = 1800
  }
}
