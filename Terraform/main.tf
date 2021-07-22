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

terraform {
  backend "azurerm" {
    resource_group_name  = "Test"
    storage_account_name = "younesszaccouunt"
    container_name       = "younesszaccountcontainer"
    key                  = "Tfstate"
  }
}

# module "vnet" {
#     source = "./vnet"
#     resource_group_name = module.Basics.resource_group_name
#     address_space = ["10.0.0.0/16"]
#     subnet_prefixes = ["10.0.0.0/24"]
#     subnet_name = "subnet-1"
#     nsg_name = "NSG_test"
#     nsg_location = module.Basics.resource_group_location
# }

module "Data_Lake" {
  resource_group_name = module.Basics.resource_group_name
  location = module.Basics.location
  source = "./Data_lake"
  data_lake_name = "testingdatalake"
  
 
}

module "Databricks" {
  source = "./Databricks"
  rg_name =  module.Basics.resource_group_name
  location = module.Basics.location
  
}
