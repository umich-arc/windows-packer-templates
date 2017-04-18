Windows Templates for Packer [![Build Status](https://travis-ci.org/arc-ts/windows-packer-templates.svg?branch=master)](https://travis-ci.org/arc-ts/windows-packer-templates)
=============================
Using racker, this repo can generate dynamic packer templates for building Windows VMs.

### Prerequisites: ###
- packer
- ruby with bundler (tested with 2.4.0)
- Virtualbox or QEMU/KVM

### Getting Started ###
1. Install racker by running `bundle install`
- Using the provided `unattend-template.xml` file, use sed or another method to replace the following strings:
  - `111USERNAME` - local user created to run packer scripts
  - `111PASSWORD` - password for local user
  - `111ADMINPASS` - password for built-in admin account
  - `111PRODUCTKEY` - product key for version of Windows being installed
  - `111IMAGENAME` - name of the version of Windows you want to install from the ISO .
  - `111TIMEZONE` - your timezone.
- Use racker to generate your packer template. The syntax is `racker template_1.rb template_2.rb output.json`
- Build your packer images!

### References ###
  - Packer: https://packer.io
  - Racker: https://github.com/aspring/racker
  - Windows Unattend files: https://technet.microsoft.com/en-us/library/cc722132(v=ws.10).aspx
