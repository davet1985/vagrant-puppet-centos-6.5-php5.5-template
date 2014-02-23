class purplebooth_firewall {

service {"iptables" :
  ensure => stopped,
  enable => false
}

}
