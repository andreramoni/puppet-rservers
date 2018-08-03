class rservers::app01srv::site {
  iis_site { 'app01':
    ensure          => 'started',
    physicalpath    => 'c:\\inetpub\\app01',
    applicationpool => 'DefaultAppPool',
    require         => Iis_site['Default Web Site'],
  }
}
