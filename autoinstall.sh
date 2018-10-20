#!/bin/bash
if ! grep -Fxq "deb http://ftp.debian.org/debian jessie-backports main" /etc/apt/sources.list.d/jessie-backports.list ; then
	echo "deb http://ftp.debian.org/debian jessie-backports main" > /etc/apt/sources.list.d/jessie-backports.list
fi
apt-get -y update
apt-get -y -t jessie-backports install "ca-certificates-java" 
apt-get -y -t jessie-backports install "openjdk-8-jre-headless"
apt-get -y -t jessie-backports install "openjdk-8-jdk-headless"
apt-get -y install puppetserver

wget https://apt.puppetlabs.com/puppet6-release-jessie.deb
sudo dpkg -i puppet6-release-jessie.deb
apt-get -y update
apt-get -y install puppetserver
puppetserver ca setup

service puppet start
