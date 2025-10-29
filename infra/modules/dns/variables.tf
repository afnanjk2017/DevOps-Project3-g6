variable "rg_name" {
  type        = string
  description = "Resource group to host the domain and DNS zone"
}

variable "domain_name" {
  type        = string
  description = "Domain to purchase and host in Azure DNS (e.g. example.com)"
}

variable "domain_contact_first_name" { type = string }
variable "domain_contact_last_name"  { type = string }
variable "domain_contact_email"      { type = string }
variable "domain_contact_phone"      { type = string }
variable "domain_contact_address1"   { type = string }
variable "domain_contact_city"       { type = string }
variable "domain_contact_state"      { type = string }
variable "domain_contact_postal"     { type = string }
variable "domain_contact_country"    { type = string }

variable "dns_subdomain" {
  type        = string
  description = "Subdomain host for the app (e.g. app)"
}


