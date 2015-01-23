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
