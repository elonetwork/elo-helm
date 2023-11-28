include "root" {
  path = find_in_parent_folders("terragrunt.hcl")
}

terraform{
    source="../../Terraform//cluster_compnents"
}

inputs={
  location = "westus"
  resource_group_name = "1-7c5b51a2-playground-sandbox"
  sc_name = "elostorageaccount7"
}
