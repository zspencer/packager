#!/bin/bash -eux

echo "Installing Docker"
# We install 1.3.2 to get the proper systemd/etc
yum -y install docker-1.3.2
service docker stop

# And immediately upgrade it to 1.4.1
wget https://get.docker.com/builds/Linux/x86_64/docker-1.4.1 -O docker
mv docker /usr/bin/docker
chmod +x /usr/bin/docker

systemctl enable docker
service docker start
