Vagrant.require_version ">= 1.7.0"

$install_ansible = <<SCRIPT
sudo apt-get update -y
sduo reboot
SCRIPT


$install_ansible = <<SCRIPT
sudo apt-get update -y
sudo apt-get install software-properties-common -y
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update -y
sudo apt-get install ansible -y
SCRIPT

$set_permissions_to_owner_only = <<SCRIPT
sudo chown vagrant /tmp/vault_password
sudo chmod 640 /tmp/vault_password
SCRIPT

$delete_password = <<SCRIPT
sudo rm /tmp/vault_password
SCRIPT

# $set_permissions_to_owner_only = <<SCRIPT
# sudo chown vagrant /tmp/vault_pass
# sudo chmod 640 /tmp/vault_pass
# SCRIPT

Vagrant.configure(2) do |config|
    config.vm.box = "roboxes/ubuntu2204"
    # config.ssh.private_key_path = "C:\\Users\\danfo\\.ssh\\id_rsa"
    # config.ssh.forward_agent = true
    config.vm.synced_folder ".", "/vagrant", create: true
    config.vm.provider "hyperv" do |v|
      v.maxmemory = 4096
      v.memory = 4096
      v.cpus = 4
      v.enable_virtualization_extensions = true
      v.auto_stop_action = "ShutDown"
      v.auto_start_action = "Start"
    end
  # REMEMBER!!! ADD PASSWORD FILE FOR THIS TO WORK.
    config.vm.provision "file", source: "./vault_password", destination: "/tmp/vault_password"
    config.vm.provision "shell", inline: $set_permissions_to_owner_only, run: "always"

    config.vm.provision "file", source: "./provision", destination: "/home/vagrant/"
    config.vm.provision "shell", inline: $install_ansible, run: "always"
    config.vm.define "github_build_agent" do |buildagent|
      buildagent.vm.provision 'preemptively give others write access to /etc/ansible/roles', type: :shell, inline: <<~'EOM'
        mkdir /etc/ansible/roles -p
        chmod o+w /etc/ansible/roles
        EOM

        buildagent.vm.provision "ansible_local" do |ansible|
            ansible.verbose             = true
            ansible.playbook            = 'provision/GitHubBuildAgent.yml' 
            ansible.galaxy_role_file    = 'provision/requirements.yml' 
            ansible.galaxy_roles_path   = '/etc/ansible/roles'
            ansible.vault_password_file = "/tmp/vault_password"
        end     
    end    
    config.vm.provision "shell", inline: $delete_password, run: "always"
end
    