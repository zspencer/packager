# Packager
As a developer learning to do ops and infrastructure, it was difficult to learn
how to do reasonably good work around deploying an application to something
other than a platform as a service (such as Heroku).

One of the problems I struggled with most was the creation of installable
packages that can be installed with yum or apt.

Packager is an illustration of a reasonably-ok way to create an installable
package for an application on a variety of platforms.

## What Are This Repositories Goals:
This repository demonstrates [building](#build) a [package](#package) (or
packages) for a variety of target [platforms](#platform). There are several
constraints being applied:

* Installing the package must use a platform's package manager (yum, deb, etc).
* Building the package must be repeatable, regardless of machine.
* The package must be buildable for multiple platforms (CentOS, Nix, Ubuntu,
  etc)

## How Do I Use this Repository?
That's a very good question. To be honest, I'm not entirely sure. I've
considered having the "output" of this repository be a set of starting AMIs,
Vagrant boxes and docker images; but for now I think it'll primarily be for
illustrative purposes. If I start using the images in my daily workflow I'll
likely formalize them as outputs.

For now, I'd recommend reading the [pull requests](pulls?q=is%3Apr+is%3Aclosed)
and the [commit history](commits/master). I'll be storing my
stream-of-consciousness thoughts there.

## How Will We Meet These Goals?
To accomplish this, we have the following tools:

* [FPM](https://github.com/jordansissel/fpm) - [Builds](#build) a
  [package](#package) from a directory or binary.
* [Docker](https://github.com/docker/docker) - Encapsulates a target
  [platform](#platform), installs dependencies, and calls FPM to package code.
* [Vagrant](https://github.com/mitchellh/vagrant) - Runs virtual machines and
  manages network and file system resources.
* [Packer](https://github.com/mitchellh/packer) - Builds a virtual machine image
  to run Docker on OS X.

**Note:**

* Neither Vagrant nor Packer are needed if your machine runs Docker natively.
* Packer builds images for virtual machine providers such as AWS Digital Ocean,
  or Rackspace as well as Vagrant with VirtualBox, VMWare or Parallels. This
  makes Packer a convenient tool for consistent development and production
  environments.

## What This Repository Doesn't Cover

* Distribution - This changes based on target platform. I personally use an s3
  bucket per client and upload/download the packages with
  [awscli](/http://aws.amazon.com/cli/)
* Deployment   - Look into [ansible](https://github.com/ansible/ansible) or
  [salt](https://github.com/saltstack/salt) for that.
* Provisioning - Look into [fog](https://github.com/fog/fog) or
  [libcloud](https://github.com/apache/libcloud)


## Definitions
These following are working definitions for the intents of this repository:

#### Platform
The operating system and package management system that a package runs on

#### Package
A single file that may be expanded or installed and run on a platform.

#### Build
The act of taking source code and turning it into a package.

