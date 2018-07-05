class rservers::jblin::teamviewer {
  yumrepo { 'teamviewer':
    ensure         => 'present',
    baseurl        => 'http://linux.teamviewer.com/yum/stable/main/binary-$basearch/',
    descr          => 'TeamViewer - $basearch',
    enabled        => '1',
    failovermethod => 'priority',
    gpgcheck       => '0',
  }
  package { 'teamviewer':
    ensure => installed,
    require => Yumrepo['teamviewer'],
  }
}
