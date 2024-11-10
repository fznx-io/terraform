variable "name" {
  description = "The name of the public IP address"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The Azure region where the public IP should be created"
  type        = string
}

variable "allocation_method" {
  description = "Defines the allocation method for this IP address (Static or Dynamic)"
  type        = string
  default     = "Static"
}

variable "sku" {
  description = "The SKU of the Public IP (Basic or Standard)"
  type        = string
  default     = "Standard"
}

variable "ip_version" {
  description = "The IP version to use (IPv4 or IPv6)"
  type        = string
  default     = "IPv4"
}

variable "idle_timeout_in_minutes" {
  description = "Specifies the timeout for the TCP idle connection"
  type        = number
  default     = 4
}

variable "domain_name_label" {
  description = "Label for the Domain Name"
  type        = string
  default     = null
}

variable "ddos_protection_mode" {
  description = "The DDoS protection mode (VirtualNetworkInherited, Enabled, or Disabled)"
  type        = string
  default     = "VirtualNetworkInherited"
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
