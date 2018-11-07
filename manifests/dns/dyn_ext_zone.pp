class rservers::dns::dyn_ext_zone {

  $query = foreman({foreman_user => 'readonly',
                  foreman_pass => 'readonly',
                  item         => 'hosts',
#                  search       => 'hostgroup_fullname ~ Infra/DNS_Auto',
                  filter_result => [ 'certname', 'ip' ] ,
  })

  $nodes = $query
  notify {"Foi ${::nodes}": }


  file { '/var/named/zones/ext.dc1.lab.zone.dyn':
    ensure  => file,
    content => template('rservers/dns/ext.dc1.lab.zone.dyn.erb'),
    owner   => 'named',
    group   => 'named',
  }
}
