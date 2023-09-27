variable "environment" {
  description = "Environment to deploy resources"
  type        = string
}

variable "location" {
  description = "Name of the Azure region to deploy resources"
  type        = string
}

variable "resource_group" {
  description = "Name of the Azure Resource Group to deploy resources"
  type        = string
}

variable "resource_name_prefix" {
  description = "Prefix for resource names"
  type        = string
}

variable "as_service_principal_object_id" {
  description = "Object ID of the service principal for App Service"
  type        = string
  sensitive   = true
}

variable "asp_sku" {
  description = "SKU name for the App Service Plan"
  type        = string
}

variable "webapp_admin_email_address" {
  description = "Email Address of the Admin"
  type        = string
  sensitive   = true
}

variable "webapp_worker_count" {
  description = "Number of Workers for the App Service Plan"
  type        = string
}

variable "webapp_name" {
  description = "Name for the Web Application"
  type        = string
}

variable "webapp_subnet_id" {
  description = "ID of the delegated Subnet for the Web Application"
  type        = string
}

variable "webapp_app_settings" {
  description = "App Settings are exposed as environment variables"
  type        = map(string)
}

variable "webapp_docker_registry_url" {
  description = "URL to the Docker Registry"
  type        = string
}

variable "webapp_docker_image" {
  description = "Docker Image to deploy"
  type        = string
}

variable "webapp_docker_image_tag" {
  description = "Tag for the Docker Image"
  type        = string
}

variable "webapp_session_cookie_name" {
  description = "Name of the user session Cookie"
  type        = string
}

variable "webapp_health_check_path" {
  default     = null
  description = "Path to health check endpoint"
  type        = string
}

variable "webapp_health_check_eviction_time_in_min" {
  default     = null
  description = "Minutes before considering an instance unhealthy"
  type        = number
}

variable "webapp_custom_domain_name" {
  description = "Custom domain hostname"
  type        = string
}

variable "webapp_custom_domain_cert_secret_label" {
  description = "Label for the Certificate"
  type        = string
}

variable "webapp_startup_command" {
  default     = null
  description = "Startup command to pass into the Web Application"
  type        = string
}

variable "agw_subnet_id" {
  description = "ID of the Subnet for the App Gateway"
  type        = string
}

variable "agw_pip_id" {
  description = "ID of the Public IP address for the App Gateway"
  type        = string
}

variable "kv_id" {
  description = "ID of the Key Vault"
  type        = string
}

variable "kv_cert_secret_id" {
  description = "SSL certificate Secret ID"
  type        = string
}

variable "kv_mi_id" {
  description = "ID of the Managed Identity for the Key Vault"
  type        = string
}