include "root" {
  path = find_in_parent_folders("terragrunt.hcl")
}

terraform{
    source="../../Terraform//securite/"
}

dependencies {
  paths = ["../../Terragrunt/infrastructure/" ]
}

dependency "infrastructure" {  //export module 
  config_path = "../../Terragrunt/infrastructure/"
}

inputs = {
  subnet_ids = {
    self_hosted_agents = dependency.infrastructure.outputs.hosted_agents_subnet_id
    aks = dependency.infrastructure.outputs.aks_subnet_id
  }

}