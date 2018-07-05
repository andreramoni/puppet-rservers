class rservers::jblin::packages {
  yum::group { 'KDE Plasma Workspaces':
    ensure => present,
    timeout => 1800,
  }
  package { ['git', 'chromium']:
    ensure => installed,
  }
}
