resource "azurerm_kubernetes_cluster" "aks" {
  name                = "${var.prefix}-aks-cluster"
  location            = var.location
  resource_group_name = var.rg_name
  dns_prefix          = "${var.prefix}-dns"
  node_resource_group = "${var.prefix}-aks-node"

  default_node_pool {
    name                        = var.default_node_pool_name
    vm_size                     = var.vm_size
    vnet_subnet_id              = var.aks_subnet
    temporary_name_for_rotation = "userrot"
    auto_scaling_enabled        = true
    min_count                   = 1
    max_count                   = 3
    upgrade_settings {
      max_surge = "33%"
    }
  }
  network_profile {
    network_plugin      = "azure"
    network_plugin_mode = "overlay"
    load_balancer_sku   = "standard"
    outbound_type       = "loadBalancer"
    service_cidr        = "10.100.0.0/16"
    dns_service_ip      = "10.100.0.10"
    pod_cidr            = "10.200.0.0/16" # optional
  }

  identity {
    type = "SystemAssigned"
  }

}

