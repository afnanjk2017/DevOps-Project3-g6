

output "aks_name" {
  description = "AKS Cluster name"
  value       = module.aks.aks_name
}
output "rg_name" {
  value = module.resourcegroups.rg_name
}
