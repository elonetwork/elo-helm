module "prod_vnet" {
  source              = "../modules/vnet"
  resource_group_name = var.resource_group_name
  location            = var.location
  vnet_name           = local.vnet_names["prod_vnet"]
  address_space       = var.vnet_address_space
}

