variable "zone_id" {
  description = "The Cloudflare zone ID"
  type        = string
}

# SSL/TLS Variables
variable "ssl_mode" {
  description = "SSL mode: off, flexible, full, strict"
  type        = string
  default     = "flexible"
}

variable "always_use_https" {
  description = "Automatically redirect HTTP to HTTPS"
  type        = string
  default     = "on"
}

variable "automatic_https_rewrites" {
  description = "Rewrite HTTP links to HTTPS"
  type        = string
  default     = "on"
}

variable "min_tls_version" {
  description = "Minimum TLS version: 1.0, 1.1, 1.2, 1.3"
  type        = string
  default     = "1.2"
}

variable "tls_1_3" {
  description = "Enable TLS 1.3"
  type        = string
  default     = "on"
}

# Security Variables
variable "security_level" {
  description = "Security level: off, essentially_off, low, medium, high, under_attack"
  type        = string
  default     = "medium"
}

variable "browser_check" {
  description = "Check browser integrity"
  type        = string
  default     = "on"
}

variable "challenge_ttl" {
  description = "Challenge TTL in seconds"
  type        = number
  default     = 1800
}

# Performance Variables
variable "brotli" {
  description = "Enable Brotli compression"
  type        = string
  default     = "on"
}

variable "minify_css" {
  description = "Minify CSS"
  type        = string
  default     = "on"
}

variable "minify_js" {
  description = "Minify JavaScript"
  type        = string
  default     = "on"
}

variable "minify_html" {
  description = "Minify HTML"
  type        = string
  default     = "on"
}

variable "http3" {
  description = "Enable HTTP/3"
  type        = string
  default     = "on"
}

variable "zero_rtt" {
  description = "Enable 0-RTT"
  type        = string
  default     = "on"
}

variable "ipv6" {
  description = "Enable IPv6"
  type        = string
  default     = "on"
}
