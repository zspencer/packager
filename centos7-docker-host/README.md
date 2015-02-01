# zspencer/centos7-docker-host
This VM is a baseline docker host, similar to boot2docker that is intended to be
production-ish ready. One may use the included packer configuration to build a
golden image for AWS, DigitalOcean, Linode, Rackspace, or other VM providers,
as well as to build a machine that matches them nearly exactly for use in
development.


## Latest Version: 0.1.0
- Virtualbox only
- Has Virtualbox Guest Editions 4.3.18
- Docker 1.4.1

## Usage

### Runtime Requirements
 - [Virtualbox](https://www.virtualbox.org)
 - [Vagrant](https://www.vagrantup.com)

```
$ cd /your/project/directory

$ vagrant init zspencer/centos7-docker-host # Use this in your projects Vagrantfile

# Open up the Vagrantfile and configure it as desired.
# For an example of how to configure your Vagrantfile, see:
#    https://github.com/zspencer/packager/blob/master/Vagrantfile

$ vagrant up  # Starts the Vagrant machine
$ vagrant ssh # Connect into the VM to run docker-related commands

```

## Development
### Development Requirements
 - [Packer](http://packer.io)


```
make build # Runs the build and creates a virtualbox output file.
```

### Releasing
For now, we have to manually release the latest version to VagrantCloud, as the
latest release of packer fails on build.

## Known Issues

### Docker must be restarted before it may mount Virtualbox Shared folders

When using Vagrant with Virtualbox shared folders, docker may need to be
restarted before it will be able to read and write to the virtualbox shared
folders.

You may use the `vagrant-triggers` vagrant plugin to set up an "after start"
trigger in your vagrantfile to restart the docker service:

```
config.trigger.after :up do
  info "Restarting docker to give it access to our folders"
  run_remote "service docker restart"
end
```

### Virtual Machine's guest additions don't match physical machines guest additions.

You may use the `vagrant-vbguest` plugin to ensure the guest additions on the
virtual machine match the version of the guest additions on your physical
machine.
