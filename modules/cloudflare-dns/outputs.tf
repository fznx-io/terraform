output "id" {
  description = "The ID of the DNS record"
  value       = cloudflare_record.this.id
}

output "hostname" {
  description = "The FQDN of the record"
  value       = cloudflare_record.this.hostname
}

output "name" {
  description = "The name of the DNS record"
  value       = cloudflare_record.this.name
}

output "type" {
  description = "The type of the DNS record"
  value       = cloudflare_record.this.type
}

output "value" {
  description = "The value of the DNS record"
  value       = cloudflare_record.this.value
}

output "proxied" {
  description = "Whether the record is proxied through Cloudflare"
  value       = cloudflare_record.this.proxied
}
