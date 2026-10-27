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
vnet_name               = "vm-01-vnet"
vnet_location           = "australiaeast"
vnet_address_space      = ["10.1.0.0/16"]
subnet_name             = "default"
subnet_address_prefixes = ["10.1.1.0/24"]

# Network Security Group
nsg_name                       = "vm-01-nsg"
nsg_location                   = "australiaeast"
ssh_rule_source_address_prefix = "*"

# Cloudflare IPv4 ranges (origin-lock for HTTP/HTTPS). Source: https://www.cloudflare.com/ips-v4
cloudflare_ip_ranges = [
  "173.245.48.0/20",
  "103.21.244.0/22",
  "103.22.200.0/22",
  "103.31.4.0/22",
  "141.101.64.0/18",
  "108.162.192.0/18",
  "190.93.240.0/20",
  "188.114.96.0/20",
  "197.234.240.0/22",
  "198.41.128.0/17",
  "162.158.0.0/15",
  "104.16.0.0/13",
  "104.24.0.0/14",
  "172.64.0.0/13",
  "131.0.72.0/22",
]

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
