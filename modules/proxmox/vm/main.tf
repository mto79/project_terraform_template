resource "proxmox_virtual_environment_vm" "vm" {
  name        = var.name
  description = var.description
  tags        = var.tags
  node_name   = var.node_name
  vm_id       = var.vm_id

  agent {
    enabled = true
    type    = "virtio"
  }
  # if agent is not enabled, the VM may not be able to shutdown properly, and may need to be forced off
  stop_on_destroy = true

  startup {
    order      = "3"
    up_delay   = "60"
    down_delay = "60"
  }

  cpu {
    cores = var.cpu_cores
    type  = var.cpu_type
  }

  memory {
    dedicated = var.memory
    floating  = var.memory # set equal to dedicated to enable ballooning
  }

  disk {
    datastore_id = var.disk_datastore_id
    file_id      = proxmox_virtual_environment_download_file.image.id
    interface    = "virtio0"
    iothread     = true
    discard      = "on"
    size         = var.disk_size
  }

  initialization {
    datastore_id      = var.cloud_init_datastore_id
    user_data_file_id = proxmox_virtual_environment_file.cloud_init.id

    ip_config {
      ipv4 {
        address = var.cloud_init_network_ip4
        gateway = var.cloud_init_network_gw4
      }
    }

    dns {
      servers = var.cloud_init_dns_servers
    }
  }

  network_device {
    bridge = var.network_device_bridge
  }

  operating_system {
    type = "l26"
  }
}

resource "proxmox_virtual_environment_download_file" "image" {
  content_type = var.image_content_type
  datastore_id = var.image_datastore_id
  node_name    = coalesce(var.image_node_name, var.node_name)
  url          = var.image_url
  file_name    = var.image_file_name
}

data "template_file" "cloudinit_user_data" {
  template = <<-EOT
  #cloud-config
  hostname: ${var.cloud_init_hostname}
  timezone: ${var.cloud_init_timezone}
  users:
    - name: ${var.cloud_init_user_name}
      groups:
        - sudo
      shell: /bin/bash
      lock_passwd: false
      ssh_pwauth: true
      passwd: "$6$kW4vfBM9kGgq4hr$TFtHW7.3jOECR9UCBuw9NrdSMJETzSVoNQGcVv2y.RqRUzWDEtYhYRkGvIpB6ml1fh/fZEVIgKbSXI9L1B6xF."
      ssh_authorized_keys:
        - ${var.cloud_init_user_ssh_pub_key}
      sudo: ALL=(ALL) NOPASSWD:ALL
  chpasswd:
    expire: false
  package_update: true
  packages:
    - qemu-guest-agent
    - net-tools
    - curl
  runcmd:
    - systemctl enable qemu-guest-agent
    - systemctl start qemu-guest-agent
    - echo "done" > /tmp/cloud-config.done
  EOT
}

resource "proxmox_virtual_environment_file" "cloud_init" {
  content_type = "snippets"
  datastore_id = "local"
  node_name    = var.node_name

  source_raw {
    data      = data.template_file.cloudinit_user_data.rendered
    file_name = "${var.cloud_init_user_data_filename}-${var.name}.yaml"
  }
}
# resource "proxmox_virtual_environment_haresource" "default" {
#  resource_id  = "vm:${proxmox_virtual_environment_vm.default.vm_id}"
#  group        = var.ha_group
#  state        = var.ha_state
#  comment      = var.ha_comment
# }

resource "ansible_host" "default" {
  name   = coalesce(var.ansible_name, var.name)
  groups = try(var.ansible_groups, [])

  variables = {
    ansible_host                 = proxmox_virtual_environment_vm.vm.ipv4_addresses[1][0]
    ansible_user                 = coalesce(var.ansible_user, "ansible")
    ansible_ssh_private_key_file = try(var.ansible_ssh_private_key_file, null)
  }
}
