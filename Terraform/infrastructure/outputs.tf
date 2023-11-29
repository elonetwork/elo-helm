


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

output "hosted_agents_subnet_id" {
  value = azurerm_subnet.hosted_agents_subnet.id
}

output "linux_agent_vm_private_ip" {
  value = azurerm_network_interface.linux_agent_nic.ip_configuration[0].private_ip_address
}

output "windows_agent_vm_private_ip" {
  value = azurerm_network_interface.windows_agent_nic.ip_configuration[0].private_ip_address
}
