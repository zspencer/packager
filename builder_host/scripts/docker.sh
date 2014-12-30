#!/bin/bash -eux

echo "Installing Docker"
yum -y install docker-1.3.2

service docker start
