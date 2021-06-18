provider "azurerm" {
  features {
    
  }
}

module "Basics" {
  source = "./Basics"
  resource_group_name = "Test"
  name_storage = "younesszaccouunt"
  container_name = "younesszaccountcontainer"
  backend_key = "Key"
  key_vault_name = "younesszaccountvault"
  
}
module "vnet" {
    source = "./vnet"
    resource_group_name = module.Basics.resource_group_name
    address_space = ["10.0.0.0/16"]
    subnet_prefixes = ["10.0.0.0/24"]
    subnet_name = "subnet-1"
    nsg_name = "NSG_test"
    nsg_location = module.Basics.resource_group_location
}
