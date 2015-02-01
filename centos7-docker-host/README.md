# Builder Host
The Builder Host is a VM for running the application builds for many platforms.
In this case it's a Centos7 VM, but it could be any OS that runs Docker.

## Requirements
 - [Packer](http://packer.io)
 - [Virtualbox](https://www.virtualbox.org)

## Usage

```
$ make build # Packer assembles the Vagrant box
$ make add   # Adds the Vagrant Box to your local set of available vagrant
             # boxes

$ cd /your/project/directory

$ vagrant init builder_host # Creates a new Vagrantfile with the builder.
                            # For an example of how to configure your
                            # Vagrantfile, see:
                            # https://github.com/zspencer/packager/blob/master/Vagrantfile
$ vagrant up  # Starts the Vagrant machine
$ vagrant ssh # Connect into the VM
```


## Known Issues

### Docker must be restarted before it may mount Virtualbox Shared folders

At this time, when using Vagrant with Virtualbox shared folders, docker may need
to be restarted before it will be able to see the shared folders.

If you install the `vagrant-triggers` vagrant plugin, you can set up an "after
start" trigger in your vagrantfile restart the docker service:

```
config.trigger.after :up do
  info "Restarting docker to give it access to our folders"
  run_remote "service docker restart"
end
```

### Virtual Machine's guest additions don't match physical machines guest additions.

I recommend using the `vagrant-vbguest` plugin to ensure the guest additions on
your physical machine match the guest additions on the virtual machine.
