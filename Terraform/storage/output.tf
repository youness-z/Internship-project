
output "storage_account_name" {
  value = azurerm_storage_account.storage.name
}

output "storage_type" {
    value = azurerm_storage_account.storage.access_tier
}