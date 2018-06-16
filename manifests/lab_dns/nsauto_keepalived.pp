class rservers::lab_dns::nsauto_keepalived {
  package { 'keepalived':
    ensure => present,
  }
}
