terraform {
  required_version = "~> 0.14.5"
  required_providers {
    cloudfoundry = {
      source  = "cloudfoundry-community/cloudfoundry"
      version = "0.13.0"
    }
  }
}

provider "cloudfoundry" {
  api_url      = var.cf_api_url
  user         = var.cf_user != "" ? var.cf_user : null
  password     = var.cf_user_password != "" ? var.cf_user_password : null
  sso_passcode = var.cf_sso_passcode != "" ? var.cf_sso_passcode : null
}

resource "cloudfoundry_app" "web_app" {
  name                       = local.web_app_name
  command                    = local.web_app_start_command
  docker_image               = var.app_docker_image
  health_check_type          = "http"
  health_check_http_endpoint = "/ping"
  instances                  = var.web_app_instances
  memory                     = var.web_app_memory
  space                      = data.cloudfoundry_space.space.id
  strategy                   = "blue-green-v2"
  timeout                    = 180
  service_binding {
    service_instance = cloudfoundry_service_instance.postgres.id
  }
}
data "cloudfoundry_service" "postgres" {
  name = "postgres"
}

resource "cloudfoundry_service_instance" "postgres" {
  name         = local.postgres_service_name
  space        = data.cloudfoundry_space.space.id
  service_plan = "small-9.5"
}

# variables

variable "cf_api_url" {}

variable "cf_user" {}

variable "cf_user_password" {}

variable "cf_sso_passcode" {}

variable "app_name" {}

variable "cf_space" {}

variable "app_docker_image" {}

variable "web_app_instances" { default = 1 }

variable "web_app_memory" { default = 512 }

# local variables

locals {
  web_app_name          = "${var.cf_space}-app"
  web_app_start_command = "bundle exec rails server -b 0.0.0.0"
  postgres_service_name = "${var.cf_space}-postgres"
}

# data source

data "cloudfoundry_org" "org" {
  name = "dfe"
}

data "cloudfoundry_space" "space" {
  name = var.cf_space
  org  = data.cloudfoundry_org.org.id
}

data "cloudfoundry_domain" "london_cloudapps_digital" {
  name = "london.cloudapps.digital"
}
