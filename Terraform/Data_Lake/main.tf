resource "azurerm_storage_account" "storage-data-lake-example" {
  name                     = "datalakeaccountyounessz"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
  is_hns_enabled           = "true"
}

resource "azurerm_data_lake_store" "datalake" {
  name                = "datalakestore"
  resource_group_name = var.resource_group_name
  location            = "North Europe"
  encryption_state    = "Enabled"
  encryption_type     = "ServiceManaged"
}

resource "azurerm_data_factory" "df" {
  name                = "${var.data_lake_name}"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tag

  identity {
    type = "SystemAssigned"
  }

}


data "azurerm_client_config" "current" {
  
}

