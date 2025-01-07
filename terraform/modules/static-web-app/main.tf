resource "azurerm_static_site" "main" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_tier            = "Free"
}