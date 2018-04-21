class rservers::squid::config {
  file { '/etc/squid/squid.conf':
    ensure  => 'file',
    content => template('rservers/squid/squid.conf.erb'),
    notify  => Service['squid'],
    require => Package['squid'],
  }
}
