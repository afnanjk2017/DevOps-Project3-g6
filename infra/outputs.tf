
output "kube_config" {
  value = module.aks.kube_config

  sensitive = true
}
output "aks_name" {
  description = "AKS Cluster name"
  value       = module.aks.aks_name
}

