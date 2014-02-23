vagrant-puppet-centos-6.5-php5.5-template
=========================================

A template project containing the puppet for a basic VM that runs apache, PHP5.5 on Centos 6.6.

Configuration
-------------

This VM will work out of the box. However to a hostname applicable you, change [the hostname line](https://github.com/PurpleBooth/vagrant-puppet-centos-6.5-php5.5-template/blob/master/Vagrantfile#L9) in the Vagrantfile
```ruby
config.vm.hostname = "change-me"
```

And rename the heira data file "[puppet/hieradata/change-me.yaml](https://github.com/PurpleBooth/vagrant-puppet-centos-6.5-php5.5-template/blob/master/puppet/hieradata/change-me.yaml)" to match the hostname.

How to use
----------
Just use it like normal

```bash
vagrant up
```

If you don't have a centos-6.5 base image, use [veewee](https://github.com/jedi4ever/veewee) to make one.
```bash
veewee vbox define 'centos-6.5' 'CentOS-6.5-x86_64-netboot'
veewee vbox build 'centos-6.5'
veewee vbox export 'centos-6.5'
vagrant box add 'centos-6.5' 'centos-6.5.box'
```

Xdebug
------

You can find the webserver running at [http://192.168.40.13](http://192.168.40.13).
Xdebug is configured to connect back to the host machine on port 9000 with xdebug key: php-xdebug.


Network interfaces
------------------

Guest machine is *192.168.40.13*
Host machine is *192.168.40.1* from guest.

Public IP is also provisioned. Will be whatever is assigned via DHCP.
