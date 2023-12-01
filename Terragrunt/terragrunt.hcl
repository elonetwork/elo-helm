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
        resource_group_name = "resource_group_name"
        storage_account_name = "  "
        container_name = "prod"
  }
}
 EOF
} 

remote_state {
    backend = "azurerm"
    config = {
        key = "${path_relative_to_include()}/terraform.tfstate"
        resource_group_name = "resource_group_name"
        storage_account_name = "storage_account_name"
        container_name = "prod"
    }
}

inputs= {
     location = "location"
      resource_group_name = "resource_group_name"
      env_name = "prd"
      environement = "Production"
      storageAccount_name = "storage_account_name"
      hub_storage_account_name = "storage_account_name"
      hub_container_name = "hub"
      infrastructure_hub_key = "infrastructure/terraform.tfstate"
      securite_hub_key = "securite/terraform.tfstate"

      aks_service_principal= {
        client_id     = "client_id"
        client_secret = "client_secret"
      }  
}
