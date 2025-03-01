#!/bin/bash
# Terraform Import Script for Azure Production Resources
# This script imports existing Azure resources into Terraform state

set -e

echo "=========================================="
echo "Azure Production Resources Import Script"
echo "=========================================="
echo ""

# Check if secrets.tfvars exists
if [ ! -f "secrets.tfvars" ]; then
    echo "ERROR: secrets.tfvars not found!"
    echo "Please create it from secrets.tfvars.example"
    exit 1
fi

# Color codes for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Terraform variable files
VAR_FILES="-var-file=terraform.tfvars -var-file=secrets.tfvars"

# Resource IDs
SUBSCRIPTION_ID="64a1de54-8d09-4f97-8bee-bac643c203c6"

echo -e "${YELLOW}Step 1: Importing Resource Groups${NC}"
echo "-------------------------------------------"

terraform import $VAR_FILES 'module.rg_production.azurerm_resource_group.this' \
  "/subscriptions/${SUBSCRIPTION_ID}/resourceGroups/production"

terraform import $VAR_FILES 'module.rg_network_watcher.azurerm_resource_group.this' \
  "/subscriptions/${SUBSCRIPTION_ID}/resourceGroups/NetworkWatcherRG"

terraform import $VAR_FILES 'module.rg_cloud_shell_storage.azurerm_resource_group.this' \
  "/subscriptions/${SUBSCRIPTION_ID}/resourceGroups/cloud-shell-storage-southeastasia"

echo -e "${GREEN}✓ Resource Groups imported${NC}"
echo ""

echo -e "${YELLOW}Step 2: Importing Virtual Network and Subnet${NC}"
echo "-------------------------------------------"

terraform import $VAR_FILES 'module.vnet_vm_01.azurerm_virtual_network.this' \
  "/subscriptions/${SUBSCRIPTION_ID}/resourceGroups/production/providers/Microsoft.Network/virtualNetworks/vm-01-vnet"

terraform import $VAR_FILES 'module.vnet_vm_01.azurerm_subnet.this["default"]' \
  "/subscriptions/${SUBSCRIPTION_ID}/resourceGroups/production/providers/Microsoft.Network/virtualNetworks/vm-01-vnet/subnets/default"

echo -e "${GREEN}✓ Virtual Network and Subnet imported${NC}"
echo ""

echo -e "${YELLOW}Step 3: Importing Network Security Group${NC}"
echo "-------------------------------------------"

terraform import $VAR_FILES 'module.nsg_vm_01.azurerm_network_security_group.this' \
  "/subscriptions/${SUBSCRIPTION_ID}/resourceGroups/production/providers/Microsoft.Network/networkSecurityGroups/vm-01-nsg"

terraform import $VAR_FILES 'module.nsg_vm_01.azurerm_network_security_rule.this["ssh"]' \
  "/subscriptions/${SUBSCRIPTION_ID}/resourceGroups/production/providers/Microsoft.Network/networkSecurityGroups/vm-01-nsg/securityRules/SSH"

echo -e "${GREEN}✓ Network Security Group imported${NC}"
echo ""

echo -e "${YELLOW}Step 4: Importing Public IP${NC}"
echo "-------------------------------------------"

terraform import $VAR_FILES 'module.pip_vm_01.azurerm_public_ip.this' \
  "/subscriptions/${SUBSCRIPTION_ID}/resourceGroups/production/providers/Microsoft.Network/publicIPAddresses/vm-01-ip"

echo -e "${GREEN}✓ Public IP imported${NC}"
echo ""

echo -e "${YELLOW}Step 5: Importing Network Interface${NC}"
echo "-------------------------------------------"

terraform import $VAR_FILES 'module.nic_vm_01.azurerm_network_interface.this' \
  "/subscriptions/${SUBSCRIPTION_ID}/resourceGroups/production/providers/Microsoft.Network/networkInterfaces/vm-0110"

terraform import $VAR_FILES 'module.nic_vm_01.azurerm_network_interface_security_group_association.this' \
  "/subscriptions/${SUBSCRIPTION_ID}/resourceGroups/production/providers/Microsoft.Network/networkInterfaces/vm-0110|/subscriptions/${SUBSCRIPTION_ID}/resourceGroups/production/providers/Microsoft.Network/networkSecurityGroups/vm-01-nsg"

echo -e "${GREEN}✓ Network Interface imported${NC}"
echo ""

echo -e "${YELLOW}Step 6: Importing Virtual Machine${NC}"
echo "-------------------------------------------"

terraform import $VAR_FILES 'module.vm_01.azurerm_linux_virtual_machine.this' \
  "/subscriptions/${SUBSCRIPTION_ID}/resourceGroups/production/providers/Microsoft.Compute/virtualMachines/vm-01"

echo -e "${GREEN}✓ Virtual Machine imported${NC}"
echo ""

echo -e "${YELLOW}Step 7: Importing Storage Account${NC}"
echo "-------------------------------------------"

terraform import $VAR_FILES 'module.storage_cloud_shell.azurerm_storage_account.this' \
  "/subscriptions/${SUBSCRIPTION_ID}/resourceGroups/cloud-shell-storage-southeastasia/providers/Microsoft.Storage/storageAccounts/cs11003200559f3eafb"

echo -e "${GREEN}✓ Storage Account imported${NC}"
echo ""

echo -e "${GREEN}=========================================="
echo "✓ All resources imported successfully!"
echo "==========================================${NC}"
echo ""
echo "Next steps:"
echo "1. Run 'terraform plan' to verify the import"
echo "2. Address any differences between state and configuration"
echo "3. Run 'terraform apply' to ensure state is in sync"
