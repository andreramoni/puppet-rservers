class rservers::lab_nsmaster::service {
  service { 'named':
    ensure => running,
    enable => true,
  }
}
