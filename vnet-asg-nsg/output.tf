output "created_vnets" {
  value = [for vnet in azurerm_virtual_network.vnets : vnet.name]
}

output "created_subnets" {
  value = [for subnet in azurerm_subnet.subnets : subnet.name]
}

output "application_security_group" {
    value = azurerm_application_security_group.asg_web.name
  
}

output "network_security_group" {
    value = azurerm_network_security_group.nsg_secure.name
  
}