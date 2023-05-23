resource "azurerm_resource_group" "RG" {
  name          = var.RG-name
  location      = var.RG-location
  tags          = var.tag
}

resource "azurerm_virtual_network" "VN" {
  name                  = var.VN-name 
  resource_group_name   = azurerm_resource_group.RG.name
  location              = azurerm_resource_group.RG.location
  address_space         = var.VN-address
}

resource "azurerm_subnet" "Subnet" {
  name                  = var.sub-name
  resource_group_name   = azurerm_resource_group.RG.name
  virtual_network_name  = azurerm_virtual_network.VN.name
  address_prefixes      = var.sub-add
}