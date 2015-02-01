version=$(shell cat VERSION)
build:
	packer build -var 'version=$(version)' centos7-docker-host.json
