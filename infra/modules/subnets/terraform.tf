




# Subnet for AKS Cluster
resource "azurerm_subnet" "aks" {
  name                 = var.subnet_aks_name
  resource_group_name  = var.rg_name
  virtual_network_name = var.vnet_name
  address_prefixes     = [var.subnet_aks_cidr]
}

# Subnet for Private Link
resource "azurerm_subnet" "privatelink" {
  name                 = var.subnet_pl_name
  resource_group_name  = var.rg_name
  virtual_network_name = var.vnet_name
  address_prefixes     = [var.subnet_pl_cidr]
}
