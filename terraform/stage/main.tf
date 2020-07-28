provider "azurerm" {
  version = "~>2.0"

  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id

  features {}
}

module "aks" {
  source              = "../modules/aks"
  client_id           = var.client_id
  client_secret       = var.client_secret
  node_count          = var.node_count
  vm_size             = var.vm_size
  ssh_public_key      = var.ssh_public_key
  dns_prefix          = var.dns_prefix
  cluster_name        = var.cluster_name
  resource_group_name = var.resource_group_name
  location            = var.location
}