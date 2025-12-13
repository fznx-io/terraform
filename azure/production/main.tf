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
    http = {
      name                       = "HTTP"
      priority                   = 310
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "80"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
    https = {
      name                       = "HTTPS"
      priority                   = 320
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "443"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  }

  tags = var.tags
}

# Public IPs
module "public_ips" {
  source   = "../../modules/public-ip"
  for_each = var.virtual_machines

  name                    = each.value.public_ip_name
  resource_group_name     = module.rg_production.name
  location                = each.value.location
  allocation_method       = "Dynamic"
  sku                     = "Basic"
  ip_version              = "IPv4"
  idle_timeout_in_minutes = 4
  domain_name_label       = each.value.public_ip_domain_label
  ddos_protection_mode    = "VirtualNetworkInherited"

  tags = var.tags
}

# Network Interfaces
module "network_interfaces" {
  source   = "../../modules/network-interface"
  for_each = var.virtual_machines

  name                          = each.value.nic_name
  resource_group_name           = module.rg_production.name
  location                      = each.value.location
  enable_accelerated_networking = false
  enable_ip_forwarding          = false

  ip_configuration = {
    name                          = "ipconfig1"
    subnet_id                     = module.vnet_vm_01.subnet_ids["default"]
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = module.public_ips[each.key].id
    primary                       = true
  }

  network_security_group_id = module.nsg_vm_01.id

  tags = var.tags
}

# Virtual Machines
module "virtual_machines" {
  source   = "../../modules/linux-vm"
  for_each = var.virtual_machines

  name                            = each.value.name
  resource_group_name             = module.rg_production.name
  location                        = each.value.location
  vm_size                         = each.value.size
  admin_username                  = each.value.admin_username
  disable_password_authentication = true
  network_interface_ids           = [module.network_interfaces[each.key].id]

  admin_ssh_keys = var.vm_admin_ssh_keys

  os_disk = {
    name                 = each.value.os_disk_name
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
    disk_size_gb         = each.value.os_disk_size_gb
  }

  source_image_reference = {
    publisher = each.value.image_publisher
    offer     = each.value.image_offer
    sku       = each.value.image_sku
    version   = each.value.image_version
  }

  tags = var.tags
}

# Custom Script Extension for VM Setup (Python FastAPI + Next.js)
resource "azurerm_virtual_machine_extension" "vm_01_setup" {
  name                 = "vm-01-setup-script"
  virtual_machine_id   = module.virtual_machines["vm-01"].id
  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.1"

  settings = jsonencode({
    script = base64encode(<<-EOF
      #!/bin/bash
      set -e

      # Update system packages
      apt-get update
      apt-get upgrade -y

      # Install Python and pip
      apt-get install -y python3 python3-pip python3-venv

      # Install FastAPI and Uvicorn
      pip3 install fastapi uvicorn[standard]

      # Install Node.js (LTS) and npm for Next.js
      curl -fsSL https://deb.nodesource.com/setup_lts.x | bash -
      apt-get install -y nodejs

      # Install PM2 for process management
      npm install -g pm2

      # Create app directories
      mkdir -p /opt/apps/fastapi
      mkdir -p /opt/apps/nextjs

      # Log completion
      echo "Setup completed: Python FastAPI and Next.js environment installed" >> /var/log/vm-setup.log
      date >> /var/log/vm-setup.log
    EOF
    )
  })

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
