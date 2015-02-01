# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "zspencer/centos7-docker-host"
  config.vm.box_version = "0.1.0"

  # Providing an IP is useful for setting the a
  config.vm.network "private_network", ip: "192.168.42.50"

  # Ensure that when we ssh into this virtual machine, we can ssh further.
  # See: http://yakking.branchable.com/posts/ssh-A/
  config.ssh.forward_agent = true

  # Share all files in this directory into the VM
  # Useful to allow editing with a GUI editor while still allowing docker
  # containers to access the files.
  config.vm.synced_folder ".", "/project"

  # Restart docker after the vm comes up completely, ensuring Docker has access
  # to our shared folders.
  config.trigger.after :up do
    info "Restarting docker to give it access to our folders"
    run_remote "service docker restart"
  end

  # I prefer to use a folder named "project" instead of one named "vagrant" as
  # the word "vagrant" doesn't convey much information.
  config.vm.synced_folder ".", "/vagrant", disabled: true

  # Tell virtualbox to give the machine more oomf
  config.vm.provider "virtualbox" do |vb|
    # Use all cpu cores. This probably only works on OS X.
    vb.cpus = `sysctl -n hw.ncpu`.to_i

    # Limit the CPUs to 80% of CPU capacity.
    vb.customize ["modifyvm", :id, "--cpuexecutioncap", "80"]

    # Use 1/4 of the RAM (Again, likely only works on OS X)
    vb.memory = `sysctl -n hw.memsize`.to_i / 1024 / 1024 / 4
  end
end
