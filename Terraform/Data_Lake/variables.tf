variable "data_lake_name" {
    description = "The name of the data lake storage"
    type = string
    default = "data-lake"
}


variable "resource_group_name" {
    description = "The name of the resource group where the data lake will created"
    type = string
}

variable "location" {
    description = "The region where the data lake will be created"
    type = string
    default = "France Central"
}

variable "tag" {
  description = "Tag that will be used for this resource"
  type = map(string)
  default = {
      Owner = "Youness Zarhali"
  }
}