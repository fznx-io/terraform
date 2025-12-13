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

# Virtual Machines
virtual_machines = {
  "vm-01" = {
    name                   = "vm-01"
    location               = "australiaeast"
    size                   = "Standard_B2ats_v2"
    admin_username         = "fauzan"
    os_disk_name           = "vm-01_OsDisk_1_3751e85c2f754e9988fbbcc2b1067b2f"
    os_disk_size_gb        = 64
    image_publisher        = "debian"
    image_offer            = "debian-11"
    image_sku              = "11-gen2"
    image_version          = "latest"
    public_ip_name         = "vm-01-ip"
    public_ip_domain_label = "vm-01"
    nic_name               = "vm-0110"
  }
}

# Storage Account
storage_account_name     = "cs11003200559f3eafb"
storage_account_location = "southeastasia"

# Tags
tags = {}
