

output "subnet_db_id" {
  value = azurerm_subnet.db_subnet.id
}
output "private_endpoint_subnet_id" {
  value = azurerm_subnet.private_endpoints.id
}


output "subnet_pe_cidr" {
  value = azurerm_subnet.private_endpoints.address_prefixes
}
output "subnet_db_cidr" {
  value = azurerm_subnet.db_subnet.address_prefixes
}

