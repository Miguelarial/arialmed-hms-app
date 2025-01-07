output "vm_public_ip" {
  value = module.vm.public_ip
}

output "vm_name" {
  value = module.vm.name
}

output "function_app_url" {
  value = module.azure_functions.function_app_url
}

output "static_web_app_url" {
  value = module.static_web_app.static_site_url
}