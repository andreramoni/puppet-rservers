class rservers::dns::service {
  service { 'named':
    ensure => running,
    enable => true,
  }
}
