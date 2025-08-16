output "id" {
  description = "The zone settings override ID"
  value       = cloudflare_zone_settings_override.this.id
}

output "zone_id" {
  description = "The Cloudflare zone ID"
  value       = cloudflare_zone_settings_override.this.zone_id
}

output "zone_status" {
  description = "The zone status"
  value       = cloudflare_zone_settings_override.this.zone_status
}

output "ssl_mode" {
  description = "Current SSL mode"
  value       = cloudflare_zone_settings_override.this.settings[0].ssl
}

output "always_use_https" {
  description = "Always use HTTPS setting"
  value       = cloudflare_zone_settings_override.this.settings[0].always_use_https
}

output "min_tls_version" {
  description = "Minimum TLS version"
  value       = cloudflare_zone_settings_override.this.settings[0].min_tls_version
}

output "tls_1_3" {
  description = "TLS 1.3 status"
  value       = cloudflare_zone_settings_override.this.settings[0].tls_1_3
}

output "security_level" {
  description = "Security level setting"
  value       = cloudflare_zone_settings_override.this.settings[0].security_level
}

output "http3" {
  description = "HTTP/3 status"
  value       = cloudflare_zone_settings_override.this.settings[0].http3
}
