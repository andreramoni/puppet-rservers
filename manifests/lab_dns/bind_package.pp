class rservers::lab_dns::bind_package {
  package { 'bind':
    ensure => present,
  }
}
