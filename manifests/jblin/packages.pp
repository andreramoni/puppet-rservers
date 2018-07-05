class rservers::jblin::packages {
  yum::group { 'Server with GUI':
    ensure => present,
    timeout => 1800,
  }
  yum::group { 'Cinnamon Desktop':
    ensure => present,
    timeout => 1800,
  }
}
