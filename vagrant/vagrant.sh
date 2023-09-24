#!/bin/bash

# Update your system
sudo apt-get update

# Install required software
sudo apt-get install -y unzip curl

# Download Vagrant
cd /tmp
curl -O https://releases.hashicorp.com/vagrant/2.2.14/vagrant_2.2.14_x86_64.deb

# Install Vagrant
sudo dpkg -i vagrant_2.2.14_x86_64.deb

# Check Vagrant version
vagrant --version
