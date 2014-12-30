#!/bin/bash

mkdir ~vagrant/.ssh
wget --no-check-certificate \
yum    'https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub' \
    -O ~vagrant/.ssh/authorized_keys
chown -R vagrant ~vagrant/.ssh
chmod -R go-rwsx ~vagrant/.ssh

echo "Adding docker group to vagrant user"
usermod -G docker -a vagrant
