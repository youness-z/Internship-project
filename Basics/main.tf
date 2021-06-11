provider "azurerm" {
  features{
    key_vault{
      purge_soft_delete_on_destroy = true
    }
  }
}
resource "azurerm_resource_group" "rg" {
  name     = "${var.resource_group_name}"
  location = "${var.rg_location}"
  tags = var.tag
}

data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "key_vault" {
  name = "${var.name}"
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
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