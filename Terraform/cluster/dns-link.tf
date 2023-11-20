

resource "azurerm_private_dns_zone_virtual_network_link" "prd_dns_zone_link" {
  name                  = format("%s_prd_dns_zone_link", var.env_name)
  resource_group_name   = var.resource_group_name
  virtual_network_id    = var.prod_vnet_id
  private_dns_zone_name = azurerm_private_dns_zone.aks_dns_zone.name
  registration_enabled  = var.registration_enabled

}


#link dns zone to hub vnet
resource "azurerm_private_dns_zone_virtual_network_link" "hub_dns_zone_link" {
  name                  = format("%s_hub_dns_zone_link", var.env_name)
  resource_group_name   = var.resource_group_name
  virtual_network_id    = local.hub_vnet_id
  private_dns_zone_name = azurerm_private_dns_zone.aks_dns_zone.name
  registration_enabled  = var.registration_enabled

}

