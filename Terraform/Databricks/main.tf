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

resource "databricks_instance_pool" "pool" {
  instance_pool_name = var.instance_pool_name
  min_idle_instances = 0
  max_capacity = 10
  node_type_id = var.databricks_node_type
  enable_elastic_disk = true
  preloaded_spark_versions = var.databricks_spark_version

}

resource "databricks_cluster" "cluster" {
  spark_version = var.databricks_spark_version
  cluster_name = "db-cluster"
  autotermination_minutes = 15
  instance_pool_id = databricks_instance_pool.pool.id
  autoscale {
    min_workers = 1
    max_workers = 5
  }

}