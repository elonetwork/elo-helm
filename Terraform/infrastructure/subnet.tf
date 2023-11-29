
resource "azurerm_subnet" "aks_subnet" {
  name                                           = local.subnet_names["aks_subnet"]
  resource_group_name                            = var.resource_group_name
  virtual_network_name                           = module.prod_vnet.vnet_name
  address_prefixes                               = var.subnet_address_prefixes["aks"]
}

resource "azurerm_subnet" "app_gateway_subnet" {
  name                                           = local.subnet_names["app_gateway_subnet"]
  resource_group_name                            = var.resource_group_name
  virtual_network_name                           = module.prod_vnet.vnet_name
  address_prefixes                               = var.subnet_address_prefixes["app_gateway_subnet"]
}

resource "azurerm_subnet" "hosted_agents_subnet" {
  name                                           = local.subnet_names["hosted_agents_subnet"]
  resource_group_name                            = var.resource_group_name
  virtual_network_name                           = module.prod_vnet.vnet_name
  address_prefixes                               = var.subnet_address_prefixes["hosted_agents_subnet"]
}
