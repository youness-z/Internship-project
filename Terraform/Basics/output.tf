output "resource_group_id" {
    value = azurerm_resource_group.rg.id
}

output "resource_group_name" {
    value = azurerm_resource_group.rg.name
}

output "location" {
    value = azurerm_resource_group.rg.location
  
}
output "resource_group_location" {
    value = azurerm_resource_group.rg.location
  
}
output "name_storage" {
    value = azurerm_storage_account.tfstate_account.name
  
}
output "storage_account_name" {
    value = azurerm_storage_account.tfstate_account.name
}

output "container_name" {
    value = azurerm_storage_container.tfstatecontainer.name
  
}
output "backend_key" {
    value = var.backend_key
  
}