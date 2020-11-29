# Multi Vagrant Machine Task

## Intro
Vagrant is able to control multiple guest machines per vagrantfile i.e. multi-machine environment.

## Pre-requisites
- Install Vagrant
- Install VirtualBox
- Install Ruby
- Install Bundler

## Instructions
To work in this box:
1. Clone repo/copy files into your code editor
2. In commandline/bash make sure youre in the folder containing Vagrantfile and run:
```bash
vagrant up
```

Now the app is running on:
- ip: 192.168.10.100

Db running on:
- ip: 192.168.10.200

**To see website working**
1. In commandline/bash where vagrant file is `vagrant ssh app`
2. Inside the VM, run `cd /home/ubuntu/app`
3. Run `sudo npm install`
4. Run `sudo npm start`

The website will now be running on:
- 192.168.10.100:3000
- 192.168.10.100:3000/fibonacci/{index}
- 192.168.10.100:3000/poststest I
