class rservers::pawin::openssh {
  package { 'openssh':
    ensure => installed,
  }
}
