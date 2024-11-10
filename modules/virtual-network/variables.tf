variable "name" {
  description = "The name of the virtual network"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The Azure region where the virtual network should be created"
  type        = string
}

variable "address_space" {
  description = "The address space for the virtual network"
  type        = list(string)
}

variable "subnets" {
  description = "Map of subnets to create"
  type = map(object({
    name                                          = string
    address_prefixes                              = list(string)
    private_endpoint_network_policies             = optional(string)
    private_link_service_network_policies_enabled = optional(bool)
  }))
  default = {}
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
