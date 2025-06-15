module "dns_records" {
  source   = "../modules/cloudflare-dns"
  for_each = var.dns_records

  zone_id = var.zone_id
  name    = each.value.name
  value   = each.value.value
  type    = each.value.type
  ttl     = each.value.ttl
  proxied = each.value.proxied
  comment = each.value.comment
}
