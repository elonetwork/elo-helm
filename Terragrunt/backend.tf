# Generated by Terragrunt. Sig: nIlQXj57tbuaRZEa
terraform {
  backend "azurerm" {
        key = "./terraform.tfstate"
        resource_group_name = "1-fa30263e-playground-sandbox"
        storage_account_name = "pseudo00210"
        container_name = "hub"
  }
}
