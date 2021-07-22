variable "resource_group_name" {
    description = "The name of the resource group"
    type = string
    default = ""
}

variable "location" {
    description = "The location where the resource will be stored"
    type = string
    default = ""
  
}

variable "name" {
    description = "the name of the power bi"
    type = string
  
}
variable "sku_name" {
    description = "The PowerBi pricing level sku "
    type = string
    default = "A1"
  
}
variable "tags" {
    description = "the tag related to the resource"
    type = map(string)
    default = {
      "Owner" = "Youness Zarhali"
    }
}

variable "list_administrators" {
    description = "A set of administrator user identieties which manages the Power BI"
    type = list(string)
    default = [ "youness.zarhali@avanade.com" ]
  
}