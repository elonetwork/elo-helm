module "app_gateway" {
  source = "../modules/application-gateway"
  resource_group_name =  var.resource_group_name
  app_gateway_public_ip_id = azurerm_public_ip.app_gateway_public_ip.id
  location = var.location
  env_name = var.env_name

  subnet_id = var.app_gateway_subnet_id
}


