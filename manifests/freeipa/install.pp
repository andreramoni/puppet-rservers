class rservers::freeipa::install {
  package { 'freeipa-server':
    ensure => present,
    notify => Exec['freeipa initial install'],
  }
  exec { 'freeipa initial install':
    refreshonly => true,
    command     => "/usr/sbin/ipa-server-install -U -p 'adminadmin' -a 'adminadmin' -r ${::domain}",
    timeout     => 1200,
  }
}
