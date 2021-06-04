# Select existing resource group otherwise, create one

# data "azurerm_resource_group" "rg" {
# #   count = var.create_resource_group == false ? 1 : 0
#   name  = var.resource_group_name
# #   location = var.resource_group_location
# }

# resource "azurerm_resource_group" "rg" {
#   count    = var.create_resource_group ? 1 : 0
#   name     = lower(var.resource_group_name)
#   location = var.resource_group_location
#   tags     = var.tags
# }

# Creating the storage accout 

resource "azurerm_storage_account" "storage" {
    name = "${var.storage_account_name}"
    resource_group_name = "${var.resource_group_name}"
    location = var.storage_location != null ? var.storage_location : var.resource_group_location
    account_tier             = "${var.account_tier_type}" #"Standard"
    account_replication_type = "${var.account_replication_type}"  # "LRS"

  
}
