provider "azurerm" {
  features{
    key_vault{
      purge_soft_delete_on_destroy = true
    }
  }
}

# Resource group that will contain all the infrastructure 
resource "azurerm_resource_group" "rg" {
  name     = "${var.resource_group_name}"
  location = "${var.location}"
  tags = var.tag
}
 # Backend configuration (storage account + storage container + backend)
resource "azurerm_storage_account" "tfstate_account" {
  name = "${var.name_storage}"
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  account_tier = "Standard"
  account_replication_type = "${var.replication_type}"
  tags = var.tag
}

resource "azurerm_storage_container" "tfstatecontainer" {
  name = "${var.container_name}"
  storage_account_name = azurerm_storage_account.tfstate_account.name
  container_access_type = "private"
  
}

# terraform {
#   backend "azurerm" {
#     resource_group_name  = azurerm_resource_group.rg.name
#     storage_account_name = azurerm_storage_account.tfstate_account.name
#     container_name       = azurerm_storage_container.tfstate_container.name
#     key                  = "${var.backend_key}"
#   }
# }

# Azure key vault 
data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "key_vault" {
  name = "${var.key_vault_name}"
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku_name = var.sku_name
  enabled_for_disk_encryption = true
  tenant_id = data.azurerm_client_config.current.tenant_id
  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get",
    ]

    storage_permissions = [
      "Get",
    ]
  }
  
}