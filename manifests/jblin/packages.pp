class rservers::jblin::packages {
  yum::group { 'KDE Plasma Workspaces':
    ensure => present,
    timeout => 1800,
  }
user { 'admin':
  ensure           => 'present',
  gid              => '100',
  groups           => ['wheel'],
  home             => '/home/admin',
  password         => '$5$WcnT3Zb2$RS.VJHPUBPw4r5nbGqnPEqvsq3GJsBSZwFdxt7GVow0',
  password_max_age => '99999',
  password_min_age => '0',
  shell            => '/bin/bash',
  uid              => '1000',
}
}
