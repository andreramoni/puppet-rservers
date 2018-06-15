class rservers::lab_nsmaster::package {
  package { 'bind':
    ensure => present,
  }
}
