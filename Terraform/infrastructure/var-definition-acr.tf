


variable "acr_name" {
  type = string
  default = "elonetacrregistry"
}

variable "sku" {
  default = "Standard"
  
}
variable "admin_enabled" {
  default = true
}
/*
variable "aks_service_principal" {
  type = map(string)
}


variable "key_vault_id" {
  
}


variable "role_definition_name" {
  default = "AcrPull"
}

variable "skip_service_principal_aad_check" {
  default = true
}*/