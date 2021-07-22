resource "azurerm_data_lake_store" "data_lake" {
    name = "${var.data_lake_name}"
    resource_group_name = "${var.resource_group_name}"
    location = "${var.location}"
    encryption_state = "Enabled"
    encryption_type = "ServiceManaged"
    tags = var.tag
}
