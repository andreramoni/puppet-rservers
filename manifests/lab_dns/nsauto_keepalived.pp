class rservers::lab_dns::nsauto_keepalived {
  package { 'keepalived':
    ensure => present,
  }
  file { '/etc/keepalived/keepalived.conf':
    content => template('rservers/lab_dns/nsauto-keepalived.conf.erb'),
  }
}
