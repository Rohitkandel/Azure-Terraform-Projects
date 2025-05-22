resource "azurerm_resource_group" "rg" {
    name= var.resource_group_name
    location = var.location
  
}

resource "azurerm_service_plan" "appplan" {
    name=var.service_plan_config["name"]
    location = var.location
    resource_group_name = azurerm_resource_group.rg.name
    os_type = var.service_plan_config["os_type"]
    sku_name = var.service_plan_config["sku_name"]
  
}

resource "azurerm_linux_web_app" "webappplanrig" {
    name= var.web_plan_config
    location = var.location
    resource_group_name = azurerm_resource_group.rg.name
    service_plan_id = azurerm_service_plan.appplan.id
    site_config {
      always_on = true
    }
  
}


resource "azurerm_linux_web_app_slot" "slot1" {
    name = var.stag_slot_name
    app_service_id = azurerm_linux_web_app.webappplanrig.id
    
    site_config {
      always_on = true
    }
      
    }

   
  
  resource "azurerm_app_service_source_control" "deploy_prodslot" {
  app_id   = azurerm_linux_web_app.webappplanrig.id
  repo_url = "https://github.com/Rohitkandel/awesome-terraform-bg"
   branch   = "master"
  
  }


resource "azurerm_app_service_source_control_slot" "deploy_stagslot" {
  slot_id   = azurerm_linux_web_app_slot.slot1.id
  repo_url = "https://github.com/Rohitkandel/awesome-terraform-bg"
   branch   = "appServiceSlot_Working_DO_NOT_MERGE"
  

}

# Swap slots
resource "azurerm_web_app_active_slot" "active_slot" {
  slot_id = azurerm_linux_web_app_slot.slot1.id

}





