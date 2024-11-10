resource "azurerm_public_ip" "this" {
  name                    = var.name
  location                = var.location
  resource_group_name     = var.resource_group_name
  allocation_method       = var.allocation_method
  sku                     = var.sku
  ip_version              = var.ip_version
  idle_timeout_in_minutes = var.idle_timeout_in_minutes
  domain_name_label       = var.domain_name_label
  ddos_protection_mode    = var.ddos_protection_mode
  tags                    = var.tags
}
