resource "azurerm_linux_virtual_machine" "this" {
  name                            = var.name
  resource_group_name             = var.resource_group_name
  location                        = var.location
  size                            = var.vm_size
  admin_username                  = var.admin_username
  disable_password_authentication = var.disable_password_authentication
  network_interface_ids           = var.network_interface_ids

  dynamic "admin_ssh_key" {
    for_each = var.admin_ssh_keys
    content {
      username   = var.admin_username
      public_key = admin_ssh_key.value
    }
  }

  os_disk {
    name                 = var.os_disk.name
    caching              = var.os_disk.caching
    storage_account_type = var.os_disk.storage_account_type
    disk_size_gb         = var.os_disk.disk_size_gb
  }

  source_image_reference {
    publisher = var.source_image_reference.publisher
    offer     = var.source_image_reference.offer
    sku       = var.source_image_reference.sku
    version   = var.source_image_reference.version
  }

  # Managed storage account (no storage_account_uri), matching the live VM.
  dynamic "boot_diagnostics" {
    for_each = var.boot_diagnostics_enabled ? [1] : []
    content {}
  }

  tags = var.tags

  # source_image_reference is ForceNew and only matters at creation. Ignoring it
  # keeps an image bump (e.g. a deprecated marketplace offer) from destroying the
  # VM and its OS disk. Rebuild deliberately with `terraform apply -replace=...`.
  lifecycle {
    ignore_changes = [source_image_reference]
  }
}
