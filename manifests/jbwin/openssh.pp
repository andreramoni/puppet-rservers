class rservers::jbwin::openssh {
  package { 'openssh':
    ensure => installed,
  }
}
