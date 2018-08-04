class rservers::haproxy::install {
  package { 'haproxy':
    ensure => installed,
  }
}

