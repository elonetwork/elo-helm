generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
 terraform {
 }
provider "azurerm" {
  skip_provider_registration = "true"
    features {}    
 }
 EOF
}

# Backend 
generate "backend" {
  path = "backend.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
terraform {
  backend "azurerm" {
        key = "${path_relative_to_include()}/terraform.tfstate"
        resource_group_name = "1-1b74313b-playground-sandbox"
        storage_account_name = "hubspokesacount0"
        container_name = "statecontainer"
  }
}
 EOF
} 

remote_state {
    backend = "azurerm"
    config = {
        key = "${path_relative_to_include()}/terraform.tfstate"
        resource_group_name = "1-1b74313b-playground-sandbox"
        storage_account_name = "hubspokesacount0"
        container_name = "statecontainer"
    }
}
inputs= {
     location = "eastus"
     resource_group_name = "1-1b74313b-playground-sandbox"
}
