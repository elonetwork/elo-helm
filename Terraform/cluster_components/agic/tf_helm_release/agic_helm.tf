

resource "helm_release" "agic_helm" {
  name       = "agichelmchart"
  chart      = "../../../../../../../../Terraform/cluster_components/agic/agic_helm_chart/"
}