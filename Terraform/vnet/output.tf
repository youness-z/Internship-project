output "vnet_name" {
    description = "the name of the vnet that has just been created"
    value = azurerm_virtual_network.vnet.name
}

output "vnet_location" {
    description = "The location of the vnet"
    value = azurerm_virtual_network.vnet.location
}

output "vnet_address_space" {
  description = "The address space of the newly created vNet"
  value       = azurerm_virtual_network.vnet.address_space
}

output "subnet_name" {
  description = "The name of subnet created inside the newl vnet"
  value       = azurerm_subnet.subnet.name
}

output "subnet_address_space" {
  description = "The address space of the newly created vNet"
  value       = azurerm_subnet.subnet.address_prefixes
}