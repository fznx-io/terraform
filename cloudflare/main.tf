# DNS Records
module "dns_records" {
  source   = "../modules/cloudflare-dns"
  for_each = var.dns_records

  zone_id = var.zone_id
  name    = each.value.name
  content = each.value.content
  type    = each.value.type
  ttl     = each.value.ttl
  proxied = each.value.proxied
  comment = each.value.comment
}

# Zone Settings (SSL/TLS, Security, Performance)
module "zone_settings" {
  source = "../modules/cloudflare-zone-settings"

  zone_id = var.zone_id

  # SSL/TLS Configuration
  ssl_mode                 = var.ssl_mode
  always_use_https         = var.always_use_https
  automatic_https_rewrites = var.automatic_https_rewrites
  min_tls_version          = var.min_tls_version
  tls_1_3                  = var.tls_1_3

  # Security Settings
  security_level           = var.security_level
  browser_check            = var.browser_check
  challenge_ttl            = var.challenge_ttl

  # Performance Settings
  brotli                   = var.brotli
  minify_css               = var.minify_css
  minify_js                = var.minify_js
  minify_html              = var.minify_html
  http3                    = var.http3
  zero_rtt                 = var.zero_rtt
  ipv6                     = var.ipv6
}

# Universal SSL Certificate (Free)
# Note: This is automatically enabled for all Cloudflare zones
# The certificate is managed by Cloudflare and auto-renewed
