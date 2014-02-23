# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "centos-6.5"
  config.vm.hostname = "change-me"
  config.vm.network :private_network, ip: "192.168.40.13"
  config.vm.network :public_network
  config.ssh.forward_agent = true

  config.vm.synced_folder ".", "/vagrant", :mount_options => ["dmode=777","fmode=777"]

  config.vm.provision "shell",
     path: "shell/install-dependencies.sh"

  config.vm.provision :puppet do |puppet|
    puppet.working_directory = "/vagrant/puppet/"
    puppet.manifests_path = "puppet/manifests"
    puppet.manifest_file  = "default.pp"

    puppet.hiera_config_path = "puppet/hiera.yaml"

    puppet.options = [
      "--modulepath /etc/puppet/modules:/vagrant/puppet/modules:/vagrant/puppet/custom-modules",
      "--verbose",
      "--trace",
      "--parser future"
    ]
  end
end
