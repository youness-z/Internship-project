resource "azurerm_virtual_network" "vnet" {
    name = var.vnet_name
    resource_group_name = "${var.resource_group_name}"
    location = "${var.nsg_location}"
    address_space = var.address_space
    dns_servers = var.dns_servers
    tags = var.tags
}

resource "azurerm_subnet" "subnet" {
    name = "${var.subnet_name}"
    resource_group_name = "${var.resource_group_name}"
    virtual_network_name = azurerm_virtual_network.vnet.name
    address_prefixes = "${var.subnet_prefixes}"
    
}
# Adding the network security resource

resource "azurerm_network_security_group" "nsg" {
  name = "${var.nsg_name}"
  location = "${var.nsg_location}"
  resource_group_name = "${var.resource_group_name}"
  tags = var.tags
  
}