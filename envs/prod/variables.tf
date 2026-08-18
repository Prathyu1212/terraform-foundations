variable "location" {
  description = "Azure region to deploy into"
  type = string
  default = "centralindia"
}

variable "environment" {
  description = "Environment naming, used in resource naming"
  type = string
  default = "dev"

  validation {
    condition = contains(["dev", "staging", "prod"] , var.environment)
    error_message = "environment must be one of : dev, staging, prod."

  }
}

variable "vm_admin_username" {
  description = "Admin username to the VM"
  type = string
  default = "azureuser"
}

variable "SSH_public_key" {
  description = "SSH public key for VM login"
  type = string
}