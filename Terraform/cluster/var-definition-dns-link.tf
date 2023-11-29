

variable "hub_storage_account_name" {
  
}

variable "hub_container_name" {
  
}


variable "infrastructure_hub_key" {
  
}

data "terraform_remote_state" "hub_data" {
  backend = "azurerm"
  config = {   
    resource_group_name = var.resource_group_name
    storage_account_name = var.hub_storage_account_name
    container_name = var.hub_container_name
    key = var.infrastructure_hub_key
  }
}

locals {
  hub_vnet_id = data.terraform_remote_state.hub_data.outputs.hub_vnet_id
}