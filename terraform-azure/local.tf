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
    "GOVUK_WEBSITE_ROOT"                  = "eyfs-dev"                 #TODO: Remove this dependency post-migration to Azure
    "DOMAIN"                              = var.webapp_config_domain
    "FEEDBACK_URL"                        = var.webapp_config_feedback_url
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

  webapp_slot_app_settings = {
    "ENVIRONMENT"                         = var.environment
    "DATABASE_URL"                        = var.webapp_slot_database_url
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"
    "GOVUK_APP_DOMAIN"                    = "london.cloudapps.digital" #TODO: Remove this dependency post-migration to Azure
    "GOVUK_WEBSITE_ROOT"                  = "ey-recovery-dev"          #TODO: Remove this dependency post-migration to Azure
    "DOMAIN"                              = var.webapp_config_domain
    "FEEDBACK_URL"                        = var.webapp_config_feedback_url
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
}
