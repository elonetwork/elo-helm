include "root" {
  path = find_in_parent_folders("terragrunt.hcl")
}

terraform{
    source="../../Terraform//cluster/"
}

dependencies {
  paths = ["../infrastructure/", "../app_gateway/" ]
}

dependency "infrastructure" {  
  config_path = "../infrastructure/"
}


dependency "gateway" {  
  config_path = "../app_gateway/"
}



inputs = {
  aks_subnet_id = dependency.infrastructure.outputs.aks_subnet_id
  prod_vnet_id = dependency.infrastructure.outputs.prd_vnet_id
  appgw_id = dependency.gateway.outputs.appgw_id
}