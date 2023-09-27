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

variable "domain_name_label" {
  description = "DNS name label for assignment to Application Gateway"
  type        = string
}

variable "kv_certificate_authority_label" {
  description = "Label for the Certificate Authority"
  type        = string
}

variable "kv_certificate_authority_name" {
  description = "Name of the Certificate Authority"
  type        = string
}

variable "kv_certificate_authority_username" {
  description = "Username for the Certificate provider"
  type        = string
}

variable "kv_certificate_authority_password" {
  description = "Password the Certificate provider"
  type        = string
}

variable "kv_certificate_authority_admin_email" {
  description = "Email Address of the Certificate Authority Admin"
  type        = string
}

variable "kv_certificate_authority_admin_first_name" {
  description = "First Name of the Certificate Authority Admin"
  type        = string
}

variable "kv_certificate_authority_admin_last_name" {
  description = "Last Name of the Certificate Authority Admin"
  type        = string
}

variable "kv_certificate_authority_admin_phone_no" {
  description = "Phone No. of the Certificate Authority Admin"
  type        = string
}

variable "kv_certificate_label" {
  description = "Label for the Certificate"
  type        = string
}

variable "kv_certificate_subject" {
  description = "Subject of the Certificate"
  type        = string
}