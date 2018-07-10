class rservers::jbwin::bolt {
  package { 'puppet-bolt':
    ensure => installed,
  }
}
