class rservers::lab_dns::named_service {
  service { 'named':
    ensure => running,
    enable => true,
  }
}
