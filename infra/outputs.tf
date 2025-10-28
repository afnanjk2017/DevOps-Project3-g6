

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
