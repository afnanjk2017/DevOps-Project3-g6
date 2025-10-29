output "dns_zone_name" {
  value = data.azurerm_dns_zone.domain.name
}

output "dns_zone_rg" {
  value = var.rg_name
}

output "dns_subdomain" {
  value = var.dns_subdomain
}


