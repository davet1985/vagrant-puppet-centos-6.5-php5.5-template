class davet1985_mysql {

package {"mysql-server":
  ensure => "latest",
  notify => Service['mysqld']
}

service {"mysqld" :
  ensure => running,
  enable => true
}

}