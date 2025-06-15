output "dns_record_ids" {
  description = "Map of DNS record IDs"
  value       = { for k, v in module.dns_records : k => v.id }
}

output "dns_record_hostnames" {
  description = "Map of DNS record hostnames"
  value       = { for k, v in module.dns_records : k => v.hostname }
}
