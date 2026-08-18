variable "resource_group_name" {
  description = "Name of the resource group to deploy into"
  type = string
}

variable "location" {
  description = "Azure region"
  type = string
}

variable "environment" {
    description = "Environment name , used in resource naming"
    type = string
}

variable "address_space" {
  description = "Vnet address space"
  type = list(string)
  default = [ "10.0.0.0/16" ]
}

variable "subnet_prefix" {
  description = "Subnet address prefix"
  type = list(string)
  default = [ "10.0.1.0/24" ]
}