


resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = local.aks_cluster_name
  resource_group_name = var.resource_group_name
  location            = var.location

  network_profile {
    network_plugin = "azure"
  }

  ingress_application_gateway {
    gateway_id = var.appgw_id
  }


  private_cluster_enabled = true
  private_dns_zone_id     = var.aks_dns_zone_id
  dns_prefix              = format("%s", var.env_name)
  azure_policy_enabled = false
    azure_active_directory_role_based_access_control {
      managed            = true
      azure_rbac_enabled = true
    }
  private_cluster_public_fqdn_enabled = false

  // allow us to communicate with cluster (api-server) using our existing account
  service_principal {
    client_id     = var.aks_service_principal.client_id
    client_secret = var.aks_service_principal.client_secret
  }
  default_node_pool {
    name           = var.nodepool_name
    vm_size        = "Standard_D2s_v3"
    node_count     = 3
    vnet_subnet_id = var.aks_subnet_id

  }
  tags = {
    Environement = var.environement
  }
}


