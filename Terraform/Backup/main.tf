resource "azurerm_recovery_services_vault" "recov_service_vault" {
  name                = join("-", [var.prefix, var.name_recovery])
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "${var.SKU}"
}

resource "azurerm_backup_policy_vm" "backup_policy_vm" {
  name                = join("-", [var.prefix, var.name_backup_policy_vm])
  resource_group_name = var.resource_group_name
  recovery_vault_name = azurerm_recovery_services_vault.recov_service_vault.name
  retention_daily {
    count = 10
  }
  timezone = "UTC"
  backup {
    frequency = "Daily"
    time      =  "12:30"
    # weekdays  =  var.weekdays
  }
}

resource "azurerm_backup_protected_vm" "vm1" {
  resource_group_name = var.resource_group_name
  recovery_vault_name = azurerm_recovery_services_vault.recov_service_vault.name
  source_vm_id        = var.vm_id 
  backup_policy_id    = azurerm_backup_policy_vm.backup_policy_vm.id
}