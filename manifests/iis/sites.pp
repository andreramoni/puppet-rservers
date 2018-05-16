class rservers::iis::sites {

  iis_site { 'Default Web Site':
    ensure => 'absent',
  }

  iis_site { 'minimal':
    ensure          => 'started',
    physicalpath    => 'c:\\inetpub\\minimal',
    applicationpool => 'DefaultAppPool',
    require         => File['minimal'],
  }
  file { 'minimal':
    ensure => 'directory',
    path   => 'c:\\inetpub\\minimal',
  }
}
