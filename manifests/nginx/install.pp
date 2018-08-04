class rservers::nginx::install {
  package { 'nginx':
    ensure => installed,
  }
}

