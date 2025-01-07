variable "name" {}
variable "location" {}
variable "resource_group_name" {}
variable "app_service_plan_id" {
  description = "The ID of the App Service Plan to use for the Function App"
}
variable "storage_account_name" {
  description = "The name of the storage account to use for the Function App"
}
variable "storage_account_access_key" {
  description = "The access key for the storage account"
}
