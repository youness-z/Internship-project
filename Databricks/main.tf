terraform {
  required_providers {
      azurerm = {
          source = "hashicorp/azurerm"
      }
      databricks = {
          source = "databrickslabs/databricks"
      }
  }
}

provider "azurerm" {
    features {}
}
provider "databricks" {  }

resource "azurerm_databricks_workspace" "databricks" {
  name                = "${var.prefix}-databricks"
  resource_group_name = "${var.rg_name}"
  location            = "${var.location}"
  sku                 = "standard"
  tags= var.tags
}