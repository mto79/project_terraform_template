output "id" {
  description = "The ID of the Droplet"
  value       = digitalocean_droplet.default.id
}

output "urn" {
  description = "The uniform resource name of the Droplet"
  value       = digitalocean_droplet.default.urn
}

output "name" {
  description = "name of the Droplet"
  value       = digitalocean_droplet.default.name
}

output "domain" {
  description = "The domain of the Droplet"
  value       = var.domain
}

output "region" {
  description = "The region of the Droplet"
  value       = digitalocean_droplet.default.region
}

output "image" {
  description = "The image of the Droplet"
  value       = digitalocean_droplet.default.image
}

output "ipv6" {
  description = "Is IPv6 enabled"
  value       = digitalocean_droplet.default.ipv6
}

output "ipv6_address" {
  description = "The IPv6 address"
  value       = digitalocean_droplet.default.ipv6_address
}

output "ipv4_address" {
  description = "The IPv4 address"
  value       = digitalocean_droplet.default.ipv4_address
}

output "ipv4_address_private" {
  description = "The private networking IPv4 address"
  value       = digitalocean_droplet.default.ipv4_address_private
}

output "locked" {
  description = "Is the Droplet locked"
  value       = digitalocean_droplet.default.locked
}

output "price_hourly" {
  description = "Droplet hourly price"
  value       = digitalocean_droplet.default.price_hourly
}

output "price_monthly" {
  description = "Droplet monthly price"
  value       = digitalocean_droplet.default.price_monthly
}

output "size" {
  description = "The instance size"
  value       = digitalocean_droplet.default.size
}

output "disk" {
  description = "The size of the instance's disk in GB"
  value       = digitalocean_droplet.default.disk
}

output "vcpus" {
  description = "The number of the instance's virtual CPUs"
  value       = digitalocean_droplet.default.vcpus
}

output "status" {
  description = "The status of the Droplet"
  value       = digitalocean_droplet.default.status
}

output "tags" {
  description = "The tags associated with the Droplet"
  value       = digitalocean_droplet.default.tags
}

output "volume_ids" {
  description = "A list of the attached block storage volumes"
  value       = digitalocean_droplet.default.volume_ids
}

output "record_enable" {
  description = "Boolean controlling whether to create a DNS record for this Droplet."
  value       = var.record_enable
}

output "record_domain" {
  description = "The domain name to create a DNS record for."
  value       = try(digitalocean_record.default[0].domain, null)
}

output "record_name" {
  description = "The name of the DNS record to create."
  value       = try(digitalocean_record.default[0].name, null)
}

output "record_type" {
  description = "The type of DNS record to create."
  value       = try(digitalocean_record.default[0].type, null)
}

output "record_ttl" {
  description = "The TTL of the DNS record to create."
  value       = try(digitalocean_record.default[0].ttl, null)
}
