


module "db" {
  source      = "./modules/db"
  rg_location = module.resourcegroups.rg_location
  rg_name     = module.resourcegroups.rg_name
  vnet_id     = module.vnets.vnet_id
  privatelink = module.subnets.privatelink_id
  db_password = var.db_password

  resource_prefix = var.resource_prefix

  rg_id    = module.resourcegroups.rg_id
  db_admin = var.db_admin
}

module "resourcegroups" {
  source                  = "./modules/resourcegroups"
  author                  = var.author
  resource_prefix         = var.resource_prefix
  resource_group_location = var.resource_group_location
  resource_group_name     = var.resource_group_name
}
module "subnets" {
  source          = "./modules/subnets"
  rg_location     = module.resourcegroups.rg_location
  rg_name         = module.resourcegroups.rg_name
  vnet_name       = module.vnets.vnet_name
  author          = var.author
  resource_prefix = var.resource_prefix
  rg_id           = module.resourcegroups.rg_id
  vnet_id         = module.vnets.vnet_id
}
module "vnets" {
  source          = "./modules/vnets"
  rg_location     = module.resourcegroups.rg_location
  rg_name         = module.resourcegroups.rg_name
  author          = var.author
  resource_prefix = var.resource_prefix
}
module "aks" {
  source                 = "./modules/aks"
  default_node_pool_name = var.author
  location               = var.resource_group_location
  prefix                 = var.resource_prefix
  aks_subnet             = module.subnets.subnet_aks_id
  rg_name                = module.resourcegroups.rg_name

}

# Purchase domain and use its Azure-hosted DNS zone
resource "azurerm_app_service_domain" "domain" {
  name                = var.domain_name
  resource_group_name = module.resourcegroups.rg_name
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
  resource_group_name = module.resourcegroups.rg_name
}