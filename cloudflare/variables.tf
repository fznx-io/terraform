variable "cloudflare_api_token" {
  description = "Cloudflare API token for authentication"
  type        = string
  sensitive   = true
}

variable "zone_id" {
  description = "The Cloudflare zone ID for fznx.io"
  type        = string
}

variable "dns_records" {
  description = "Map of DNS records to create"
  type = map(object({
    name    = string
    value   = string
    type    = string
    ttl     = number
    proxied = bool
    comment = string
  }))
}
