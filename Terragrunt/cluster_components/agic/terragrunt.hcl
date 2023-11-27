include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = ["../../cluster/" ]
}

terraform{
    source="/home/adminuser/elo-helm/Terraform//cluster_components/agic/jenkins/tf_helm_release/"
}



