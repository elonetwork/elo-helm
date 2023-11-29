
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
