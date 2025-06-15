variable "zone_id" {
  description = "The Cloudflare zone ID to add the record to"
  type        = string
}

variable "name" {
  description = "The name of the DNS record"
  type        = string
}

variable "value" {
  description = "The value of the DNS record"
  type        = string
}

variable "type" {
  description = "The type of the DNS record (A, AAAA, CNAME, TXT, etc.)"
  type        = string
}

variable "ttl" {
  description = "The TTL of the record (1 = automatic)"
  type        = number
  default     = 1
}

variable "proxied" {
  description = "Whether the record gets Cloudflare's origin protection"
  type        = bool
  default     = false
}

variable "comment" {
  description = "Comments or notes about the DNS record"
  type        = string
  default     = ""
}
