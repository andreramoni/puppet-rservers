class rservers::jblin::packages {
  yum::group { 'KDE Plasma Workspaces':
    ensure => present,
  }
}
