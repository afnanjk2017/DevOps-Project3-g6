

output "db_admin" {
  value = var.db_admin
}
output "db_server_fqdn" {
  value = azurerm_mssql_server.sql.fully_qualified_domain_name
}

output "db_name" {
  value = azurerm_mssql_database.sqldb.name
}
