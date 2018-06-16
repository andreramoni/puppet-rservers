class rservers::lab_dns::nsauto_keepalived {
  package { 'keepalived':
    ensure => present,
  }
  service { 'keepalived':
    ensure => running,
    enable => true,
    require => Package[keepalived],
  }
  file { '/etc/keepalived/keepalived.conf':
    content => template('rservers/lab_dns/nsauto-keepalived.conf.erb'),
    notify  => Service[keepalived],
  }
}
