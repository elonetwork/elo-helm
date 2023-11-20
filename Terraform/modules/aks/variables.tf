

variable "aks_subnet_id" {
  
}
variable "location" {
  type        = string
  description = "Location of Azure resources"
}

variable "appgw_id" {
  
}

variable "env_name" {
  type        = string
  description = "Environment name prefix (e.g., prd, mgm)"
}

variable "environement" {
  type        = string
  description = "Environment name  (e.g., production, management)"
}


variable "resource_group_name" {
  type        = string
  description = "Name of the Azure Resource Group"
}


variable "aks_service_principal" {
  type = map(string)
}

variable "aks_dns_zone_id" {
  
}

