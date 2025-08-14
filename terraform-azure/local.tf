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
    "CONTENTFUL_ENVIRONMENT"              = var.environment
    "CONTENTFUL_PREVIEW"                  = var.environment == "staging" ? "true" : "false"
    "ENVIRONMENT"                         = var.environment
    "DATABASE_URL"                        = var.webapp_database_url
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"
    "DOMAIN"                              = var.webapp_config_domain
    "FEEDBACK_URL"                        = var.webapp_config_feedback_url
    "PRIVACY_POLICY_URL"                  = var.webapp_config_privacy_policy_url
    "NODE_ENV"                            = var.webapp_config_node_env
    "RAILS_ENV"                           = var.webapp_config_rails_env
    "RAILS_LOG_TO_STDOUT"                 = var.webapp_config_rails_log_to_stdout
    "RAILS_MASTER_KEY"                    = var.webapp_config_rails_master_key
    "RAILS_MAX_THREADS"                   = var.webapp_config_rails_max_threads
    "RAILS_SERVE_STATIC_FILES"            = var.webapp_config_rails_serve_static_files
    "SENTRY_DSN"                          = var.webapp_config_sentry_dsn
    "TRACKING_ID"                         = var.tracking_id
    "WEB_CONCURRENCY"                     = var.webapp_config_web_concurrency
    "WEBSITES_CONTAINER_START_TIME_LIMIT" = 1800
  }

  webapp_slot_app_settings = {
    "ENVIRONMENT"                         = var.environment
    "DATABASE_URL"                        = var.webapp_slot_database_url
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"
    "DOMAIN"                              = var.webapp_config_domain
    "FEEDBACK_URL"                        = var.webapp_config_feedback_url
    "PRIVACY_POLICY_URL"                  = var.webapp_config_privacy_policy_url
    "NODE_ENV"                            = var.webapp_config_node_env
    "RAILS_ENV"                           = var.webapp_config_rails_env
    "RAILS_LOG_TO_STDOUT"                 = var.webapp_config_rails_log_to_stdout
    "RAILS_MASTER_KEY"                    = var.webapp_config_rails_master_key
    "RAILS_MAX_THREADS"                   = var.webapp_config_rails_max_threads
    "RAILS_SERVE_STATIC_FILES"            = var.webapp_config_rails_serve_static_files
    "SENTRY_DSN"                          = var.webapp_config_sentry_dsn
    "TRACKING_ID"                         = var.tracking_id
    "WEB_CONCURRENCY"                     = var.webapp_config_web_concurrency
    "WEBSITES_CONTAINER_START_TIME_LIMIT" = 1800
  }
}
