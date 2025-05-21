# Define resource group
resource "azurerm_resource_group" "rg" {
    name = "az104-rg5"
    location = "East Us"
  
}
# Define Vnet1: "CoreServicesVnet"
resource "azurerm_virtual_network" "vnet1" {
    name = "CoreServicesVnet"
    location = azurerm_resource_group.rg.location
    address_space = ["10.0.0.0/16"]
    resource_group_name = azurerm_resource_group.rg.name
  
}

# Define subnet1: "Core"
resource "azurerm_subnet" "subnet1" {
    name= "Core"
    resource_group_name = azurerm_resource_group.rg.name
    virtual_network_name = azurerm_virtual_network.vnet1.name
    address_prefixes = ["10.0.0.0/24"]
  
}

# Define Vnet2: "ManufacturingVnet" 
resource "azurerm_virtual_network" "vnet2" {
    resource_group_name = azurerm_resource_group.rg.name
    name="ManufacturingVnet"
    location = azurerm_resource_group.rg.location
    address_space = ["172.16.0.0/16"]
  
}

# Define subnet2: "Manufacturing"
resource "azurerm_subnet" "subnet2" {
    name="Manufacturing"
    resource_group_name = azurerm_resource_group.rg.name
    virtual_network_name = azurerm_virtual_network.vnet2.name
    address_prefixes = ["172.16.0.0/24"]
  
}


# VNet Peering to enable communication between VNets
resource "azurerm_virtual_network_peering" "peer1" {
    name="peer1to2"
    resource_group_name = azurerm_resource_group.rg.name
    virtual_network_name = azurerm_virtual_network.vnet1.name
    remote_virtual_network_id = azurerm_virtual_network.vnet2.id 
  
}

resource "azurerm_virtual_network_peering" "peer2" {
    name="peer2to1"
    resource_group_name = azurerm_resource_group.rg.name
    virtual_network_name = azurerm_virtual_network.vnet2.name
    remote_virtual_network_id = azurerm_virtual_network.vnet1.id 
  
}

# Network Watcher for monitoring traffic
resource "azurerm_network_watcher" "nw" {
    name="network-watcher"
    location = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
    
  
}



