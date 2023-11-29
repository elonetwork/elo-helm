variable "subnet_ids" {
  description = "Map of subnet IDs"
  type        = map(string)
  /*default = {
    self_hosted_agents = ""
    aks = ""
  }*/
}
