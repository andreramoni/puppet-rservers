class rservers::app01srv::site {

  iis_site { 'Default Web Site':
    ensure => 'absent',
  }

  iis_site { 'app01':
    ensure          => 'started',
    physicalpath    => 'c:\\inetpub\\app01',
    applicationpool => 'DefaultAppPool',
    require         => [ File['app01'], Iis_site['Default Web Site'] ]
  }
}
