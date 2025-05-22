variable "location" {
    type = string
    description = "Location of resources"
    default = "Australia Central"
    
 
}

variable "resource_group_name" {
    type = string
    description = "Name of rg"
    default = "rg-webapp"
  
}
/* variable "service_plan_config" {
    type = object({
      name = string
      os_type= string
      sku_name=string

    })
    description = "Configuration for the service plan"
    default = {
      name= "webappplan"
      os_type = "Linux"
      sku_name = "S1"
    }
  
} */

variable "service_plan_config" {
    type = map(string)
    description = "Configuration for the service plan"
    default = {
      name= "appplan"
      os_type = "Linux"
      sku_name = "S1"
    }
  
}

variable "web_plan_config" {
    type = string
    description = "Name of web app plan"
    default = "webplan78"
  
}

variable "stag_slot_name" {
    type = string
    description = "Name of stag slot"
    default = "staging-slot"
  
}

