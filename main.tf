provider "azurerm" {
  features {
    
  }
}

module "vnet" {
    source = "./vnet"
    resource_group_name = "Test"
    address_space = ["10.0.0.0/16"]
    subnet_prefixes = ["10.0.0.0/24"]
    subnet_name = "subnet-1"
}

module "storage" {
  source = "./storage"
  resource_group_name = module.vnet.resource_group_name
  storage_account_name = "younesszaccouunt"
  
  
}