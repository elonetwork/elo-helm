


output "aks_subnet_id" {
  value = azurerm_subnet.aks_subnet.id
}


output "prd_vnet_name" {
  value = module.prod_vnet.vnet_name
}

output "prd_vnet_id" {
  value = module.prod_vnet.vnet_id
}

output "prd_vnet_address" {
  value = module.prod_vnet.vnet_address
}


output "app_gateway_subnet_id" {
  value = azurerm_subnet.app_gateway_subnet.id
}
