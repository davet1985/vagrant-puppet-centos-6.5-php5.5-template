class purplebooth_webserver_dev_additions {

package { "php55w-pecl-xdebug":
  ensure => latest,
}

file {"/etc/php.d/xdebug.ini":
  ensure => present,
  content => "; Enable xdebug extension module
zend_extension=/usr/lib64/php/modules/xdebug.so
xdebug.max_nesting_level = 250
xdebug.default_enable = 1
xdebug.remote_autostart = 1
xdebug.remote_connect_back = 1
xdebug.remote_enable = 1
xdebug.remote_handler = dbgp
xdebug.remote_port = 9000
xdebug.remote_host = 192.168.40.1
xdebug.idekey = php-xdebug
",
  require => [Class['apache'], Package["php55w-pecl-xdebug"]],
  notify => Class['Apache::Service']
}

}
