#!/bin/bash

wget https://apt.puppetlabs.com/puppet6-release-jessie.deb
sudo dpkg -i puppet6-release-jessie.deb
sudo apt-get update
sudo apt-get install puppet-agent
