variable "resource_group_name" {
  description = "The name of the resource group "
  type = string 
}

variable "rg_location" {
    description = "The location of the resource group"
    type = string
    default = "France Central"
  
}

variable "vnet_name" {
    description = "The name of the vnet that will be created"
    type = string
    default = "vnet-1"
}

variable "vnet_location" {
    description = "The location of the subnet"
    type = string
    default = "France Central"
}

variable "address_space" {
    description = " Address space that will be used by the vnet"
    type = list(string)
    default = ["10.0.0.0/16"]
}

variable "subnet_prefixes" {
    description = "The address space that will ben used by the subvnet"
    type = list(string)
    default = ["10.0.0.0/24"]
}

variable "subnet_name" {
    description = "The name of the subnet"
    type = string
    default = "subnet1"
}

variable "dns_servers" {
    description = "The dns servers"
    type = list(string)
    default = []
}


variable "nsg_name" {
    description = "The name of the network security group"
    type = string
}

variable "tags" {
    description = "The tag that will be used for the resource"
    type = map(string)
    default = {
        Owner = "Youness"
    }
}