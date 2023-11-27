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
        resource_group_name = "1-62352bfd-playground-sandbox"
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
        resource_group_name = "1-62352bfd-playground-sandbox"
        storage_account_name = "pseudo00210"
        container_name = "prod"
    }
}

inputs= {
     location = "eastus"
      resource_group_name = "1-62352bfd-playground-sandbox"
      env_name = "prd"
      environement = "Production"
      storageAccount_name = "pseudo00210"
      hub_storage_account_name = "pseudo00210"
      hub_container_name = "hub"
      hub_key = "infrastructure/terraform.tfstate"
      aks_service_principal= {
        client_id     = "632f88d8-36f1-4359-84d9-5b7e0e037497"
        client_secret = "1Ja8Q~t8UlhG3_8CcigOpsa5o_35NkJzBfLEicOE"
      }  
}
