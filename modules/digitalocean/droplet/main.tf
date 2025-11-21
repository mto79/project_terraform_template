data "digitalocean_project" "existing_project" {
  name = var.project
}

data "digitalocean_ssh_keys" "existing_ssh_keys" {
  count = var.existing_ssh_keys ? 1 : 0
}

resource "digitalocean_ssh_key" "new_ssh_keys" {
  for_each   = var.new_ssh_keys
  name       = var.domain != null && var.domain != "" ? "${each.key}-${var.name}.${var.domain}" : "${each.key}-${var.name}"
  public_key = each.value
}

resource "digitalocean_droplet" "default" {
  depends_on = [
    digitalocean_ssh_key.new_ssh_keys,
    data.digitalocean_ssh_keys.existing_ssh_keys,
  ]

  image      = var.image
  name       = var.domain != null && var.domain != "" ? "${var.name}.${var.domain}" : var.name
  region     = var.region
  size       = var.size
  backups    = var.backups
  monitoring = var.monitoring
  ipv6       = var.ipv6
  vpc_uuid   = var.vpc_uuid
  ssh_keys = concat(try(data.digitalocean_ssh_keys.existing_ssh_keys[0].ssh_keys.*.id, []),
  [for k, v in var.new_ssh_keys : digitalocean_ssh_key.new_ssh_keys[k].id])
  resize_disk = var.resize_disk
  tags        = var.tags
  user_data   = var.user_data
  volume_ids  = var.volume_ids

}

resource "digitalocean_record" "default" {
  count  = var.record_enable ? 1 : 0
  domain = var.record_domain
  name   = try(var.record_name, digitalocean_droplet.default.name)
  type   = var.record_type
  ttl    = var.record_ttl
  value  = digitalocean_droplet.default.ipv4_address
}
resource "digitalocean_project_resources" "default" {
  project = data.digitalocean_project.existing_project.id
  resources = [
    digitalocean_droplet.default.urn
  ]
}

resource "ansible_host" "default" {
  name   = coalesce(var.ansible_name, var.name)
  groups = try(var.ansible_groups, [])

  variables = {
    ansible_host                 = coalesce(digitalocean_droplet.default.ipv4_address, digitalocean_droplet.default.ipv6_address)
    ansible_user                 = coalesce(var.ansible_user, "ansible")
    ansible_ssh_private_key_file = try(var.ansible_ssh_private_key_file, null)
  }
}
