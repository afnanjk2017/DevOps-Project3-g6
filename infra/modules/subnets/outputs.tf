

output "privatelink_id" {
  value = azurerm_subnet.privatelink.id
}
output "subnet_aks_id" {
  value = azurerm_subnet.aks.id
}

output "subnet_aks_cidr" {
  value = azurerm_subnet.aks.address_prefixes
}

