variable "create_resource_group" {
    description = "Whether we should create a rg or not"
    type = bool
    default = false
}

variable "resource_group_name" {
    description = "The name of the resource group"
    type = string
}

variable "resource_group_location" {
    description = "The region where the resource group will be created"
    type = string
    default = "France Central"
}

variable "storage_account_name" {
    description = "The name of the storage account"
    type = string
}

variable "storage_location" {
    description = "The location of the storage account"
    type = string
    default = "France Central"
}

variable "account_tier_type" {
    description = "The account tier type of the storage account"
    type = string
    default = "Standard"
}

variable "account_replication_type" {
    description = "The account replication type"
    type = string
    default = "LRS"
  
}
variable "tags" {
    description = "The tag that will be used for the resource"
    type = map(string)
    default = {
        Owner = "Youness"
    }
}