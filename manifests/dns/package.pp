class rservers::dns::package {
  package { 'bind':
    ensure => present,
  }
}
