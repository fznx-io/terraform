# Azure Production Environment Variables

# Azure Configuration
# subscription_id - moved to secrets.tfvars

# Resource Groups
rg_production_name          = "production"
rg_production_location      = "eastus"
rg_network_watcher_name     = "NetworkWatcherRG"
rg_network_watcher_location = "australiaeast"
rg_cloud_shell_name         = "cloud-shell-storage-southeastasia"
rg_cloud_shell_location     = "southeastasia"

# Virtual Network
vnet_name             = "vm-01-vnet"
vnet_location         = "australiaeast"
vnet_address_space    = ["10.1.0.0/16"]
subnet_name           = "default"
subnet_address_prefixes = ["10.1.1.0/24"]

# Network Security Group
nsg_name                        = "vm-01-nsg"
nsg_location                    = "australiaeast"
ssh_rule_source_address_prefix  = "*"

# Public IP
public_ip_name         = "vm-01-ip"
public_ip_location     = "australiaeast"
public_ip_domain_label = "vm-01"

# Network Interface
nic_name     = "vm-0110"
nic_location = "australiaeast"

# Virtual Machine
vm_name           = "vm-01"
vm_location       = "australiaeast"
vm_size           = "Standard_B2ats_v2"
vm_admin_username = "fauzan"
vm_os_disk_name    = "vm-01_OsDisk_1_3751e85c2f754e9988fbbcc2b1067b2f"
vm_os_disk_size_gb = 64
vm_image_publisher = "debian"
vm_image_offer     = "debian-11"
vm_image_sku       = "11-gen2"
vm_image_version   = "latest"

# Storage Account
storage_account_name     = "cs11003200559f3eafb"
storage_account_location = "southeastasia"

# Tags
tags = {}
