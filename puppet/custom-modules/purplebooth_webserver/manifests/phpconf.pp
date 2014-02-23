class purplebooth_webserver::phpconf {
package { "libicu" :
  ensure => latest,
}
package { "php55w" :
  ensure => latest,
}
package { "php55w-cli" :
  ensure => latest,
}
package { "php55w-opcache":
  ensure => latest,
}
package { "php55w-common":
  ensure => latest,
}
package { "php55w-gd":
  ensure => latest,
}
package { "php55w-intl":
  ensure => latest,
}
package { "php55w-mbstring":
  ensure => latest,
}
package { "php55w-pdo":
  ensure => latest,
}
package { "php55w-xml":
  ensure => latest,
}
package { "php55w-process":
  ensure => latest,
}

file {"/etc/httpd/conf.d/php5.load":
  ensure => present,
  content => "
<IfModule prefork.c>
  LoadModule php5_module modules/libphp5.so
</IfModule>
<IfModule worker.c>
  LoadModule php5_module modules/libphp5-zts.so
</IfModule>

AddHandler php5-script .php
AddType text/html .php
DirectoryIndex index.php",
  require => [Class['apache'], Package["php55w"]],
  notify => Class['Apache::Service']
}
file {"/etc/php.d/date.timezone.ini":
  ensure => present,
  content => "date.timezone = UTC",
  require => [Class['apache'], Package["php55w"]],
  notify => Class['Apache::Service']
}
file {"/etc/php.d/intl.ini":
  ensure => present,
  content => "; Enable intl extension module
extension=intl.so
[intl]
intl.default_locale = en_utf8
intl.error_level = E_WARNING
",
  require => [Class['apache'], Package["php55w"]],
  notify => Class['Apache::Service']
}
file {"/etc/php.d/maxfileuploadsize.ini":
  ensure => present,
  content => "
upload_max_filesize=10m
",
  require => [Class['apache'], Package["php55w"]],
  notify => Class['Apache::Service']
}
}
