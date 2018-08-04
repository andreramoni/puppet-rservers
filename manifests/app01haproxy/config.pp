class rservers::app01haproxy::config {
  file { '/etc/haproxy/haproxy.cfg':
    ensure  => file,
    content => template('rservers/app01/app01haproxy/haproxy.cfg.erb'),
    require => Package['haproxy'],
  }
}
