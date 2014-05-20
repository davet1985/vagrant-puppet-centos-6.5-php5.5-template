#!/bin/sh

if [ ! -f /.initial-setup-has-run ]
then
  sudo rpm -Uvh http://mirror.webtatic.com/yum/el6/latest.rpm

  sudo gem install librarian-puppet
  sudo yum -y install git

  touch /.initial-setup-has-run
fi

cd /vagrant/puppet && librarian-puppet install
