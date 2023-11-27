include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = ["../../cluster/" ]
}

terraform{
    source="../../../Terraform//cluster_components/az-file/tf_helm_release/"
}



