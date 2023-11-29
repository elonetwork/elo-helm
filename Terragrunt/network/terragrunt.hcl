include "root" {
  path = find_in_parent_folders("terragrunt.hcl")
}

terraform{
    source="../../Terraform//network/"
    
}
dependencies {
  paths = ["../../Terragrunt/infrastructure/" ]
}

dependency "infrastructure" {
  config_path = "../../Terragrunt/infrastructure/"
}



inputs = {
  prod_vnet_id = dependency.infrastructure.outputs.prd_vnet_id
  prod_vnet_name = dependency.infrastructure.outputs.prd_vnet_name
  subnet_ids = {
    hosted_agents_subnet = dependency.infrastructure.outputs.hosted_agents_subnet_id
    
  }
}