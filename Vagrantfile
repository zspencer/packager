# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "builder_host"
  config.vm.network "private_network", ip: "192.168.42.50"
  config.ssh.forward_agent = true

  # Share all files into the VM so they can be shared
  # with the docker containers.
  config.vm.synced_folder ".", "/project"

  # Syncing the vagrant folder doesn't reveal any
  # symantic meaning.
  config.vm.synced_folder ".", "/vagrant", disabled: true


  # Configure virtualbox to give the machine more oomf
  config.vm.provider "virtualbox" do |vb|
    # Use all cpu cores at 80% of CPU capacity.
    vb.cpus = `sysctl -n hw.ncpu`.to_i
    vb.customize ["modifyvm", :id, "--cpuexecutioncap", "80"]

    # Use 1/4 of the RAM
    vb.memory = `sysctl -n hw.memsize`.to_i / 1024 / 1024 / 4
  end
end
