locals {
  machine_map = {
    machines = {
      m1 = {
        name                = "github-actions"
        target_node         = "proxmox" # Name of the Proxmox Server
        qemu_os             = "Linux" # Type of Operating System
        os_type             = "cloud-init" # Set to cloud-init to utilize templates
        agent               = 1           # Set to 1 to enable the QEMU Guest Agent. Note, you must run the qemu-guest-agent daemon in the guest for this to have any effect.
        full_clone          = true        # Set to true to create a full clone, or false to create a linked clone. See the docs about cloning for more info. Only applies when clone is set.
        template            = "ubuntu-2204-cloudinit-template" # Name of Template Used to Clone
        cores               = 4
        socket              = 1
        memory              = 6144
        storage             = "30G" # Size of Secondary hard drive assiged as bootable
        ip_address          = "192.168.50.51"
        gateway             = "192.168.50.1"
        description         = "Github Actions Runner"
        ssh_user            = "ubuntu"
        mac_address         = "02:07:14:b4:37:24"
        disk_type           = "virtio"
        storage_dev         = "local-zfs"
        network_bridge_type = "vmbr0"
        network_model       = "virtio"
        # cloud_init_pass     = "<your password>"
        automatic_reboot    = true
        network_firewall    = false #defaults to false
        dns_servers         = "192.168.50.22"#
        ssh_key             = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDu0/2qXJCD7n/6eZNgvzkZNKYwDX1Po4fwFkAUvncnRh/hfTujgMjoRtXH7IqwC6PpwYLy1Knk5zo1HPmTM7g8AhpZU44j1+CUXUIYHB5ZZdmfGuvMMFkTWvBLEmnpDGmS0bOFtFrFm7tTxQhKT/43mN4XrpZEjhMOvzp/Xek9EIGXBaTuEKd6ijhSdEvAW+65fE0FCahKlATbwyVZE0XoK7h0bRhz8/aDNV8oPBdAfFdl+goXkeVwTTl9FYkBacekSQjCS5awKhMmVvH65czUk/QPv7/+A4Dr2yQkBafdep4Xn8IxVb+wg7J9NsGasRJ3OTLgHFmUbDUSxVCJJJnH dan@Dans-PC"
      }
    }
  }

  machines = lookup(local.machine_map, "machines", {})
}