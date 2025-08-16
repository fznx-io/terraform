# Cloudflare Zone Settings Module

This module manages Cloudflare zone settings including SSL/TLS, security, and performance configurations.

## Features

- **SSL/TLS Configuration**: Configure SSL mode, TLS versions, and HTTPS settings
- **Security Settings**: Browser checks, security level, and challenge TTL
- **Performance Optimization**: Brotli compression, minification, HTTP/3, and 0-RTT
- **IPv6 Support**: Enable IPv6 connectivity

## Usage

```hcl
module "zone_settings" {
  source = "../modules/cloudflare-zone-settings"

  zone_id = var.zone_id

  # SSL/TLS Configuration
  ssl_mode                 = "flexible"  # Options: off, flexible, full, strict
  always_use_https         = "on"
  automatic_https_rewrites = "on"
  min_tls_version          = "1.2"       # Options: 1.0, 1.1, 1.2, 1.3
  tls_1_3                  = "on"

  # Security Settings
  security_level           = "medium"    # Options: off, essentially_off, low, medium, high, under_attack
  browser_check            = "on"
  challenge_ttl            = 1800

  # Performance Settings
  brotli                   = "on"
  minify_css               = "on"
  minify_js                = "on"
  minify_html              = "on"
  http3                    = "on"
  zero_rtt                 = "on"
  ipv6                     = "on"
}
```

## SSL Modes

- **off**: No SSL/TLS encryption
- **flexible**: Cloudflare ↔ Browser (HTTPS), Cloudflare ↔ Origin (HTTP)
- **full**: Cloudflare ↔ Browser (HTTPS), Cloudflare ↔ Origin (HTTPS with self-signed cert)
- **strict**: Cloudflare ↔ Browser (HTTPS), Cloudflare ↔ Origin (HTTPS with valid cert)

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| zone_id | The Cloudflare zone ID | string | n/a | yes |
| ssl_mode | SSL mode | string | "flexible" | no |
| always_use_https | Automatically redirect HTTP to HTTPS | string | "on" | no |
| automatic_https_rewrites | Rewrite HTTP links to HTTPS | string | "on" | no |
| min_tls_version | Minimum TLS version | string | "1.2" | no |
| tls_1_3 | Enable TLS 1.3 | string | "on" | no |
| security_level | Security level | string | "medium" | no |
| browser_check | Check browser integrity | string | "on" | no |
| challenge_ttl | Challenge TTL in seconds | number | 1800 | no |
| brotli | Enable Brotli compression | string | "on" | no |
| minify_css | Minify CSS | string | "on" | no |
| minify_js | Minify JavaScript | string | "on" | no |
| minify_html | Minify HTML | string | "on" | no |
| http3 | Enable HTTP/3 | string | "on" | no |
| zero_rtt | Enable 0-RTT | string | "on" | no |
| ipv6 | Enable IPv6 | string | "on" | no |

## Outputs

| Name | Description |
|------|-------------|
| id | The zone settings override ID |
| zone_id | The Cloudflare zone ID |
| zone_status | The zone status |
| ssl_mode | Current SSL mode |
| always_use_https | Always use HTTPS setting |
| min_tls_version | Minimum TLS version |
| tls_1_3 | TLS 1.3 status |
| security_level | Security level setting |
| http3 | HTTP/3 status |

## Notes

- Universal SSL certificates are automatically enabled for all Cloudflare zones
- Certificates are managed and auto-renewed by Cloudflare
- Some settings may be read-only depending on your Cloudflare plan
