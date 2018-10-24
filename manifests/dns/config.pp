class rservers::dns::config {
  File { 
    ensure  => file,
    owner   => 'root',
    group   => 'named',
    mode    => '0640',
    require => Package[bind],
    notify  => Service[named],
  }
  file { '/etc/named.conf': source  => 'puppet:///modules/rservers/dns/named.conf' }
  file { '/etc/named/zones.conf': source  => 'puppet:///modules/rservers/dns/zones.conf' }
}
