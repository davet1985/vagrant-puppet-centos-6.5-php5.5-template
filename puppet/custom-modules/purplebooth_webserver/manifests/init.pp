class purplebooth_webserver {
anchor{ "purplebooth_webserver::begin" :
  before => [
  Anchor["purplebooth_webserver::end"],
  Class["purplebooth_webserver::webserver"]
  ],
}

include purplebooth_webserver::webserver
include purplebooth_webserver::phpconf

anchor{ "purplebooth_webserver::end" :
  require => [
  Anchor["purplebooth_webserver::begin"],
  Class["purplebooth_webserver::phpconf", "purplebooth_webserver::webserver"]
  ],
}
}
