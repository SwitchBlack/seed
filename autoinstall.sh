#!/bin/bash

#check to see if we already have the repo
if ! grep -Fxq "deb http://ftp.debian.org/debian jessie-backports main" /etc/apt/sources.list.d/jessie-backports.list ; then
	echo "adding jessie-backports to /etc/apt/sources.list.d/jessie-backports.list"
	echo "deb http://ftp.debian.org/debian jessie-backports main" > /etc/apt/sources.list.d/jessie-backports.list
else
	echo "jessie-backports already in /etc/apt/sources.list.d/jessie-backports.list"
fi
apt-get -y update
apt-get -y -t jessie-backports install "ca-certificates-java" 
apt-get -y -t jessie-backports install "openjdk-8-jre-headless"
apt-get -y -t jessie-backports install "openjdk-8-jdk-headless"
apt-get -y install puppetserver

if [ -f puppet6-release-jessie.deb ]; then
	echo "old puppet package found, deleting..."
	rm -y ./puppet6-release-jessie.deb
else
	echo "old puppet package not found, wgetting..."
fi

wget https://apt.puppetlabs.com/puppet6-release-jessie.deb
sudo dpkg -i puppet6-release-jessie.deb
apt-get -y update
apt-get -y install puppetserver
puppetserver ca setup

service puppet start
