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
        resource_group_name = "1-8615ac8a-playground-sandbox"
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
        resource_group_name = "1-8615ac8a-playground-sandbox"
        storage_account_name = "pseudo00210"
        container_name = "prod"
    }
}

inputs= {
     location = "westus"
      resource_group_name = "1-8615ac8a-playground-sandbox"
      env_name = "prd"
      environement = "Production"
      storageAccount_name = "pseudo00210"
      hub_storage_account_name = "pseudo00210"
      hub_container_name = "hub"
      infrastructure_hub_key = "infrastructure/terraform.tfstate"
      securite_hub_key = "securite/terraform.tfstate"

      aks_service_principal= {
        client_id     = "71b348e9-2b20-48ac-aecc-8805cd58b3d5"
        client_secret = "e5M8Q~X6Q6xIwStRo0Eto0UI_dBRMVna5OQO3cN0"
      }  
}
