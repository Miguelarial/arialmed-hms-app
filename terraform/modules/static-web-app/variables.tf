variable "name" {}
variable "location" {}
variable "resource_group_name" {}
variable "app_location" {
  description = "Location of the app source code"
}
variable "api_location" {
  description = "Location of the API source code"
}
variable "output_location" {
  description = "Location of the build output"
}
