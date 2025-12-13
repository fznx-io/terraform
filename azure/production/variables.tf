# Azure Configuration
variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}

# Resource Groups
variable "rg_production_name" {
  description = "Name of the production resource group"
  type        = string
}

variable "rg_production_location" {
  description = "Location of the production resource group"
  type        = string
}

variable "rg_network_watcher_name" {
  description = "Name of the network watcher resource group"
  type        = string
}

variable "rg_network_watcher_location" {
  description = "Location of the network watcher resource group"
  type        = string
}

variable "rg_cloud_shell_name" {
  description = "Name of the cloud shell storage resource group"
  type        = string
}

variable "rg_cloud_shell_location" {
  description = "Location of the cloud shell storage resource group"
  type        = string
}

# Virtual Network
variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string
}

variable "vnet_location" {
  description = "Location of the virtual network"
  type        = string
}

variable "vnet_address_space" {
  description = "Address space for the virtual network"
  type        = list(string)
}

variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
}

variable "subnet_address_prefixes" {
  description = "Address prefixes for the subnet"
  type        = list(string)
}

# Network Security Group
variable "nsg_name" {
  description = "Name of the network security group"
  type        = string
}

variable "nsg_location" {
  description = "Location of the network security group"
  type        = string
}

variable "ssh_rule_source_address_prefix" {
  description = "Source address prefix for SSH rule (use * for any or specify IP)"
  type        = string
}

# Virtual Machines
variable "virtual_machines" {
  description = "Map of virtual machine configurations"
  type = map(object({
    name                   = string
    location               = string
    size                   = string
    admin_username         = string
    os_disk_name           = string
    os_disk_size_gb        = number
    image_publisher        = string
    image_offer            = string
    image_sku              = string
    image_version          = string
    public_ip_name         = string
    public_ip_domain_label = string
    nic_name               = string
  }))
}

variable "vm_admin_ssh_keys" {
  description = "List of SSH public keys for VM admin access"
  type        = list(string)
}

# Storage Account
variable "storage_account_name" {
  description = "Name of the cloud shell storage account"
  type        = string
}

variable "storage_account_location" {
  description = "Location of the storage account"
  type        = string
}

# Tags
variable "tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default     = {}
}
