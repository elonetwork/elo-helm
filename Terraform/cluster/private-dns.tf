resource "azurerm_private_dns_zone" "aks_dns_zone" {
  name                = format("%s.private.%s.azmk8s.io", var.env_name, var.location)
  resource_group_name = var.resource_group_name
}