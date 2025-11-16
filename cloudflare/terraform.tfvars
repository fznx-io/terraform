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
    content = "fznx.io"
    type    = "CNAME"
    ttl     = 1
    proxied = true
    comment = ""
  }
  stackoverflow = {
    name    = "stackoverflow"
    content = "fznx.io"
    type    = "CNAME"
    ttl     = 1
    proxied = true
    comment = ""
  }
  github = {
    name    = "github"
    content = "fznx.io"
    type    = "CNAME"
    ttl     = 1
    proxied = true
    comment = ""
  }
}

# Redirect Rules Configuration
redirect_rules = [
  {
    expression  = "(http.host eq \"linkedin.fznx.io\")"
    target_url  = "https://linkedin.com/in/fauzan-n"
    status_code = 301
    description = "Redirect linkedin.fznx.io to LinkedIn profile"
  },
  {
    expression  = "(http.host eq \"stackoverflow.fznx.io\")"
    target_url  = "https://stackoverflow.com/users/6822338"
    status_code = 301
    description = "Redirect stackoverflow.fznx.io to Stack Overflow profile"
  },
  {
    expression  = "(http.host eq \"github.fznx.io\")"
    target_url  = "https://github.com/fznx-io"
    status_code = 301
    description = "Redirect github.fznx.io to GitHub profile"
  }
]
