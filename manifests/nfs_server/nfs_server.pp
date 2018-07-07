class rservers::nfs_server::nfs_server {
  service { 'nfs':
    ensure => running,
    enable => true,
    require => Package[nfs-utils],
  }
  file { '/etc/exports':
    ensure  => file,
    content => '/data *(rw,no_root_squash)',
    notify  => Service[nfs],
  }
  package { 'nfs-utils':
    ensure => installed,
  }
}
