resource "azurerm_web_application_firewall_policy" "app_gateway_firewall_policy" {
  name                = "example-wafpolicy"
  resource_group_name = var.resource_group_name
  location            = var.location   

  managed_rules {
    managed_rule_set {
      type    = "OWASP"
      version = "3.2"
      rule_group_override {
        rule_group_name = "REQUEST-920-PROTOCOL-ENFORCEMENT"
        rule {
          id      = "920300"
          enabled = true
          action  = "Log"
        }
        rule {
          id      = "920440"
          enabled = true
          action  = "Block"
        }
      }
    }
  }
}




resource "azurerm_application_gateway" "app_gateway" {
  name                = format("%s_app_gateway", var.env_name)
  resource_group_name = var.resource_group_name
  location            = var.location
  firewall_policy_id                = azurerm_web_application_firewall_policy.app_gateway_firewall_policy.id
  force_firewall_policy_association = true

  sku {
    name     = "WAF_v2"
    tier     = "WAF_v2"
    capacity = 2
  }

  backend_http_settings {
    name                  = local.http_setting_name
    cookie_based_affinity = "Disabled"
    port                  = 80
    protocol              = "Http"
  }

  gateway_ip_configuration {
    name      = "example-configuration"
    subnet_id = var.subnet_id
  }

  frontend_port {
    name = local.frontend_port_name
    port = var.frontend_port
  }

  frontend_ip_configuration {
    name                 = local.frontend_ip_configuration_name
    public_ip_address_id = var.app_gateway_public_ip_id
  }

  backend_address_pool {
    name = local.backend_address_pool_name
  }

    http_listener {
    name                           = local.listener_name
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = local.request_routing_rule_name
    priority                   = 9
    rule_type                  = "Basic"
    http_listener_name         = local.listener_name
    backend_address_pool_name  = local.backend_address_pool_name
    backend_http_settings_name = local.http_setting_name

  }

}

