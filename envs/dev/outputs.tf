output "resource_group_name" {
  value = azurerm_resource_group.foundations_rg.name
}

output "vm_public_ip" {
  value = module.compute.vm_public_ip
}

output "vnet_id" {
  value = module.networking.vnet_id
}




