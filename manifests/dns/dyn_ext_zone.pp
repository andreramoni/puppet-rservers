class rservers::dns::dyn_ext_zone {
  file { '/var/named/zones/ext.dc1.lab.zone.dyn':
    ensure  => file,
    content => template('templates/dns/ext.dc1.lab.zone.dyn.erb'),
    owner   => 'named',
    group   => 'named',
    notify  => Service[named],
  }
}
