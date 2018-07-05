class rservers::jblin::runlevel {
  file { '/etc/systemd/system/default.target':
    ensure => link,
    target => '/lib/systemd/system/graphical.target',
    notify => Exec[reboot],
  }
  exec { 'reboot':
    command     => '/usr/sbin/reboot',
    refreshonly => true,
  }
}
