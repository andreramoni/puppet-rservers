class rservers::jblin::packages {
  yum::group { 'MATE Desktop':
    ensure => present,
    timeout => 1800,
  }
}
