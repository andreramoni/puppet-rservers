class rservers::dns::dyn_ext_zone {

  $query = foreman({foreman_user => 'readonly',
                  foreman_pass => 'readonly',
                  item         => 'hosts',
                  search       => 'domain = ext.dc1.lab',
                  filter_result => [ 'ip' ] ,
  })

  $nodes = $query


  file { '/var/named/zones/ext.dc1.lab.zone.dyn':
    ensure  => file,
    content => template('templates/dns/ext.dc1.lab.zone.dyn.erb'),
    owner   => 'named',
    group   => 'named',
    notify  => Service[named],
  }
}
