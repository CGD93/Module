resource "azurerm_resource_group" "RG" {
  name          = var.RG-name[count.index]
  location      = var.RG-location
  count = var.coun
  tags          = var.tag
}

resource "azurerm_virtual_network" "VN" {
  name                  = var.VN-name[count.index]
  resource_group_name   = azurerm_resource_group.RG[count.index].name
  location              = azurerm_resource_group.RG[count.index].location
  count = var.coun
  address_space         = [var.VN-address[count.index]]
  tags          = var.tag
}

resource "azurerm_subnet" "Subnet" {
  name                  = var.sub-name[count.index]
  resource_group_name   = azurerm_resource_group.RG[count.index].name
  virtual_network_name  = azurerm_virtual_network.VN[count.index].name
  count = var.coun
  address_prefixes      = [var.sub-add[count.index]]
}
