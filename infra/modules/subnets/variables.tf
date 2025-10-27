variable "rg_name" {
  type        = string
  description = "resource group name"
}
variable "rg_location" {
  type        = string
  description = "resource group location"
}

variable "vnet_name" {
  type        = string
  description = "Name of the VNet"
}
variable "vnet_id" {
  type        = string
  description = "ID of the VNet"
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
variable "rg_id" {
  type        = string
  description = "RG ID"
}



# AKS Subnet
variable "subnet_aks_name" {
  description = "Subnet for AKS Cluster"
  type        = string
  default     = "snet-aks"
}

variable "subnet_aks_cidr" {
  description = "CIDR block for AKS subnet"
  type        = string
  default     = "10.0.1.0/24"
}

# Private Link Subnet
variable "subnet_pl_name" {
  description = "Subnet for Private Link"
  type        = string
  default     = "snet-privatelink"
}

variable "subnet_pl_cidr" {
  description = "CIDR block for Private Link subnet"
  type        = string
  default     = "10.0.2.0/24"
}
