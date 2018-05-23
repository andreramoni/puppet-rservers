class rservers::iis::sites {

  iis_site { 'Default Web Site':
    ensure => 'absent',
  }

  iis_site { 'myapp':
    ensure          => 'started',
    physicalpath    => 'c:\\inetpub\\myapp',
    applicationpool => 'DefaultAppPool',
    require         => [ File['myapp'], Iis_site['Default Web Site'] ]
  }
  file { 'myapp':
    ensure => 'directory',
    path   => 'c:\\inetpub\\myapp',
  }
}
