variable "name" {
  description = "The name of the network interface"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The Azure region where the NIC should be created"
  type        = string
}

variable "enable_accelerated_networking" {
  description = "Should Accelerated Networking be enabled"
  type        = bool
  default     = false
}

variable "enable_ip_forwarding" {
  description = "Should IP Forwarding be enabled"
  type        = bool
  default     = false
}

variable "ip_configuration" {
  description = "The IP configuration for this NIC"
  type = object({
    name                          = string
    subnet_id                     = string
    private_ip_address_allocation = string
    private_ip_address            = optional(string)
    public_ip_address_id          = optional(string)
    primary                       = optional(bool)
  })
}

variable "network_security_group_id" {
  description = "The ID of the Network Security Group to associate with the NIC"
  type        = string
  default     = null
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
