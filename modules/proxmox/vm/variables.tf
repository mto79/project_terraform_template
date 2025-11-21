variable "name" {
  description = "The Proxmox VM name."
  type        = string
}

variable "description" {
  description = "The Proxmox VM description."
  type        = string
  default     = ""
}

variable "tags" {
  description = "A list of the tags to be applied to this Proxmox VM."
  type        = list(string)
  default     = []
  nullable    = false
}

variable "node_name" {
  description = "Name of the Proxmox node to deploy the VM on"
  type        = string
}

variable "vm_id" {
  description = "Unique VM ID"
  type        = number
}

variable "cpu_cores" {
  description = "Number of CPU cores"
  type        = number
  default     = 2
}

variable "cpu_type" {
  description = "Type of CPU"
  type        = string
  default     = "x86-64-v2-AES"
}

variable "memory" {
  description = "Memory in MB for the Proxmox VMs"
  type        = number
  default     = 2048
}

variable "disk_datastore_id" {
  description = "Datastore ID for the Proxmox VM disk"
  type        = string
  default     = "local-lvm"
}

variable "disk_size" {
  description = "Proxmox control VM disk size in GB"
  type        = number
  default     = 30
}

variable "network_device_bridge" {
  description = "Proxmox network Bridge"
  type        = string
  default     = "vmbr0"
}

variable "image_content_type" {
  description = "The content type of the image to use for the Proxmox VM. Valid values are 'iso' and 'vztmpl'."
  type        = string
  default     = "image"
}

variable "image_datastore_id" {
  description = "The datastore ID of the image to use for the Proxmox VM."
  type        = string
  default     = "local"
}

variable "image_node_name" {
  description = "The node name of the image to use for the Proxmox VM."
  type        = string
}

variable "image_url" {
  description = "The URL of the image to use for the Proxmox VM."
  type        = string
}

variable "image_file_name" {
  description = "The filename of the image to use for the Proxmox VM."
  type        = string
}

/*
variable "image_checksum" {
  description = "The checksum of the image to use for the Proxmox VM."
  type        = string
  default     = ""
}
variable "image_checksum_algorithm" {
  description = "The checksum type of the image to use for the Proxmox VM. Valid values are 'sha1', 'sha256', and 'md5'."
  type        = string
  default     = "sha256"
}
variable "image_verify_ssl" {
  description = "Whether to verify the SSL certificate of the image URL."
  type        = bool
  default     = true
}
*/

variable "cloud_init_network_ip4" {
  description = "The IPv4 address to set in the Cloud Init configuration."
  type        = string
}

variable "cloud_init_network_gw4" {
  description = "The IPv4 gateway to set in the Cloud Init configuration."
  type        = string
}

variable "cloud_init_dns_servers" {
  description = "A list of DNS servers to set in the Cloud Init configuration."
  type        = list(string)
  default     = []
  nullable    = false
}

variable "cloud_init_datastore_id" {
  description = "Datastore ID for the Proxmox Cloud Init disk"
  type        = string
  default     = "local"
}

variable "cloud_init_user_data_filename" {
  description = "Filename for the Proxmox Cloud Init user data"
  type        = string
  default     = "cloud_init_user_data"
}

variable "cloud_init_hostname" {
  description = "The hostname to set in the Cloud Init configuration."
  type        = string
  default     = ""
}

variable "cloud_init_timezone" {
  description = "The timezone to set in the Cloud Init configuration."
  type        = string
  default     = "UTC"
}
variable "cloud_init_user_name" {
  description = "The username to create in the Cloud Init configuration."
  type        = string
  default     = "ansible"
}

variable "cloud_init_user_password" {
  description = "The password to create in the Cloud Init configuration."
  type        = string
  default     = "ansible"
}

variable "cloud_init_user_ssh_pub_key" {
  description = "The SSH public key to add to the user in the Cloud Init configuration."
  type        = string
  default     = ""
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
