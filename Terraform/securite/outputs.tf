
output "key_vault_id" {
    value = azurerm_key_vault.key_valt.id  
}

output "key_vault_name" {
  value = azurerm_key_vault.key_valt.name
}

/*
output "key_vault_key_id" {
  value = azurerm_key_vault_key.generated.id
}

output "key_vault_key_name" {
  value = azurerm_key_vault_key.generated.name
}*/