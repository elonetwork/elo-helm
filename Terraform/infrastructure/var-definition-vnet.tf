


variable "env_name" {
  type        = string
  description = "Environment name prefix (e.g., prd, mgm)"
}

variable "environement" {
  type        = string
  description = "Environment name  (e.g., production, management)"
}

variable "vnet_name" {
  description = "The name of the virtual network"
  default     = "prd-vnet"  
}

locals {
  vnet_names =  {
    prod_vnet = var.vnet_name
  }  
}

variable "vnet_address_space" {
  description = "The address space for the VNet."
  type        = list(string)
  default     = ["10.102.0.0/16"]
}


