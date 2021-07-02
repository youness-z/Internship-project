variable "resource_group_name" {
    description = "The name of the container that will hold the azure solution"
    type = string
    default = ""
      
}

variable "location" {
    description = "The location of the virtual machine"
    type = string
    default = ""      
}

variable "instances_count" {
    description = "The number of vm required"
    type = integer
    default = 1
}

variable "vnet_name" {
    description = "The name of the virtual network"
    type = string
    default = ""
  
}

variable "subnet_name" {
    description = "The name of the subnet"
    type = string
    default = ""
  
}


variable "enable_public_ip" {
    description = "enabling the association between a public ip and a NIC"
    default = null
    type = bool 
}

variable "public_ip_name" {
    description = "The name of the public ip"
    type = string
    default = ""
  
}

variable "public_ip_allocation_method" {
    description = "The public ip allocation method used for the ip address"
    type = string
    default = "Static"
  
}
variable "public_ip_sku" {
    description = "The sky of the ip address"
    type = string
    default = "Standard"
}

variable "enable_ip_forwarding" {
    description = "Should the ip forwarding be enabled"
    type = bool
    default = false
}

variable "enable_accelerated_networking" {
    description = "Should the accelerated networking be enabled"
    type = bool
    default = false 
}

variable "dns_servers" {
    description = "The list of the dns servers to use for the network interface"
    type = list
    default = []
  
}

variable "virtual_machine_name" {
    description = "The name of the virtual machine"
    type = string
    default = ""
}

variable "source_image_id" {
  description = "The ID of an Image which each Virtual Machine should be based on"
  default     = null
}

variable "custom_image" {
  description = "Provide the custom image to this module if the default variants are not sufficient"
  type = map(object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  }))
  default = null
}

variable "linux_distribution_list" {
  description = "Pre-defined Azure Linux VM images list"
  type = map(object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  }))

  default = {
    ubuntu1604 = {
      publisher = "Canonical"
      offer     = "UbuntuServer"
      sku       = "16.04-LTS"
      version   = "latest"
    },

    ubuntu1804 = {
      publisher = "Canonical"
      offer     = "UbuntuServer"
      sku       = "18.04-LTS"
      version   = "latest"
    },

    centos75 = {
      publisher = "OpenLogic"
      offer     = "CentOS"
      sku       = "7.5"
      version   = "latest"
    },

    centos77 = {
      publisher = "OpenLogic"
      offer     = "CentOS"
      sku       = "7.7"
      version   = "latest"
    },

    centos81 = {
      publisher = "OpenLogic"
      offer     = "CentOS"
      sku       = "8_1"
      version   = "latest"
    }
  }
}

variable "virtual_machine_size" {
  description = "The Virtual Machine SKU for the Virtual Machine, Default is Standard_A2_V2"
  default     = "Standard_A2_v2"
}

variable "linux_distribution_name" {
  default     = "ubuntu1804"
  description = "Variable to pick an OS flavour for Linux based VM. Possible values include: centos8, ubuntu1804"
}

variable "os_disk_storage_account_type" {
  description = "The Type of Storage Account which should back this the Internal OS Disk. Possible values include Standard_LRS, StandardSSD_LRS and Premium_LRS."
  default     = "StandardSSD_LRS"
}

variable "enable_ultra_ssd_data_disk_storage_support" {
  description = "Should the capacity to enable Data Disks of the UltraSSD_LRS storage account type be supported on this Virtual Machine"
  default     = false
}
variable "generate_admin_ssh_key" {
  description = "Generates a secure private key and encodes it as PEM."
  default     = true
}

variable "admin_ssh_key_data" {
  description = "specify the path to the existing SSH key to authenticate Linux virtual machine"
  default     = ""
}

variable "disable_password_authentication" {
  description = "Should Password Authentication be disabled on this Virtual Machine? Defaults to true."
  default     = true
}

variable "admin_username" {
  description = "The username of the local administrator used for the Virtual Machine."
  default     = "azureadmin"
}

variable "admin_password" {
  description = "The Password which should be used for the local-administrator on this Virtual Machine"
  default     = null
}


variable "hub_storage_account_name" {
  description = "The name of the hub storage account to store logs"
  default     = null
}

variable "random_password_length" {
  description = "The desired length of random password created by this module"
  default     = 24
}

variable "virtual_machine_name" {
    description = "The name of the virtual machine"
    type = string
    default = ""
  
}
variable "tags" {
    description = "The tag that will be used for the resource"
    type = map(string)
    default = {
        Owner = "Youness"
    }
}