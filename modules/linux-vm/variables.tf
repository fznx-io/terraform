variable "name" {
  description = "The name of the virtual machine"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The Azure region where the VM should be created"
  type        = string
}

variable "vm_size" {
  description = "The size of the virtual machine"
  type        = string
}

variable "admin_username" {
  description = "The admin username for the VM"
  type        = string
}

variable "disable_password_authentication" {
  description = "Should password authentication be disabled"
  type        = bool
  default     = true
}

variable "admin_ssh_keys" {
  description = "List of SSH public keys for admin access"
  type        = list(string)
  default     = []
}

variable "network_interface_ids" {
  description = "List of network interface IDs to attach to the VM"
  type        = list(string)
}

variable "os_disk" {
  description = "OS disk configuration"
  type = object({
    name                 = string
    caching              = string
    storage_account_type = string
    disk_size_gb         = number
  })
}

variable "source_image_reference" {
  description = "Source image reference"
  type = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
