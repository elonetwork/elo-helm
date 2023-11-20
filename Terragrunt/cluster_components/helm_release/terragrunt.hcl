include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = ["../../cluster/" ]
}

terraform{
    source="../../../Terraform//cluster_components/helm_release/"
}



