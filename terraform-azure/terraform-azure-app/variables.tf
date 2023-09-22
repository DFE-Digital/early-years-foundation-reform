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

variable "app_worker_name" {
  description = "Name for the Application"
  type        = string
}

variable "container_name" {
  description = "Name for the Container"
  type        = string
}

variable "app_worker_subnet_id" {
  description = "ID of the delegated Subnet for the Application"
  type        = string
}

variable "app_worker_environment_variables" {
  description = "Environment Variables to expose to the Application"
  type        = map(string)
}

variable "app_worker_docker_registry" {
  description = "Docker Registry Server"
  type        = string
}

variable "app_worker_docker_image" {
  description = "Docker Image to deploy"
  type        = string
}

variable "app_worker_docker_image_tag" {
  description = "Tag for the Docker Image"
  type        = string
}

variable "app_worker_startup_command" {
  description = "Startup command to pass into the Application"
  type        = list(string)
}