module "aks_cluster" {
  source = "../modules/aks"
  environement = var.environement
  env_name = var.env_name
  appgw_id = var.appgw_id
  resource_group_name = var.resource_group_name
  location = var.location
  aks_dns_zone_id = azurerm_private_dns_zone.aks_dns_zone.id
  aks_subnet_id = var.aks_subnet_id
  aks_service_principal = var.aks_service_principal
}