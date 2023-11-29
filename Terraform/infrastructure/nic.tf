resource "azurerm_network_interface" "linux_agent_nic" {
  name                = var.linux_agent_vm_name
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = var.linux_agent_ip_configuration_name
    subnet_id                     = azurerm_subnet.hosted_agents_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}


resource "azurerm_network_interface" "windows_agent_nic" {
  name                = var.windows_agent_vm_nic_name_name
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = var.windows_agent_ip_configuration_name
    subnet_id                     = azurerm_subnet.hosted_agents_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}



