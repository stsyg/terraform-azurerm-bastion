# Create resource group
resource "azurerm_resource_group" "infrarg" {
  name     = var.rg_name
  location = var.deploy_location

  tags = var.default_tags
}

data "azurerm_virtual_network" "infravnet" {
  name                = var.name_vnet
  resource_group_name = var.rg_vnet
}

resource "azurerm_subnet" "infrasubnet" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = azurerm_resource_group.infravnet.resource_group_name
  virtual_network_name = azurerm_virtual_network.infravnet.name
  address_prefixes     = [var.prefix_subnet]
}

resource "azurerm_public_ip" "infrabastionpip" {
  name                = var.bastion_pip_name
  location            = azurerm_resource_group.infrarg.location
  resource_group_name = azurerm_resource_group.infrarg.name
  allocation_method   = "Static"
  sku                 = "Standard"

  tags = var.default_tags
}

resource "azurerm_bastion_host" "infrabastionhost" {
  name                = var.bastion_host_name
  location            = azurerm_resource_group.infrarg.location
  resource_group_name = azurerm_resource_group.infrarg.name

  ip_configuration {
    name                 = var.ip_configuration_name
    subnet_id            = azurerm_subnet.infrasubnet.id
    public_ip_address_id = azurerm_public_ip.infrabastionpip.id
  }

  tags = var.default_tags
}