// include "root" {
//   path = find_in_parent_folders("terragrunt.hcl")
// }

terraform{
    source="../../Terraform//cluster_compnents"
}

// inputs={
//   location = "southcentralus"
//   resource_group_name = "1-9b84ea26-playground-sandbox"
//   sc_name = "elostorageaccount7"
// }
