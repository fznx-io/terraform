output "dns_record_ids" {
  description = "Map of DNS record IDs"
  value       = { for k, v in module.dns_records : k => v.id }
}

output "dns_record_hostnames" {
  description = "Map of DNS record hostnames"
  value       = { for k, v in module.dns_records : k => v.hostname }
}

output "ssl_status" {
  description = "SSL/TLS configuration status"
  value = {
    ssl_mode         = module.zone_settings.ssl_mode
    always_use_https = module.zone_settings.always_use_https
    min_tls_version  = module.zone_settings.min_tls_version
    tls_1_3          = module.zone_settings.tls_1_3
    security_level   = module.zone_settings.security_level
    http3            = module.zone_settings.http3
  }
}

output "zone_settings_id" {
  description = "Zone settings override ID"
  value       = module.zone_settings.id
}

output "zone_status" {
  description = "Zone status"
  value       = module.zone_settings.zone_status
}

output "zone_id" {
  description = "Cloudflare Zone ID"
  value       = var.zone_id
}
