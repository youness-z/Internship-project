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

resource "azurerm_databricks_workspace" "databricks" {
  name                = "${var.prefix}-databricks"
  resource_group_name = "${var.rg_name}"
  location            = "${var.location}"
  sku                 = "standard"
  tags= var.tags
}


# resource "databricks_cluster" "cluster" {
#   spark_version = var.databricks_spark_version
#   cluster_name = "db-cluster"
#   autotermination_minutes = 15
#   autoscale {
#     min_workers = 1
#     max_workers = 5
#   }

# }