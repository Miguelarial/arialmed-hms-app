resource "random_string" "unique" {
  length  = 8
  special = false
  upper   = false
}

module "resource_group" {
  source  = "./modules/resource-group"
  name    = "arialmed-infra-rg"
  location = var.region
}

module "vnet" {
  source              = "./modules/vnet"
  name                = "arialmed-vnet"
  cidr                = "10.0.0.0/16"
  subnet_name         = "default-subnet"
  subnet_cidr         = "10.0.0.0/24"
  resource_group_name = module.resource_group.name
  location            = var.region
}

module "nsg" {
  source              = "./modules/nsg"
  name                = "arialmed-nsg"
  resource_group_name = module.resource_group.name
  location            = var.region
}

module "vm" {
  source              = "./modules/vm"
  name                = "arialmed-vm"
  location            = var.region
  resource_group_name = module.resource_group.name
  subnet_id           = module.vnet.subnet_id
  vm_size             = "Standard_D2s_v3"
  admin_username      = "azureuser"
  ssh_public_key      = file("~/.ssh/id_rsa.pub")
  nsg_id              = module.nsg.id
  data_disk_size      = 50
}

module "static_web_app" {
  source              = "./modules/static-web-app"
  name                = "arialmed-static-web-app"
  location            = "westeurope"
  resource_group_name = module.resource_group.name
  app_location        = "app"
  api_location        = "api"
  output_location     = "build"
}

resource "azurerm_service_plan" "main" {
  name                = "arialmed-app-plan"
  location            = var.region
  resource_group_name = module.resource_group.name
  os_type             = "Linux"
  sku_name            = "Y1"  
}

module "azure_functions" {
  source              = "./modules/az-functions"
  name                = "arialmed-functions-${random_string.unique.result}"
  location            = var.region
  resource_group_name = module.resource_group.name
  app_service_plan_id = azurerm_service_plan.main.id
  storage_account_name = "arialmedfn${random_string.unique.result}"
}