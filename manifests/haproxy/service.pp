class rservers::haproxy::service {
  service { 'haproxy':
    ensure => running,
    enable => true,
    require => Package['haproxy'],
  }
}

