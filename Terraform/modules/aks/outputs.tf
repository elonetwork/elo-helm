
output "aks_cluster_id" {
  value = azurerm_kubernetes_cluster.aks_cluster.id
}

output "aks_cluster_config_raw" {
  value     = azurerm_kubernetes_cluster.aks_cluster.kube_config_raw
  sensitive = true
}

output "aks_cluster_config" {
  value     = azurerm_kubernetes_cluster.aks_cluster.kube_config
  sensitive = true

}

output "node_name" {
  value = data.local_file.node_name.content
}

output "aks_cluster_identity" {
  value = azurerm_kubernetes_cluster.aks_cluster.identity
}


output "aks_cluster_kube_admin_config" {
  value = azurerm_kubernetes_cluster.aks_cluster.kube_admin_config
}

output "aks_cluster_fqdn" {
  value = azurerm_kubernetes_cluster.aks_cluster.fqdn
}







