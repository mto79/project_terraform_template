terraform {
  required_version = ">= 1.5"
  required_providers {
    template = {
      source  = "hashicorp/template"
      version = "2.2.0"
    }
    proxmox = {
      source  = "bpg/proxmox"
      version = "~> 0.83.2"
    }
    ansible = {
      version = "~> 1.3.0"
      source  = "ansible/ansible"
    }
  }
}
