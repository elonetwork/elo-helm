resource "azurerm_subnet_network_security_group_association" "aks_nsg_association" {
  subnet_id                 = var.aks_subnet_id
  network_security_group_id = azurerm_network_security_group.aks_nsg.id
}