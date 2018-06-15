class rservers::lab_nsmaster::zones {
  file { '/var/named/zones':
    ensure  => directory,
    recurse => true,
    owner   => 'named',
    group   => 'named',
    source  => 'puppet:///modules/rservers/lab_nsmaster/zones',
    require => Package[bind],
    notify  => Service[named],
  }
}
