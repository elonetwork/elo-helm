resource "helm_release" "az-file_helm" {
  name       = "azfilehelmchart"
  chart      = "../../../../../../../../Terraform/cluster_components/az-file/helm_chart/"
}