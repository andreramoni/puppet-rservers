class rservers::app01haproxy::config {
  $query = foreman({foreman_user => 'readonly',
                  foreman_pass => 'readonly',
                  item         => 'hosts',
                  search       => 'hostgroup_fullname ~ DevTeam01/DevTeam01_App01NGinx',
		  filter_result => [ 'certname', 'ip' ] ,
  })

  #$nodes = $query['results']
  $nodes = $query

  file { '/etc/haproxy/haproxy.cfg':
    ensure  => file,
    content => template('rservers/app01/app01haproxy/haproxy.cfg.erb'),
    require => Package['haproxy'],
    notify => Service['haproxy'],
  }
}
