variable "resource_group_name" {
    description = "The name of the resource group"
    type = string
}

variable "location" {
    description = "The location of the resource group"
    type = string
    default = "France Central"
  
}

variable "tag" {
    description = "The tag that will be used for created resources"
    type = map(string)
    default = {
        Owner = "Youness Zarhali"
    }
}