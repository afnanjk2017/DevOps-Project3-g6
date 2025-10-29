


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

module "dns" {
  source                      = "./modules/dns"
  rg_name                     = module.resourcegroups.rg_name
  domain_name                 = var.domain_name
  domain_contact_first_name   = var.domain_contact_first_name
  domain_contact_last_name    = var.domain_contact_last_name
  domain_contact_email        = var.domain_contact_email
  domain_contact_phone        = var.domain_contact_phone
  domain_contact_address1     = var.domain_contact_address1
  domain_contact_city         = var.domain_contact_city
  domain_contact_state        = var.domain_contact_state
  domain_contact_postal       = var.domain_contact_postal
  domain_contact_country      = var.domain_contact_country
  dns_subdomain               = var.dns_subdomain
}