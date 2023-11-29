/*resource "azurerm_route_table" "agent_pool_subnet_route_table" {
  name                = var.agent_pool_subnet_route_table_name
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_route" "agent_pool_subnet_route" {
  name                   = var.agent_pool_subnet_route_name
  route_table_name       = azurerm_route_table.agent_pool_subnet_route_table.name
  resource_group_name    = var.resource_group_name
  address_prefix         = "0.0.0.0/0"
  next_hop_type          = "VirtualAppliance"
  next_hop_in_ip_address = local.firewall_private_ip_address
}

resource "azurerm_subnet_route_table_association" "squid_subnet_association" {
  route_table_id = azurerm_route_table.agent_pool_subnet_route_table.id
  subnet_id      = var.subnet_ids["hosted_agents_subnet"]
}*/