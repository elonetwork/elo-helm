resource "azurerm_virtual_network_peering" "peering_hub_prod" {
  name                         = var.peering_names["peering_hub_prod"]
  resource_group_name          = var.resource_group_name
  virtual_network_name         = local.hub_vnet_name
  remote_virtual_network_id    = var.prod_vnet_id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = true

}

resource "azurerm_virtual_network_peering" "peering_prod_hub" {
  name                         = var.peering_names["peering_prod_hub"]
  resource_group_name          = var.resource_group_name
  virtual_network_name         = var.prod_vnet_name
  remote_virtual_network_id    = local.hub_vnet_id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = true

}