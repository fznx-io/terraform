resource "azurerm_network_interface" "this" {
  name                           = var.name
  location                       = var.location
  resource_group_name            = var.resource_group_name
  accelerated_networking_enabled = var.enable_accelerated_networking
  ip_forwarding_enabled          = var.enable_ip_forwarding

  ip_configuration {
    name                          = var.ip_configuration.name
    subnet_id                     = var.ip_configuration.subnet_id
    private_ip_address_allocation = var.ip_configuration.private_ip_address_allocation
    private_ip_address            = try(var.ip_configuration.private_ip_address, null)
    public_ip_address_id          = try(var.ip_configuration.public_ip_address_id, null)
    primary                       = try(var.ip_configuration.primary, true)
  }

  tags = var.tags
}

resource "azurerm_network_interface_security_group_association" "this" {
  network_interface_id      = azurerm_network_interface.this.id
  network_security_group_id = var.network_security_group_id
}
