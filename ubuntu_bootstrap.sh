#!/bin/bash

apt-get update -y
apt-get upgrade -y
wget http://apt.puppetlabs.com/puppetlabs-release-pc1-xenial.deb
dpkg -i puppetlabs-release-pc1-xenial.deb
apt-get update -y
apt-get -y install puppet
apt -y install mcollective-client

puppet config set server cfaserv.astate.edu
puppet config set environment production
puppet agent --enable
puppet agent -t --waitforcert 30 >> /var/log/puppetagent.log

reboot


