class rservers::dns::dyn_ext_zone {

  $query = foreman({foreman_user => 'admin',
                  foreman_pass => 'adminadmin',
                  item         => 'hosts',
                  search       => 'hostgroup_fullname ~ Infra/DNS_Auto',
                  filter_result => [ 'hostname', 'ip' ] ,
  })

  #$nodes = $query['results']
  $nodes = $query

  file { '/var/named/zones/ext.dc1.lab.zone.dyn':
    ensure  => file,
    content => template('rservers/dns/ext.dc1.lab.zone.dyn.erb'),
    owner   => 'named',
    group   => 'named',
  }
}
