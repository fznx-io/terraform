resource "cloudflare_record" "this" {
  zone_id = var.zone_id
  name    = var.name
  value   = var.value
  type    = var.type
  ttl     = var.ttl
  proxied = var.proxied
  comment = var.comment
}
