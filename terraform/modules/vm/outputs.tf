output "public_ip" {
  value = azurerm_public_ip.main.ip_address
}

output "name" {
  value = azurerm_linux_virtual_machine.main.name
}
