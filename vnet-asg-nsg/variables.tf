variable "resource_group_name" {
    description = "Name of the resource group"
    type = string
    default = "az894-rg"
  
}

variable "location" {
    description = "Location of rg and resources"
    type = string
    default = "East US"
  
}

variable "vnets" {
    description = "Vnet details"
    type = map(object({
      address_space = list(string)
      subnets= map(string)
    }))
    default = {
      "CoreServicesVnet" = {
        address_space= ["10.20.0.0/16"]
        subnets={
            SharedServicesSubnet = "10.20.10.0/24"
            DatabaseSubnet       = "10.20.20.0/24"
        }
        
      }
      "SharedServicesSubnet"={
        address_space=["10.30.0.0/16"]
        subnets={
            SensorSubnet1="10.30.20.0/24"
            SensorSubnet2="10.30.21.0/24"
        }
      }
    }
  
}

variable "asg" {
  description = "Application Security Group"
  type = string
  default = "asg-web"
  
}

variable "nsg" {
  description = "NSG"
  type = string
  default = "myNSGSecure"
  
}