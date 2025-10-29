variable "ARM_SUBSCRIPTION_ID" {
  type        = string
  description = "Azure RM sub ID"

}

variable "db_password" {
  type        = string
  sensitive   = true
  description = "Password for the MSSQL Database"

}
variable "author" {
  type        = string
  description = "Author of the resources"
  default     = "gsix"
}
variable "resource_prefix" {
  type        = string
  description = "Resource prefix to add to the names"
  default     = "group6-"
}
variable "resource_group_location" {
  type        = string
  description = "Resource group location"
  default     = "Chile Central"
}
variable "resource_group_name" {
  type        = string
  description = "Resource group name"
  default     = "project3-g6-devops"
}

variable "db_admin" {
  type    = string
  default = "groub6"
}

# App Service Domain (automated domain purchase in Azure)
variable "domain_name" {
  type        = string
  description = "Domain to purchase and host in Azure DNS (e.g. afnan-demo.xyz)"
  default = "afnan-group6-devops.com"
}

variable "domain_contact_first_name" { type = string  default = "afnan" }
variable "domain_contact_last_name"  { type = string  default = "almuklef" }
variable "domain_contact_email"      { type = string  default "afnanjk2017@gmail.com"}
variable "domain_contact_phone"      { type = string default = "+1.5555555555"} # E.164 format, e.g. +1.5555555555
variable "domain_contact_address1"   { type = string  default = "123 Azure Lane" }
variable "domain_contact_city"       { type = string  default = "Riyadh" }
variable "domain_contact_state"      { type = string  default = "Riyadh" }
variable "domain_contact_postal"     { type = string  default = "11451" }
variable "domain_contact_country"    { type = string  default = "SA" } # ISO code, e.g. US, SA

# Subdomain to publish application on (host record under the purchased domain)
variable "dns_subdomain" {
  type        = string
  description = "Subdomain host for the app (e.g. app)"
  default     = "app"
}

