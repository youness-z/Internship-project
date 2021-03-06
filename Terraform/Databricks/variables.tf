variable "prefix" {
  description = "This prefix will be used in the name of most resources"
  type = string
  default = "Data-architecture"
}

variable "location" {
  description = " The region"
  type = string
  default = "France Central"
}

variable "rg_name" {
    description = "The name of the resource group where the databricks will be created"
    type = string
}




variable "databricks_spark_version" {
  description = "The spark version for the databricks "
  default = "7.2.x-scala2.12"
  
}
variable "tags" {
    description = "The tags that will be used for the created resource"
    type = map(string)
    default = {
      Owner = "Youness Zarhali"
    }
  
}