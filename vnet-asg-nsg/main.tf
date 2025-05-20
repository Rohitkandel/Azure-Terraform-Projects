resource "azurerm_resource_group" "rg" {
    name= var.resource_group_name
    location = var.location

    tags = {
      Department= "IT"
    }
  
}

resource "azurerm_virtual_network" "vnets" {
    for_each = var.vnets
    name= each.key
    resource_group_name = azurerm_resource_group.rg.name
    location = var.location
    address_space = each.value.address_space
  

}

resource "azurerm_subnet" "subnets" {
  for_each = merge([for vnet, config in var.vnets : { for subnet, address in config.subnets : "${vnet}.${subnet}" => {
    vnet_name     = vnet
    subnet_name   = subnet
    address_range = address
  }}]...)

  name                 = each.value.subnet_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnets[each.value.vnet_name].name
  address_prefixes     = [each.value.address_range]
}

resource "azurerm_application_security_group" "asg_web" {
  location = var.location
  name=var.asg
  resource_group_name = azurerm_resource_group.rg.name
  
}

# Create Network Security Group
resource "azurerm_network_security_group" "nsg_secure" {
  location = var.location
  name = var.nsg
  resource_group_name = azurerm_resource_group.rg.name
   
}

# Associate NSG with subnet
resource "azurerm_subnet_network_security_group_association" "nsg_assoc" {
  subnet_id= azurerm_subnet.subnets["CoreServicesVnet.SharedServicesSubnet"].id
  network_security_group_id = azurerm_network_security_group.nsg_secure.id 

}

# Inbound rules - Allow ASG Traffic

resource "azurerm_network_security_rule" "inbound_allow_nsg" {
  name                        = "AllowASG"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_ranges     = ["80", "443"]
  source_application_security_group_ids = [azurerm_application_security_group.asg_web.id]
  destination_address_prefix   = "*"
  network_security_group_name  = azurerm_network_security_group.nsg_secure.name
  resource_group_name          = azurerm_resource_group.rg.name
}


# Outbound Rule - Deny Any to Internet on Port 8080
resource "azurerm_network_security_rule" "outbound_deny_custom" {
  name                        = "DenyAnyCustom8080Outbound"
  priority                    = 4096
  direction                   = "Outbound"
  access                      = "Deny"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_ranges     = ["8080"]
  source_address_prefix       = "*"
  destination_address_prefix  = "Internet"
  network_security_group_name = azurerm_network_security_group.nsg_secure.name
  resource_group_name         = azurerm_resource_group.rg.name
  
}

