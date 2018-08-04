class rservers::app01nginx::config {
  $query = foreman({foreman_user => 'readonly',
                  foreman_pass => 'readonly',
                  item         => 'hosts',
                  search       => 'hostgroup_fullname ~ Windows/App01',
		  filter_result => [ 'ip' ] ,
  })

  #$nodes = $query['results']
  $nodes = $query

  file { '/etc/nginx/nginx.conf':
    ensure  => file,
    content => template('rservers/app01/app01nginx/nginx.conf.erb'),
    require => Package['nginx'],
  }
}
