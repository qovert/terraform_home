resource "proxmox_lxc" "unbound1" {
  target_node = "chimaera" 
  hostname = "ns1"
  ostemplate = "shared_isos:vztmpl/debian-10-standard_10.7-1_amd64.tar.gz"
  unprivileged = true
  ssh_public_keys = <<-EOT
    ecdsa-sha2-nistp521 AAAAE2VjZHNhLXNoYTItbmlzdHA1MjEAAAAIbmlzdHA1MjEAAACFBAHy9NvDqsnMG6hzbo+k+ZJs2wf2XWlVyQ5gUTlHYhJKo92y220yjDOlW8tsvBBWSA4zSmjamxV70ShiyXBkDC128wDWW4r3Yjm1dQFgfoELG8rkHk5PjSi6Jyx0awfny5hDejLcMSx3+/MBo38/SCX1ZK0ZekC4+wAqPrl1VEHPmYwRKQ== root@salt
    EOT
  vmid = 300
  onboot = true

  rootfs {
    storage = "local_vms"
    size = "8G"
  }

  network {
    name = "eth0"
    bridge = "vmbr0"
    ip = "172.16.30.10/24"
    gw = "172.16.30.1"
  }
}

resource "proxmox_lxc" "unbound2" {
  target_node = "executor" 
  hostname = "ns2"
  ssh_public_keys = <<-EOT
    ecdsa-sha2-nistp521 AAAAE2VjZHNhLXNoYTItbmlzdHA1MjEAAAAIbmlzdHA1MjEAAACFBAHy9NvDqsnMG6hzbo+k+ZJs2wf2XWlVyQ5gUTlHYhJKo92y220yjDOlW8tsvBBWSA4zSmjamxV70ShiyXBkDC128wDWW4r3Yjm1dQFgfoELG8rkHk5PjSi6Jyx0awfny5hDejLcMSx3+/MBo38/SCX1ZK0ZekC4+wAqPrl1VEHPmYwRKQ== root@salt
    EOT
  vmid = 301
  ostemplate = "shared_isos:vztmpl/debian-10-standard_10.7-1_amd64.tar.gz"
  unprivileged = true

  rootfs {
    storage = "local_vms"
    size = "8G"
  }

  network {
    name = "eth0"
    bridge = "vmbr0"
    ip = "172.16.30.11/24"
    gw = "172.16.30.1"
  }
}
