resource "azurerm_static_site" "main" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_tier            = "Free"

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_static_site_build" "main" {
  static_site_id = azurerm_static_site.main.id
  app_location   = var.app_location
  api_location   = var.api_location
  output_location = var.output_location
}
