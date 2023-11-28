resource "helm_release" "example" {
  name       = "my-release"
  chart      = "/home/adminuser/elo-prd/Terraform/cluster_compnents/az-file"
}

# resource "azurerm_storage_account" "example" {
#   name                     = var.sc_name
#   resource_group_name      = var.resource_group_name
#   location                 = var.location
#   account_tier             = "Standard"
#   account_replication_type = "LRS"
# }