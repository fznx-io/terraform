output "id" {
  description = "The ID of the virtual machine"
  value       = azurerm_linux_virtual_machine.this.id
}

output "name" {
  description = "The name of the virtual machine"
  value       = azurerm_linux_virtual_machine.this.name
}

output "vm_id" {
  description = "The unique ID of the virtual machine"
  value       = azurerm_linux_virtual_machine.this.virtual_machine_id
}

output "private_ip_address" {
  description = "The primary private IP address of the virtual machine"
  value       = azurerm_linux_virtual_machine.this.private_ip_address
}

output "public_ip_address" {
  description = "The primary public IP address of the virtual machine"
  value       = azurerm_linux_virtual_machine.this.public_ip_address
}
