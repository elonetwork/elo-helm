/*data "azuread_service_principal" "aks_service_principal" {
  client_id = var.aks_service_principal.client_id
}
*/
resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.sku
  admin_enabled       = var.admin_enabled
}


/*
resource "azurerm_role_assignment" "aks_to_acr_link" {
  principal_id         = data.azuread_service_principal.aks_service_principal.object_id
  role_definition_name             = var.role_definition_name
  scope                            = azurerm_container_registry.acr.id
  skip_service_principal_aad_check = var.skip_service_principal_aad_check
}

*/