variable "pve_api_url" {
  description = "Proxmox API URL"
  sensitive   = false
}

variable "pve_api_token" {
  description = "Proxmox API"
  sensitive   = true
}

variable "proxmox_vms" {
  description = "List of Proxmox VM configurations."
  type = list(object({
    name        = string
    description = optional(string)
    tags        = list(string)
    node_name   = string
    vm_id       = number

    cpu_cores = optional(number)
    cpu_type  = optional(string)

    memory = optional(number)

    disk_datastore_id = optional(string)
    disk_size         = optional(number)

    network_device_bridge = optional(string)

    image_content_type = string
    image_datastore_id = string
    image_node_name    = string
    image_url          = string
    image_file_name    = string

    cloud_init_network_ip4        = string
    cloud_init_network_gw4        = string
    cloud_init_dns_servers        = list(string)
    cloud_init_user_data_filename = string
    cloud_init_hostname           = optional(string)
    cloud_init_timezone           = optional(string)
    cloud_init_user_name          = optional(string)
    cloud_init_user_ssh_pub_key   = optional(string)

    # record_enable = optional(bool)
    # record_type   = optional(string)
    # record_domain = optional(string)
    # record_name   = optional(string)
    # record_ttl    = optional(number)

    ansible_name                 = optional(string)
    ansible_host                 = optional(string)
    ansible_groups               = optional(list(string))
    ansible_user                 = optional(string)
    ansible_ssh_private_key_file = optional(string)
  }))
  default = []
}
