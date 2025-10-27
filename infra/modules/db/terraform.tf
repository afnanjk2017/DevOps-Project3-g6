resource "azurerm_mssql_server" "sql" {
  name                          = "g6-server-p3"
  resource_group_name           = var.rg_name
  location                      = var.rg_location
  version                       = "12.0"
  administrator_login           = var.db_admin
  administrator_login_password  = var.db_password
  public_network_access_enabled = false
  minimum_tls_version           = "1.2"

}

resource "azurerm_mssql_database" "sqldb" {
  name                 = "g6-db-project3"
  server_id            = azurerm_mssql_server.sql.id
  sku_name             = "S0"
  storage_account_type = "Local"
}

# Private DNS Zone
resource "azurerm_private_dns_zone" "sqlzone" {
  name                = "privatelink.database.windows.net"
  resource_group_name = var.rg_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "sqlzone_link" {
  name                  = "${var.resource_prefix}-sql-vnet-link"
  private_dns_zone_name = azurerm_private_dns_zone.sqlzone.name
  resource_group_name   = var.rg_name
  virtual_network_id    = var.vnet_id
  registration_enabled  = false
}

# Private Endpoint for SQL
resource "azurerm_private_endpoint" "sql_pe" {
  name                = "${var.resource_prefix}-sql-pe"
  location            = var.rg_location
  resource_group_name = var.rg_name
  subnet_id           = var.privatelink


  private_service_connection {
    name                           = "${var.resource_prefix}-sql-psc"
    private_connection_resource_id = azurerm_mssql_server.sql.id
    is_manual_connection           = false
    subresource_names              = ["sqlServer"]
  }

  private_dns_zone_group {
    name                 = "sql-dns-zg"
    private_dns_zone_ids = [azurerm_private_dns_zone.sqlzone.id]
  }
}
