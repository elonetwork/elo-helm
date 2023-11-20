
variable "env_name" {
  type        = string
  description = "Environment name prefix (e.g., prd, mgm)"
}

variable "environement" {
  type        = string
  description = "Environment name  (e.g., production, management)"
}


locals {
  nsg_names =  {
    aks_nsg = format("%s_aks_nsg", var.env_name)
  }  
}

