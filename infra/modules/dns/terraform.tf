resource "azurerm_app_service_domain" "domain" {
  name                = var.domain_name
  resource_group_name = var.rg_name
  auto_renew          = true
  privacy             = true

  contact {
    first_name  = var.domain_contact_first_name
    last_name   = var.domain_contact_last_name
    email       = var.domain_contact_email
    phone       = var.domain_contact_phone
    address1    = var.domain_contact_address1
    city        = var.domain_contact_city
    state       = var.domain_contact_state
    postal_code = var.domain_contact_postal
    country     = var.domain_contact_country
  }
}

data "azurerm_dns_zone" "domain" {
  name                = azurerm_app_service_domain.domain.name
  resource_group_name = var.rg_name
}


