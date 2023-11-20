variable "resource_group_name" {
  type = string
}


variable "location" {
  type = string
}

variable "env_name" {
  type        = string
  description = "Environment name prefix (e.g., prd, mgm)"
}

variable "environement" {
  type        = string
  description = "Environment name  (e.g., production, management)"
}

variable "prod_vnet_id" {
}



