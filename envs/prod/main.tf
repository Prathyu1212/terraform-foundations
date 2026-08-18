terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
backend "azurerm" {
  resource_group_name = "rg-terraform-state"
  storage_account_name = "sttffoundation2787"
  container_name = "tfstate"
  key = "foundations-prod.terraform.tfstate"
}

}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "foundations_rg" {
  name = "rg-terraform-foundation-${var.environment}"
  location = var.location
}

module "networking" {
  source = "../../modules/networking"

  resource_group_name = azurerm_resource_group.foundations_rg.name
  location = azurerm_resource_group.foundations_rg.location
  environment = var.environment
}

module "compute" {
  source = "../../modules/compute"


  resource_group_name = azurerm_resource_group.foundations_rg.name
  location = azurerm_resource_group.foundations_rg.location
  environment = var.environment
  subnet_id = module.networking.subnet_id
  vm_admin_username = var.vm_admin_username
  ssh_public_key = var.SSH_public_key
  vm_size               = "Standard_DC1s_v3"
}

