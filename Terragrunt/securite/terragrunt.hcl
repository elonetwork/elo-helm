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
  aks_subnet_id = dependency.infrastructure.outputs.aks_subnet_id
}