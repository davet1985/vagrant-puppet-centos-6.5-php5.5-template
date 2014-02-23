#!/bin/sh

sudo rpm -Uvh http://mirror.webtatic.com/yum/el6/latest.rpm

sudo gem install librarian-puppet
sudo yum -y install git

cd /vagrant/puppet && librarian-puppet install