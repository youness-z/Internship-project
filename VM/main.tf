data "azurerm_resource_group" "rg" {
    name = var.resource_group_name
  
}

data "azurerm_virtual_network" "vnet" {
    name = var.vnet_name
    resource_group_name = data.azurerm_resource_group.rg.name

}

data "azurerm_subnet" "subnet" {
    name = var.subnet_name
    virtual_network_name = data.azurerm_virtual_network.vnet.name
    resource_group_name = data.azurerm_resource_group.rg.name
    
  
}

resource "azurerm_public_ip" "pip" {
    count = var.enable_public_ip == true ? var.instances_count : 0
    name = "${var.public_ip_name}"
    location = data.azurerm_resource_group.rg.location
    resource_group_name = data.azurerm_resource_group.rg.name
    allocation_method = "${var.public_ip_allocation_method}"
    sku = "${var.public_ip_sku}"
    tags = var.tags

}