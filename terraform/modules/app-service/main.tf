resource "azurerm_app_service_plan" "main" {
  name                = "${var.name}-plan"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku {
    tier = "Free"
    size = "F1"
  }
}

resource "azurerm_app_service" "main" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  app_service_plan_id = azurerm_app_service_plan.main.id
}
