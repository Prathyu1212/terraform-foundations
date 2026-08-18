variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "environment" {
  type = string
}

variable "subnet_id" {
    type = string
    description = "Subnet id to attach NIC into - comes from networking module"
}

variable "vm_admin_username" {
  type = string
  default = "azureuser"
}

variable "ssh_public_key" {
  type = string
}

variable "vm_size" {
  type = string
  default = "Standard_DC1ds_v3"
}

