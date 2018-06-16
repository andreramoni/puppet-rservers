class rservers::lab_nsmaster::config {
  File { 
    ensure  => file,
    owner   => 'root',
    group   => 'named',
    mode    => '0640',
    source  => 'puppet:///modules/rservers/lab_nsmaster/named.conf',
    require => Package[bind],
    notify  => Service[named],
  }
  file { '/etc/named.conf': source  => 'puppet:///modules/rservers/lab_nsmaster/named.conf' }
  file { '/etc/named/zones.conf': source  => 'puppet:///modules/rservers/lab_nsmaster/zones.conf' }
}
