variable "resource_group_name" {
    description = "The name of the resource group"
    type = string
    default = ""
}

variable "monitoring_storage_name" {
    description = "The name of the monitoring storage account"
    type = string
    default = ""
  
}

variable "account_tier" {
    description = "The account tier of the storage account "
    type = string
    default = "Standard"
  
}

variable "account_replication_type" {
    description = "The account replication type"
    type = string
    default = "LRS"
  
}