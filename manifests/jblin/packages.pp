class rservers::jblin::packages {
  yum::group { 'Cinnamon Desktop':
    ensure => present,
    timeout => 1800,
  }
}
