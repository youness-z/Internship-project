variable "prefix" {
    type = string
    description = "Prefix used for naming  convention "
    default = "backup-disk"
}

variable "resource_group_name" {
    type = string
    description = "The name of the resource group "
  
}
variable "location" {
    type = string
    description = "The location where the resources will be created"
}

variable "vm_id" {

}
variable "name_recovery" {
    type = string
    description = "The name of the recovery service vault"  
    default = "recov-vm"
}

variable "name_backup_policy_vm" {
    type = string
    description = "The name of the backup policy vm"
    default = "backup-policy"
}
variable "SKU" {
    type = string
    description = "The sku type "
    default = "Standard"
  
}


# variable "vm_id" {
#     type = string
#     description = "The id of the vm we are trying to backup"
# }
variable "weekdays" {
    type = list(string)
    description = "Weekdays for backup "
    default = [ "Friday" ]

}