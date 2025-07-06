# Cloudflare Zone ID for fznx.io
zone_id = "2afcbb4fccb6e950a315e5f34a9f75b8"

# DNS Records Configuration
dns_records = {
  root = {
    name    = "@"
    content = "68.218.67.233"
    type    = "A"
    ttl     = 1
    proxied = true
    comment = ""
  }
  linkedin = {
    name    = "linkedin"
    content = "linkedin.com/in/fauzan-n"
    type    = "CNAME"
    ttl     = 1
    proxied = false
    comment = ""
  }
}
