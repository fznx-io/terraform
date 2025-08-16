terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }
  }
}

resource "cloudflare_zone_settings_override" "this" {
  zone_id = var.zone_id

  settings {
    # SSL/TLS Configuration
    ssl                      = var.ssl_mode
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
    minify {
      css  = var.minify_css
      js   = var.minify_js
      html = var.minify_html
    }

    # HTTP/3 and 0-RTT
    http3                    = var.http3
    zero_rtt                 = var.zero_rtt

    # IPv6
    ipv6                     = var.ipv6
  }
}
