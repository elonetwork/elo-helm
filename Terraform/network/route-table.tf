resource "azurerm_route_table" "aks_route_table" {
  name                = format("%s_%s",var.env_name,var.aks_internet_route_name)
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_route" "aks_internet_route" {
  name                   = var.internet_route_name
  route_table_name       = azurerm_route_table.aks_route_table.name
  resource_group_name    = var.resource_group_name
  address_prefix         = "0.0.0.0/0"
  next_hop_type          = "VirtualAppliance"
  next_hop_in_ip_address = var.firewall_private_ip_address
}

resource "azurerm_subnet_route_table_association" "squid_subnet_association" {
  route_table_id = azurerm_route_table.aks_route_table.id
  subnet_id      = var.aks_subnet_id
}