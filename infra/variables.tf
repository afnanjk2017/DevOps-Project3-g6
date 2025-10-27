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

