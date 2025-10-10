output "ruleset_id" {
  description = "The ID of the redirect ruleset"
  value       = cloudflare_ruleset.redirects.id
}
