# Proxmox Terraform Configuration

## How to Get a Proxmox API Token

To get a **Proxmox API key (Personal Access Token)**, follow these steps:

### 1. Log in to Proxmox host node as root with a cluster
```
pveum user add terraform@pve
```


### Used Environment variables

```
export TF_VAR_pve_api_url="https://your-proxmox-server:8006/api2/json"
export TF_VAR_pve_token_id="your-token-id"
export TF_VAR_pve_token_secret="your-token-secret"
```

## Enabling "Snippets" Content Type on a Proxmox Datastore

Before applying configurations that require "Snippets," ensure the content type is enabled on your target storage.

---

### 1. Identify the Target Datastore
1. Log in to the **Proxmox web interface**.
2. Navigate to **Datacenter → Storage**.
3. Locate the storage you want to use.

---

### 2. Check Current Content Types
1. Click on the storage name to open its configuration.
2. Look for the **Content** field. This shows allowed content types (e.g., `ISO image`, `VZDump backup file`, `Container template`).
3. Verify if **Snippets** is listed.

---

### 3. Enable Snippets (if not present)

#### a. Using the Web UI
1. Click **Edit** on the storage.
2. In the **Content** multi-select field, tick **Snippets**.
3. Click **OK** to save changes.

#### b. Using the CLI
1. Connect to the Proxmox node via SSH.
2. View the storage configuration file:
   ```bash
   cat /etc/pve/storage.cfg
3. Find your storage section. Example:
```
dir: local
    path /var/lib/vz
    content iso,backup,vztmpl, snippets
    maxfiles 5
```

Save the file. Changes take effect immediately.



### Cloud-Init
On Ubuntu cloud images, the username admin is reserved/blocked by default in cloud-init. Canonical hardcodes a disallowlist of certain usernames (root, admin, etc.) for security reasons.

That’s why creating a user literally called admin won’t work — cloud-init just ignores it.
