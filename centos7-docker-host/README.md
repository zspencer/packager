# Builder Host
The Builder Host is a VM for running the application builds for many platforms.
In this case it's a Centos7 VM, but it could be any OS that runs Docker.

## Latest

## Runtime Requirements
 - [Virtualbox](https://www.virtualbox.org)
 - [Vagrant](https://www.vagrantup.com)

## Development Requirements
 - [Packer](http://packer.io)

## Usage

```
$ cd /your/project/directory

$ vagrant init zspencer/centos7-docker-host # Create a new Vagrantfile with this
                                            # image.
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
