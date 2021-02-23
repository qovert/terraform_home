provider "proxmox" {
  pm_api_url = "https://172.16.30.4:8006/api2/json"
  pm_user = "terraform@pve"
  pm_tls_insecure = true
}
