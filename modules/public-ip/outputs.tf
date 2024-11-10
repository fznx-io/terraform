output "id" {
  description = "The ID of the public IP address"
  value       = azurerm_public_ip.this.id
}

output "name" {
  description = "The name of the public IP address"
  value       = azurerm_public_ip.this.name
}

output "ip_address" {
  description = "The IP address value that was allocated"
  value       = azurerm_public_ip.this.ip_address
}

output "fqdn" {
  description = "Fully qualified domain name of the A DNS record"
  value       = azurerm_public_ip.this.fqdn
}
