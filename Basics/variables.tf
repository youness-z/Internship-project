variable "resource_group_name" {
    description = "The name of the resource group"
    type = string
}

variable "location" {
    description = "The location of the resource group"
    type = string
    default = "France Central"
  
}

variable "replication_type" {
    description = "The replication type of the storage account"
    type = string
    default = "LRS"
}

variable "name_storage" {
    description = "The name of the storage account"
    type = string
}

variable "container_name" {
    description = "The name of the container where the tfstate will be stored"
    type = string
}

variable "backend_key" {
    description = "The key that will be used for the tfstate file"
}

variable "key_vault_name" {
    description = "The name of the key vault"
    type = string
}
variable "tag" {
    description = "The tag that will be used for created resources"
    type = map(string)
    default = {
        Owner = "Youness Zarhali"
    }
}