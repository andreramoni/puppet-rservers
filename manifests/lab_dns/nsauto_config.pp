class rservers::lab_dns::nsauto_config {
  File { 
    ensure  => file,
    owner   => 'root',
    group   => 'named',
    mode    => '0640',
    require => Package[bind],
    notify  => Service[named],
  }
  file { '/etc/named.conf': source  => 'puppet:///modules/rservers/lab_dns/nsauto-named.conf' }
  file { '/etc/named/zones.conf': source  => 'puppet:///modules/rservers/lab_dns/nsauto-zones.conf' }
}
