Windows Templates for Packer [![Build Status](https://travis-ci.org/arc-ts/windows-packer-templates.svg?branch=master)](https://travis-ci.org/arc-ts/windows-packer-templates)
=============================
Using racker, this repo can generate dynamic packer templates for building Windows VMs.

### Prerequisites: ###
- packer
- ruby with bundler (tested with 2.4.0)
- Virtualbox or QEMU/KVM

### Getting Started ###
1. Install racker by running `bundle install`
- Using the provided `unattend-template.xml` file, use sed or another method to replace the following strings and make a file called `Autounattend.xml`:
  - `111USERNAME` - local user created to run packer scripts
  - `111PASSWORD` - password for local user
  - `111ADMINPASS` - password for built-in admin account
  - `111PRODUCTKEY` - product key for version of Windows being installed
  - `111IMAGENAME` - name of the version of Windows you want to install from the ISO .
  - `111TIMEZONE` - your timezone.
- Use racker to generate your packer template. The syntax is `racker template_1.rb template_2.rb output.json`
- Build your packer images!

#### Required Environment Variables ####
- `VM_NAME` - VM name
- `WINRM_USER` - username for packer WinRM
- `WINRM_PASS` - password for WinRM user
- `NUM_CPU` - number of CPUs for VM
- `MB_RAM` - MB of RAM for VM
- `UNATTEND_FILE` - path to `Autounattend.xml` file created in previous steps.

#### Optional Environment variables ####
- `PACKER_TEMPLATE_ROOT` - prefix for drivers/scripts folders
- `CLOUDBASE_CONFIG_ROOT` - prefix for cloudbase_config folder
- `GUEST_FILES_ROOT` - prefix for guest_os_files folder


### References ###
  - Packer: https://packer.io
  - Racker: https://github.com/aspring/racker
  - Windows Unattend files: https://technet.microsoft.com/en-us/library/cc722132(v=ws.10).aspx
