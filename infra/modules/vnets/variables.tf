variable "rg_name" {
  type        = string
  description = "resource group name"
}
variable "rg_location" {
  type        = string
  description = "resource group location"
}
variable "author" {
  type        = string
  description = "Name of the author"
  default     = "terraform"
}
variable "resource_prefix" {
  type        = string
  description = "Prefix for resources"
  default     = "devops-tf"
}
variable "vnet_name" {
  description = "Virtual Network name"
  type        = string
  default     = "vnet-grp3"
}

variable "vnet_cidr" {
  description = "Address space for the VNet"
  type        = string
  default     = "10.0.0.0/16"
}


