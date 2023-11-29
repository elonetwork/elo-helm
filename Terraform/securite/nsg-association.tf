resource "azurerm_subnet_network_security_group_association" "aks_nsg_association" {
  subnet_id                 = var.subnet_ids["aks"]
  network_security_group_id = azurerm_network_security_group.aks_nsg.id
}


resource "azurerm_subnet_network_security_group_association" "self_hosted_agents_nsg_association" {
  subnet_id                 = var.subnet_ids["self_hosted_agents"]
  network_security_group_id = azurerm_network_security_group.self_hosted_agents_nsg.id
}