

output "aks_name" {
  description = "AKS Cluster name"
  value       = module.aks.aks_name
}
output "rg_name" {
  value = module.resourcegroups.rg_name
}


output "db_server_fqdn" {
  value = module.db.db_server_fqdn
}

output "db_name" {
  value = module.db.db_name
}

output "db_admin" {
  value = module.db.db_admin
}

# DNS outputs (from DNS module)
output "dns_zone_name" {
  value = module.dns.dns_zone_name
}

output "dns_zone_rg" {
  value = module.dns.dns_zone_rg
}

output "dns_subdomain" {
  value = module.dns.dns_subdomain
}