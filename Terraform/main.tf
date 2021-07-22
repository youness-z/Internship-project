provider "azurerm" {
  features {
    
  }
}

terraform {
  backend "azurerm" {
    resource_group_name  = "Test"
    storage_account_name = "younesszaccouunt"
    container_name       = "younesszaccountcontainer"
    key                  = "Tfstate"
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

module "Data_Lake" {
  source = "./Data_lake"
  data_lake_name = "testingdatalake"
  resource_group_name = module.Basics.resource_group_name
  # location = module.Basics.location
  location = "northeurope"
}

module "Databricks" {
  source = "./Databricks"
  rg_name =  module.Basics.resource_group_name
  location = module.Basics.location
  
}

# module "VM" {
#   source = "./VM"
#   resource_group_name  = module.Basics.resource_group_name
#   location             = module.Basics.location
#   virtual_network_name = module.vnet.vnet_name
#   subnet_name          = module.vnet.subnet_name
#   virtual_machine_name = "vm-linux"
#   os_flavor                  = "linux"
#   linux_distribution_name    = "ubuntu1804"
#   virtual_machine_size       = "Standard_A2_v2"
#   generate_admin_ssh_key     = false
#   admin_ssh_key_data         = "~/.ssh/id_rsa.pub"
#   instances_count            = 1
#   enable_public_ip_address = true
#   nsg_inbound_rules = [
#     {
#       name                   = "ssh"
#       destination_port_range = "22"
#       source_address_prefix  = "*"
#     },

#     {
#       name                   = "http"
#       destination_port_range = "80"
#       source_address_prefix  = "*"
#     },
#   ]

  
# }