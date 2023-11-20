variable "peering_names" {
  type = map(string)
  default = {
    peering_hub_prod = "peering_hub_prod"
    peering_prod_hub = "peering_prod_hub"
  }
}

variable "prod_vnet_name" {}

variable "prod_vnet_id" {}

data "terraform_remote_state" "hub_data" {
  backend = "azurerm"
  config = {   
    resource_group_name = var.resource_group_name
    storage_account_name = var.hub_storage_account_name
    container_name = var.hub_container_name
    key = var.hub_key
  }
}

locals {
  hub_vnet_id = data.terraform_remote_state.hub_data.outputs.hub_vnet_id
  hub_vnet_name = data.terraform_remote_state.hub_data.outputs.hub_vnet_name

}

variable "hub_storage_account_name" {}

variable "hub_container_name" {}

variable "hub_key" {}