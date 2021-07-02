data "azurerm_resource_group" "rg" {
    name = var.resource_group_name
}

resource "azurerm_storage_account" "storagem" {
    name = "${var.monitoring_storage_name}"
    resource_group_name = data.azurerm_resource_group.rg.name
    location = data.azurerm_resource_group.rg.location
    account_tier = "${var.account_tier}"
    account_replication_type = "${var.account_replication_type}"
}