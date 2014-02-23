class purplebooth_webserver::webserver {
anchor{ "purplebooth_webserver::webserver::begin" :
  before => [
  Class["apache::mod::rewrite"],
  Anchor["purplebooth_webserver::webserver::end"]
  ],
}

class { 'apache':
  default_vhost =>false
}

apache::vhost { 'default-80':
  port    => '80',
  docroot => '/vagrant/web',
  override => "All",
}

include apache::mod::rewrite

exec {"rm -rf /var/www/html && ln -s /vagrant/web /var/www/html":
  require => Class['apache']
}

anchor{ "purplebooth_webserver::webserver::end" :
  require => [
  Anchor["purplebooth_webserver::webserver::begin"],
  Class["apache::mod::rewrite"]
  ],
}
}
