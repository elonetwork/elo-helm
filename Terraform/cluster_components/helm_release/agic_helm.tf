

resource "helm_release" "agic_helm" {
  name       = "agichelm"
  chart      = "../../../../../../../../Terraform/cluster_components/agic/"
}