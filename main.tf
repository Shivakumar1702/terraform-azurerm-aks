resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.rg_location
  tags = {
    environment = var.tag
  }
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                      = var.cluster_name
  resource_group_name       = azurerm_resource_group.rg.name
  location                  = azurerm_resource_group.rg.location
  dns_prefix                = var.dns_prefix
  automatic_channel_upgrade = var.upgrade_type

  default_node_pool {
    name                = var.default_node_pool_name
    node_count          = var.default_node_count
    vm_size             = var.default_vm_size
    enable_auto_scaling = var.enable_auto_scaling

  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin = var.network_plugin
    network_policy = var.network_policy
  }

  tags = {
    Environment = var.tag
  }

}

resource "azurerm_kubernetes_cluster_node_pool" "example" {
  name                  = var.node_pool_name
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks.id
  vm_size               = var.vm_size
  node_count            = var.node_count

  tags = {
    Environment = "Production"
  }
}