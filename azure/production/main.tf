# Resource Groups
module "rg_production" {
  source = "../../modules/resource-group"

  name     = var.rg_production_name
  location = var.rg_production_location
  tags     = var.tags
}

module "rg_network_watcher" {
  source = "../../modules/resource-group"

  name     = var.rg_network_watcher_name
  location = var.rg_network_watcher_location
  tags     = var.tags
}

module "rg_cloud_shell_storage" {
  source = "../../modules/resource-group"

  name     = var.rg_cloud_shell_name
  location = var.rg_cloud_shell_location
  tags     = var.tags
}

# Virtual Network
module "vnet_vm_01" {
  source = "../../modules/virtual-network"

  name                = var.vnet_name
  resource_group_name = module.rg_production.name
  location            = var.vnet_location
  address_space       = var.vnet_address_space

  subnets = {
    default = {
      name                                          = var.subnet_name
      address_prefixes                              = var.subnet_address_prefixes
      private_endpoint_network_policies             = "Disabled"
      private_link_service_network_policies_enabled = true
    }
  }

  tags = var.tags
}

# Network Security Group
module "nsg_vm_01" {
  source = "../../modules/network-security-group"

  name                = var.nsg_name
  resource_group_name = module.rg_production.name
  location            = var.nsg_location

  security_rules = {
    ssh = {
      name                       = "SSH"
      priority                   = 300
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = var.ssh_rule_source_address_prefix
      destination_address_prefix = "*"
    }
  }

  tags = var.tags
}

# Public IP
module "pip_vm_01" {
  source = "../../modules/public-ip"

  name                    = var.public_ip_name
  resource_group_name     = module.rg_production.name
  location                = var.public_ip_location
  allocation_method       = "Dynamic"
  sku                     = "Basic"
  ip_version              = "IPv4"
  idle_timeout_in_minutes = 4
  domain_name_label       = var.public_ip_domain_label
  ddos_protection_mode    = "VirtualNetworkInherited"

  tags = var.tags
}

# Network Interface
module "nic_vm_01" {
  source = "../../modules/network-interface"

  name                          = var.nic_name
  resource_group_name           = module.rg_production.name
  location                      = var.nic_location
  enable_accelerated_networking = false
  enable_ip_forwarding          = false

  ip_configuration = {
    name                          = "ipconfig1"
    subnet_id                     = module.vnet_vm_01.subnet_ids["default"]
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = module.pip_vm_01.id
    primary                       = true
  }

  network_security_group_id = module.nsg_vm_01.id

  tags = var.tags
}

# Virtual Machine
module "vm_01" {
  source = "../../modules/linux-vm"

  name                            = var.vm_name
  resource_group_name             = module.rg_production.name
  location                        = var.vm_location
  vm_size                         = var.vm_size
  admin_username                  = var.vm_admin_username
  disable_password_authentication = true
  network_interface_ids           = [module.nic_vm_01.id]

  admin_ssh_keys = var.vm_admin_ssh_keys

  os_disk = {
    name                 = var.vm_os_disk_name
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
    disk_size_gb         = var.vm_os_disk_size_gb
  }

  source_image_reference = {
    publisher = var.vm_image_publisher
    offer     = var.vm_image_offer
    sku       = var.vm_image_sku
    version   = var.vm_image_version
  }

  tags = var.tags
}

# Cloud Shell Storage Account
module "storage_cloud_shell" {
  source = "../../modules/storage-account"

  name                            = var.storage_account_name
  resource_group_name             = module.rg_cloud_shell_storage.name
  location                        = var.storage_account_location
  account_tier                    = "Standard"
  account_replication_type        = "LRS"
  account_kind                    = "StorageV2"
  access_tier                     = "Hot"
  enable_https_traffic_only       = true
  min_tls_version                 = "TLS1_2"
  allow_nested_items_to_be_public = false

  tags = merge(var.tags, {
    "ms-resource-usage" = "azure-cloud-shell"
  })
}
