output "vm_public_ips" {
  description = "Public IP addresses of the VMs"
  value       = { for k, v in module.public_ips : k => v.ip_address }
}

output "vm_fqdns" {
  description = "Fully qualified domain names of the VMs"
  value       = { for k, v in module.public_ips : k => v.fqdn }
}

output "vm_private_ips" {
  description = "Private IP addresses of the VMs"
  value       = { for k, v in module.network_interfaces : k => v.private_ip_address }
}

output "vm_ids" {
  description = "The IDs of the virtual machines"
  value       = { for k, v in module.virtual_machines : k => v.id }
}

output "storage_account_name" {
  description = "Name of the cloud shell storage account"
  value       = module.storage_cloud_shell.name
}

output "storage_account_primary_blob_endpoint" {
  description = "Primary blob endpoint for cloud shell storage"
  value       = module.storage_cloud_shell.primary_blob_endpoint
}
