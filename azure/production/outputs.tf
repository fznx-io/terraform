output "vm_public_ip" {
  description = "Public IP address of the VM"
  value       = module.pip_vm_01.ip_address
}

output "vm_fqdn" {
  description = "Fully qualified domain name of the VM"
  value       = module.pip_vm_01.fqdn
}

output "vm_private_ip" {
  description = "Private IP address of the VM"
  value       = module.nic_vm_01.private_ip_address
}

output "vm_id" {
  description = "The ID of the virtual machine"
  value       = module.vm_01.id
}

output "storage_account_name" {
  description = "Name of the cloud shell storage account"
  value       = module.storage_cloud_shell.name
}

output "storage_account_primary_blob_endpoint" {
  description = "Primary blob endpoint for cloud shell storage"
  value       = module.storage_cloud_shell.primary_blob_endpoint
}
