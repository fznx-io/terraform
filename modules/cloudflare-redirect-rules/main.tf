resource "cloudflare_ruleset" "redirects" {
  zone_id     = var.zone_id
  name        = "Redirect Rules"
  description = "Single Redirects managed by Terraform"
  kind        = "zone"
  phase       = "http_request_dynamic_redirect"

  dynamic "rules" {
    for_each = var.redirect_rules
    content {
      action = "redirect"
      action_parameters {
        from_value {
          status_code = rules.value.status_code
          target_url {
            value = rules.value.target_url
          }
          preserve_query_string = rules.value.preserve_query_string
        }
      }
      expression  = rules.value.expression
      description = rules.value.description
      enabled     = rules.value.enabled
    }
  }
}
