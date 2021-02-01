terraform {
  required_providers {
    cloudfoundry = {
      source  = "cloudfoundry-community/cloudfoundry"
      version = "0.12.6"
    }
  }
}

provider cloudfoundry {
  api_url      = var.cf_api_url
  user         = var.cf_user != "" ? var.cf_user : null
  password     = var.cf_user_password != "" ? var.cf_user_password : null
  sso_passcode = var.cf_sso_passcode != "" ? var.cf_sso_passcode : null
}

# variables

variable "cf_api_url" {}

variable "cf_user" {}

variable "fc_user_password" {}

variable "sso_passcode" {}

variable "app_name" {}

variable "cf_space" {}

# data source

data cloudfoundry_org org {
  name = "dfe"
}

data cloudfoundry_space space {
  name = var.cf_space
  org  = data.cloudfoundry_org.org.id
}

data cloudfoundry_domain london_cloudapps_digital {
  name = "london.cloudapps.digital"
}

data cloudfoundary_app early_years_foundation_reform {
  name = var.app_name
  space = var.cf_space
}
