

resource "helm_release" "agic_helm" {
  name       = "agichelmchart"
  chart      = "/home/adminuser/elo-helm/Terraform/cluster_components/agic/jenkins/helm_chart/"
  cleanup_on_fail = true
  values = [
   <<EOT
    location: ${var.location}
    ressource_group_name: ${var.resource_group_name}
    storageAccount_name:  ${var.storageAccount_name}
    EOT
  ]

  provisioner "local-exec" {
    command = "kubectl rollout restart deployment jenkins"
  }
}