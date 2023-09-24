#!/bin/bash
set -e

# check if Vagrant is installed
if ! command -v vagrant &> /dev/null
then
    echo "Vagrant could not be found. Please install Vagrant before running this script."
    exit
fi

# name of the Vagrant box
BOX_NAME="bento/ubuntu-18.04"

# check if the box is already added
if ! vagrant box list | grep -q "$BOX_NAME"; then
    echo "Adding Vagrant box $BOX_NAME..."
    vagrant box add "$BOX_NAME"
fi

# Check if a Vagrantfile exists in the current directory
if [ ! -f Vagrantfile ]; then
    echo "Creating Vagrantfile for box $BOX_NAME..."
    echo "Vagrant.configure(\"2\") do |config|" > Vagrantfile
    echo "  config.vm.box = \"$BOX_NAME\"" >> Vagrantfile
    echo "end" >> Vagrantfile
fi

# check if the box is already running
if ! vagrant status | grep -q running; then
    echo "Starting Vagrant box $BOX_NAME..."
    vagrant up --provider virtualbox
else
    echo "Vagrant box $BOX_NAME is already running."
fi
