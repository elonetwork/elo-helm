output "appgw_id" {
  value =  module.app_gateway.appgw_id
}

output "appgw_public_ip" {
  value = azurerm_public_ip.app_gateway_public_ip.ip_address
}