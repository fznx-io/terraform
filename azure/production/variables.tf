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

# Public IP
variable "public_ip_name" {
  description = "Name of the public IP"
  type        = string
}

variable "public_ip_location" {
  description = "Location of the public IP"
  type        = string
}

variable "public_ip_domain_label" {
  description = "Domain name label for the public IP"
  type        = string
}

# Network Interface
variable "nic_name" {
  description = "Name of the network interface"
  type        = string
}

variable "nic_location" {
  description = "Location of the network interface"
  type        = string
}

# Virtual Machine
variable "vm_name" {
  description = "Name of the virtual machine"
  type        = string
}

variable "vm_location" {
  description = "Location of the virtual machine"
  type        = string
}

variable "vm_size" {
  description = "Size of the virtual machine"
  type        = string
}

variable "vm_admin_username" {
  description = "Admin username for the virtual machine"
  type        = string
}

variable "vm_admin_ssh_keys" {
  description = "List of SSH public keys for VM admin access"
  type        = list(string)
}

variable "vm_os_disk_name" {
  description = "Name of the VM OS disk"
  type        = string
}

variable "vm_os_disk_size_gb" {
  description = "Size of the OS disk in GB"
  type        = number
}

variable "vm_image_publisher" {
  description = "Publisher of the VM image"
  type        = string
}

variable "vm_image_offer" {
  description = "Offer of the VM image"
  type        = string
}

variable "vm_image_sku" {
  description = "SKU of the VM image"
  type        = string
}

variable "vm_image_version" {
  description = "Version of the VM image"
  type        = string
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
