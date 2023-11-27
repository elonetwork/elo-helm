generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
 terraform {
 }
provider "azurerm" {
  skip_provider_registration = "true"
    features {
      key_vault {
      purge_soft_deleted_keys_on_destroy = true
      recover_soft_deleted_keys          = true
    }
    }
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
        resource_group_name = "1-69f9beed-playground-sandbox"
        storage_account_name = "pseudo00210"
        container_name = "prod"
  }
}
 EOF
} 

remote_state {
    backend = "azurerm"
    config = {
        key = "${path_relative_to_include()}/terraform.tfstate"
        resource_group_name = "1-69f9beed-playground-sandbox"
        storage_account_name = "pseudo00210"
        container_name = "prod"
    }
}

inputs= {
     location = "southcentralus"
      resource_group_name = "1-69f9beed-playground-sandbox"
      env_name = "prd"
      environement = "Production"
      storageAccount_name = "pseudo00210"
      hub_storage_account_name = "pseudo00210"
      hub_container_name = "hub"
      hub_key = "infrastructure/terraform.tfstate"
      aks_service_principal= {
        client_id     = "13bc78b9-00ba-409d-9afb-e88556b293c2"
        client_secret = "xSI8Q~d_4OeZICgKJ_V6CVIavMYmHun-bunSWdr."
      }  
}
