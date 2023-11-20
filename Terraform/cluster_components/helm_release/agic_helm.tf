resource "helm_release" "agic_helm" {
  name       = "agic_helm"
  chart      = "../agic/"
}