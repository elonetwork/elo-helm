include "root" {
  path = find_in_parent_folders("terragrunt.hcl")
}

terraform{
    source="../../Terraform//app-gateway/"
}

dependencies {
  paths = ["../../Terragrunt/infrastructure/" ]
}

dependency "infrastructure" {  //export module 
  config_path = "../../Terragrunt/infrastructure/"
}



inputs = {
  app_gateway_subnet_id = dependency.infrastructure.outputs.app_gateway_subnet_id
}