class rservers::nginx::config {
  file { '/etc/nginx':
    ensure  => directory,
    recurse => true,
    source  => 'puppet:///modules/rservers/nginx/config',
    require => Package['nginx'],
  }
}

