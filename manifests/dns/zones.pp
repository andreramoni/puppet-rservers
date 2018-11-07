class rservers::dns::zones {
  file { '/var/named/zones':
    ensure  => directory,
    recurse => true,
    owner   => 'named',
    group   => 'named',
    source  => 'puppet:///modules/rservers/dns/zones',
    require => [ Package[bind], Class['rservers::dns::dyn_ext_zone'], ],
    notify  => Service[named],
  }
}
