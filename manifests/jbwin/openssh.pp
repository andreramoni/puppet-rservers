class rservers::jbwin::openssh {
  package { 'mls-software-openssh':
    ensure => installed,
  }
}
