variable "name" {}
variable "location" {}
variable "resource_group_name" {}
variable "subnet_id" {}
variable "vm_size" {
  description = "Size of the VM"
  validation {
    condition     = can(regex("^Standard_", var.vm_size))
    error_message = "VM size must start with 'Standard_'"
  }
}
variable "data_disk_size" {
  description = "Size of the data disk in GB"
  validation {
    condition     = var.data_disk_size >= 32 && var.data_disk_size <= 4096
    error_message = "Data disk size must be between 32 and 4096 GB"
  }
}
variable "admin_username" {}
variable "ssh_public_key" {
  description = "SSH public key for VM authentication"
}
variable "nsg_id" {
  description = "ID of the Network Security Group"
}
