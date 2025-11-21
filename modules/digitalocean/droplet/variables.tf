variable "image" {
  description = "The Droplet image ID or slug."
  type        = string
  default     = ""
  nullable    = false
}

variable "name" {
  description = "The Droplet name."
  type        = string
}

variable "domain" {
  type     = string
  default  = null
  nullable = true
}

variable "region" {
  description = "The region to start in."
  type        = string
  default     = "ams3"
  nullable    = false
}

variable "size" {
  description = "The unique slug that indentifies the type of Droplet. You can find a list of available slugs on DigitalOcean API documentation."
  type        = string
  default     = "s-1vcpu-1gb"
  nullable    = false
}

variable "backups" {
  description = "Boolean controlling if backups are made. Defaults to false."
  type        = bool
  default     = false
  nullable    = false
}

variable "monitoring" {
  description = "Boolean controlling whether monitoring agent is installed. Defaults to false."
  type        = bool
  default     = false
  nullable    = false
}

variable "ipv6" {
  description = "Boolean controlling if IPv6 is enabled. Defaults to false."
  type        = bool
  default     = false
  nullable    = false
}

variable "vpc_uuid" {
  description = "The ID of the VPC where the Droplet will be located."
  type        = string
  default     = null
  nullable    = true
}

variable "existing_ssh_keys" {
  description = "Enable existing SSH keys"
  type        = bool
  default     = true
  nullable    = false
}

variable "new_ssh_keys" {
  description = "A dict of name=pubkey of new SSH keys to add to the Droplet."
  type        = map(string)
  default     = {}
  nullable    = false
}

variable "resize_disk" {
  description = "Boolean controlling whether to increase the disk size when resizing a Droplet. It defaults to true. When set to false, only the Droplet's RAM and CPU will be resized. Increasing a Droplet's disk size is a permanent change. Increasing only RAM and CPU is reversible."
  type        = bool
  default     = true
  nullable    = false
}

variable "tags" {
  description = "A list of the tags to be applied to this Droplet."
  type        = list(string)
  default     = []
  nullable    = false
}

variable "user_data" {
  description = "A string of the desired User Data for the Droplet."
  type        = string
  default     = null
  nullable    = true
}

variable "volume_ids" {
  description = "A list of the IDs of each block storage volume to be attached to the Droplet."
  type        = list(string)
  default     = []
  nullable    = false
}

variable "project" {
  description = "A string of the desired project for the resources."
  type        = string
  default     = null
  nullable    = true
}

variable "record_enable" {
  description = "Boolean controlling whether to create a DNS record for this Droplet."
  type        = bool
  default     = false
}

variable "record_domain" {
  description = "The domain name to create a DNS record for."
  type        = string
  default     = ""
}

variable "record_name" {
  description = "The name of the DNS record to create."
  type        = string
  default     = null
}

variable "record_type" {
  description = "The type of DNS record to create."
  type        = string
  default     = "A"
}

variable "record_ttl" {
  description = "The TTL of the DNS record to create."
  type        = number
  default     = 60
}

variable "ansible_name" {
  description = "The Ansible name used to log in to this Droplet. Defaults to Droplet name."
  type        = string
  default     = ""
}

variable "ansible_groups" {
  description = "A list of the Ansible groups to be applied to this Droplet."
  type        = list(string)
  default     = []
}

variable "ansible_host" {
  description = "The Ansible host used to log in to this Droplet. Defaults to Ipv4 address."
  type        = string
  default     = ""
}

variable "ansible_user" {
  description = "The Ansible user used to log in to this Droplet."
  type        = string
  default     = "root"
}

variable "ansible_ssh_private_key_file" {
  type        = string
  description = "Defaults to null."
  default     = ""
  nullable    = false
}
