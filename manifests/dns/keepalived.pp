class rservers::dns::keepalived {
  package { 'keepalived':
    ensure => present,
  }
  service { 'keepalived':
    ensure => running,
    enable => true,
    require => Package[keepalived],
  }
  file { '/etc/keepalived/keepalived.conf':
    content => template('rservers/dns/keepalived.conf.erb'),
    notify  => Service[keepalived],
    require => Package[keepalived],
  }
}
