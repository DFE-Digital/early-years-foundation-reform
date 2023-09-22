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

variable "psqlfs_subnet_id" {
  description = "ID of the delegated Subnet for the Database Server"
  type        = string
}

variable "psqlfs_dns_zone_id" {
  description = "ID of the Private DNS Zone for the Database Server"
  type        = string
}

variable "psqlfs_sku" {
  description = "SKU name for the Database Server"
  type        = string
}

variable "psqlfs_storage" {
  description = "Max storage allowed for the Database Server"
  type        = number
}

variable "psqlfs_username" {
  description = "Username of the Database Server"
  type        = string
  sensitive   = true
}

variable "psqlfs_password" {
  description = "Password of the Database Server"
  type        = string
  sensitive   = true
}

variable "psqlfs_geo_redundant_backup" {
  description = "Geo-redundant backup storage enabled"
  type        = bool
}

variable "psqlfs_ha_enabled" {
  description = "Enable high availability"
  type        = bool
}