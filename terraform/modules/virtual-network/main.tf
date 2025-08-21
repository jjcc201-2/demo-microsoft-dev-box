resource "azurerm_virtual_network" "vnet" {
  name                = var.name
    tags                = var.tags
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.name
  address_prefixes     = var.subnet_address_prefixes

  depends_on = [ azurerm_virtual_network.vnet ]
}