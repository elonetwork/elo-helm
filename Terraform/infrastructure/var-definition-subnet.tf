



locals {
  subnet_names =  {
    aks_subnet = format("%s_aks_subnet", var.env_name)
    app_gateway_subnet = format("%s_app_gateway_subnet", var.env_name)
  }  
}


variable "subnet_address_prefixes" {
  description = "The address prefix for the subnets"
  default     = {
    aks     = ["10.102.2.0/24"]
    app_gateway_subnet = ["10.102.3.0/24"]
  }  
}

