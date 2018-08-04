class rservers::app01haproxy::config {
  $query = foreman({foreman_user => 'readonly',
                  foreman_pass => 'readonly',
                  item         => 'hosts',
                  search       => 'hostgroup_fullname ~ Windows/App01',
                  per_page      => 1000,
		  filter_result => 'ip',
  })

  $nodes = $query['results']

  file { '/etc/haproxy/haproxy.cfg':
    ensure  => file,
    content => template('rservers/app01/app01haproxy/haproxy.cfg.erb'),
    require => Package['haproxy'],
  }
}
