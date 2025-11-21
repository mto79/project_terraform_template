proxmox_vms = [
  {
    name                          = "ubuntu-noble-test"
    description                   = "Test VM for Ubuntu 24.04 LTS"
    tags                          = ["ubuntu"]
    node_name                     = "node_name"
    vm_id                         = 110
    cpu_cores                     = 2
    cpu_type                      = "x86-64-v2-AES"
    memory                        = 2048
    disk_datastore_id             = "local-lvm"
    disk_size                     = 30
    network_device_bridge         = "vmbr0"
    image_content_type            = "import"
    image_datastore_id            = "local"
    image_node_name               = "image_node_name"
    image_url                     = "https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img"
    image_file_name               = "noble-server-cloudimg-amd64.qcow2"
    cloud_init_user_data_filename = "ci"
    cloud_init_datastore_id       = "local"
    cloud_init_network_ip4        = "x.x.x.x/24"
    cloud_init_network_gw4        = "x.x.x.x"
    cloud_init_dns_servers        = ["x.x.x.x", "x.x.x.x"]
    cloud_init_hostname           = "ubuntu-noble-test"
    cloud_init_timezone           = "Europe/Amsterdam"
    cloud_init_user_name          = "ansible"
    cloud_init_user_ssh_pub_key   = "~/.ssh/id_ed25519_proxmox.pub"
    ansible_groups                = ["ubuntu"]
    ansible_user                  = "ansible"
    ansible_ssh_private_key_file  = "~/.ssh/id_ed25519_proxmox"
  },
  {
    name                          = "almalinux-96-test"
    description                   = "Test VM for AlmaLinux 9.6"
    tags                          = ["redhat"]
    node_name                     = "node_name"
    vm_id                         = 111
    cpu_cores                     = 2
    cpu_type                      = "x86-64-v2-AES"
    memory                        = 2048
    disk_datastore_id             = "local-lvm"
    disk_size                     = 30
    network_device_bridge         = "vmbr0"
    image_content_type            = "import"
    image_datastore_id            = "local"
    image_node_name               = "image_node_name"
    image_url                     = "https://repo.almalinux.org/almalinux/9/cloud/x86_64/images/AlmaLinux-9-GenericCloud-latest.x86_64.qcow2"
    image_file_name               = "almalinux96-cloudimg-x86_64.qcow2"
    cloud_init_user_data_filename = "ci"
    cloud_init_datastore_id       = "tank"
    cloud_init_network_ip4        = "x.x.x.x/24"
    cloud_init_network_gw4        = "x.x.x.x"
    cloud_init_dns_servers        = ["x.x.x.x", "x.x.x.x"]
    cloud_init_hostname           = "almalinux-96-test"
    cloud_init_timezone           = "Europe/Amsterdam"
    cloud_init_user_name          = "ansible"
    cloud_init_user_ssh_pub_key   = "~/.ssh/id_ed25519_proxmox.pub"
    ansible_groups                = ["ubuntu"]
    ansible_user                  = "ansible"
    ansible_ssh_private_key_file  = "~/.ssh/id_ed25519_proxmox"
  }

]

