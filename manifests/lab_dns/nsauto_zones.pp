class rservers::lab_dns::nsauto_zones {
  file { '/var/named/zones':
    ensure  => directory,
    recurse => true,
    owner   => 'named',
    group   => 'named',
    source  => 'puppet:///modules/rservers/lab_dns/nsauto-zones',
    require => Package[bind],
    notify  => Service[named],
  }
}
