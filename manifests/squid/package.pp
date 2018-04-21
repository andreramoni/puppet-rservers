class rservers::squid::package {
  package { 'squid':
    ensure => present,
  }
}
