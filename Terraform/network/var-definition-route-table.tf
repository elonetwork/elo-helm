
data "azurerm" "name" {
  
}

variable "aks_internet_route_name" {
  description = "Name for the internet route"
  default     = "aks_internt_route-http"
}


variable "internet_route_name" {
  description = "Name for the internet route"
  default     = "route-http"
}

variable "env_name" {  
}

variable "aks_subnet_id" {  
}

variable "firewall_private_ip_address" {
  
}

