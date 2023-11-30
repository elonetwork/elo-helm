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
        resource_group_name = "1-9522d252-playground-sandbox"
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
        resource_group_name = "1-9522d252-playground-sandbox"
        storage_account_name = "pseudo00210"
        container_name = "prod"
    }
}

inputs= {
     location = "eastus"
      resource_group_name = "1-9522d252-playground-sandbox"
      env_name = "prd"
      environement = "Production"
      storageAccount_name = "pseudo00210"
      hub_storage_account_name = "pseudo00210"
      hub_container_name = "hub"
      infrastructure_hub_key = "infrastructure/terraform.tfstate"
      securite_hub_key = "securite/terraform.tfstate"

      aks_service_principal= {
        client_id     = "120abaa0-6428-4c33-89e8-04cca579d559"
        client_secret = "Pew8Q~KhjVZ4SoCMia4ESkaEV7Bj_zQDgPyPSbXV"
      }  
}
