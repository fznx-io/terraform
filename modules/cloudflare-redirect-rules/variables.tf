variable "zone_id" {
  description = "Cloudflare Zone ID"
  type        = string
}

variable "redirect_rules" {
  description = "Map of redirect rules"
  type = map(object({
    expression            = string
    target_url            = string
    status_code           = optional(number, 301)
    preserve_query_string = optional(bool, false)
    description           = optional(string, "")
    enabled               = optional(bool, true)
  }))
  default = {}
}
