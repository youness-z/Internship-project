data "azurerm_resource_group" "rg" {
    name = var.resource_group_name
    location = var.location
}

resource "azurerm_powerbi_embedded" "power_bi" {
    name = "${var.name}"
    location = data.azurerm_resource_group.rg.location
    resource_group_name = data.azurerm_resource_group.rg.name
    sku_name = var.sku_name
    administrators = var.list_administrators
}