
variable "agent_pool_subnet_route_table_name" {
  default = "agent_pool_subnet_route_table"
}

variable "agent_pool_subnet_route_name" {
    default = "agent_pool_subnet_route"
}

variable "subnet_ids" {
  description = "Map of subnet IDs"
  type        = map(string)
  /*default = {
    hosted_agents_subnet = ""
  }*/
}

data "terraform_remote_state" "security_hub_data" {
  backend = "azurerm"
  config = {   
    resource_group_name = var.resource_group_name
    storage_account_name = var.hub_storage_account_name
    container_name = var.hub_container_name
    key = var.securite_hub_key
  }
}

variable "securite_hub_key" {}