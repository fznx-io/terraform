# Azure Production Environment

This directory contains Terraform configurations for the Azure production environment.

## Overview

This configuration manages the following Azure resources:
- Resource Groups (3)
- Virtual Networks and Subnets
- Network Security Groups
- Public IP Addresses
- Network Interfaces
- Linux Virtual Machines (Debian 11)
- Storage Accounts

## Architecture

### Resource Groups
- **production** (East US) - Main production resources
- **NetworkWatcherRG** (Australia East) - Network monitoring
- **cloud-shell-storage-southeastasia** (Southeast Asia) - Cloud Shell storage

### Network Configuration
- **VNet**: vm-01-vnet (10.1.0.0/16) in Australia East
- **Subnet**: default (10.1.1.0/24)
- **NSG**: vm-01-nsg with SSH access (port 22)
- **Public IP**: vm-01-ip (68.218.2.111)
- **FQDN**: vm-01.australiaeast.cloudapp.azure.com

### Compute
- **VM**: vm-01 (Standard_B2ats_v2)
  - OS: Debian 11 Gen2
  - Disk: 64GB Premium SSD
  - Authentication: SSH key only
  - Location: Australia East

## Prerequisites

1. Azure CLI installed and configured
2. Terraform 1.5.7 installed
3. Appropriate Azure permissions (Owner or Contributor)

## Initial Setup

### 1. Create Secrets File

Copy the secrets template and fill in your values:

```bash
cp secrets.tfvars.example secrets.tfvars
# Edit secrets.tfvars with your SSH public key
```

**Important:** Never commit `secrets.tfvars` to version control!

### 2. Configure Variables

Review and update `terraform.tfvars` with your environment-specific values.

### 3. Authenticate with Azure

Ensure you're logged into Azure CLI:

```bash
az login
az account set --subscription "YOUR_SUBSCRIPTION_ID"
```

## Usage

### Initialize Terraform

```bash
terraform init
```

### Plan Changes

When running terraform commands, include both tfvars files:

```bash
terraform plan -var-file="terraform.tfvars" -var-file="secrets.tfvars"
```

### Apply Changes

```bash
terraform apply -var-file="terraform.tfvars" -var-file="secrets.tfvars"
```

### Destroy Resources (Use with Caution)

```bash
terraform destroy -var-file="terraform.tfvars" -var-file="secrets.tfvars"
```

## Module Structure

This environment uses reusable modules located in `../../modules/`:

- `resource-group` - Azure Resource Groups
- `virtual-network` - VNets and Subnets
- `network-security-group` - NSGs and Security Rules
- `public-ip` - Public IP Addresses
- `network-interface` - Network Interfaces
- `linux-vm` - Linux Virtual Machines
- `storage-account` - Storage Accounts

## Variables

### terraform.tfvars
Contains non-sensitive configuration:
- Resource names and locations
- Network configurations
- VM sizes and settings
- Image details

### secrets.tfvars
Contains sensitive data (gitignored):
- Azure subscription ID
- SSH public keys
- Other sensitive credentials

Key variables are defined in `variables.tf` with descriptions.

## Outputs

The configuration outputs:

- VM public IP address
- VM FQDN
- VM private IP
- Storage account details

## Backend Configuration

State is stored in Azure Storage:
- Resource Group: `terraform-state-rg`
- Storage Account: `tfstateproduction`
- Container: `tfstate`
- Key: `production.terraform.tfstate`

## Security Notes

1. **Secrets Management:**
   - SSH keys are stored in `secrets.tfvars` (gitignored)
   - Never commit secrets to version control
   - Use `secrets.tfvars.example` as a template

2. **SSH Access:**
   - Currently open to all sources (*) - consider restricting to specific IPs
   - Update `ssh_rule_source_address_prefix` in terraform.tfvars

3. **Storage Account:**
   - Access keys are marked as sensitive in outputs

## File Structure

```
azure/production/
├── backend.tf              # Remote state configuration
├── main.tf                 # Main resource definitions
├── outputs.tf              # Output definitions
├── providers.tf            # Provider configuration
├── variables.tf            # Variable definitions
├── terraform.tfvars        # Non-sensitive values
├── secrets.tfvars          # Sensitive values (gitignored)
├── secrets.tfvars.example  # Template for secrets
└── README.md               # This file
```

## Maintenance

- Terraform Version: 1.5.7
- AzureRM Provider: ~> 4.0
- Last Updated: 2026-01-08

## Troubleshooting

### Missing secrets.tfvars

If you see variable errors, make sure you've created `secrets.tfvars`:

```bash
cp secrets.tfvars.example secrets.tfvars
# Edit with your values
```

### Authentication Issues

If you encounter authentication errors, ensure you're logged into Azure CLI with the correct subscription:

```bash
az login
az account show  # Verify the correct subscription is selected
```

### Provider Initialization

If you see provider errors, try reinitializing:

```bash
terraform init -upgrade
```
