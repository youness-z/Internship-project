resource "azurerm_storage_account" "storage" {
    name = "${var.storage_account_name}"
    resource_group_name = "${var.resource_group_name}"
    location = var.storage_location != null ? var.storage_location : var.resource_group_location
    account_tier             = "${var.account_tier_type}" #"Standard"
    account_replication_type = "${var.account_replication_type}"  # "LRS"

  
}
