#!/bin/bash -eux

echo "Installing Docker"
yum -y install docker-1.3.2

systemctl enable docker
service docker start
