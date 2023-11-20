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
        resource_group_name = "1-fa30263e-playground-sandbox"
        storage_account_name = "pseudo00210"
        container_name = "hub"
  }
}
 EOF
} 

remote_state {
    backend = "azurerm"
    config = {
        key = "${path_relative_to_include()}/terraform.tfstate"
        resource_group_name = "1-fa30263e-playground-sandbox"
        storage_account_name = "pseudo00210"
        container_name = "prod"
    }
}

inputs= {
     location = "westus"
      resource_group_name = "1-fa30263e-playground-sandbox"
      env_name = "prd"
      environement = "Production"
      hub_storage_account_name = "pseudo00210"
      hub_container_name = "hub"
      hub_key = "infrastructure/terraform.tfstate"
      aks_service_principal= {
        client_id     = "f4c6eb44-8e8a-4512-9eb3-fcf8a094cda9"
        client_secret = "-xS8Q~dAZEnR8ggJCHq5bZhwKMJGF4Vp6skoVbBW"
      }  
}
