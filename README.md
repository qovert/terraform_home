# Experimenting with Proxmox Orchestration

## LXC containers 
Install Proxmox terraform provider from: https://github.com/Telmate/terraform-provider-proxmox

I defined two containers in main.tf. I saw several examples with different methods for using _count_ to specify how many of each container to provision, but generated errors each time I attempted it. The documentation at https://registry.terraform.io/providers/Telmate/proxmox/latest/docs/resources/lxc didn't indicate _count_ was available as an option. 

### Configuration items
Relies on an environment variable **PM_PASS** to define the password for the appropriate proxmox user. 
```bash 
export PM_PASS=SuperSecretAwesomePassword
```
My container templates aren't stored in **local** on my proxmox cluster. To find the path of the template you want to use: 
```bash
# pvesm list <storage location>
```
In my case: 
```bash
# pvesm list shared_isos
<snip>
shared_isos:iso/windows2019.iso                                                                iso     iso        5378007040
shared_isos:vztmpl/debian-10-standard_10.7-1_amd64.tar.gz                                      tgz     vztmpl      231060971
shared_isos:vztmpl/debian-10-turnkey-ansible_16.0-1_amd64.tar.gz                               tgz     vztmpl      455530192.
<snip>
```

## Proxmox permissions: 

```bash
# pveum user add terraform@pve --password SuperSecretAwesomePassword
# pveum aclmod / -user terraform@pve -role Administrator
```

