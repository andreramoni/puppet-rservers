class rservers::app01srv::files {
  file { 'app01':
    ensure  => directory,
    path    => 'c:\\inetpub\\app01',
    recurse => true,
    source  => 'puppet:///modules/rservers/app01/app01srv',
    require => Iis_site['app01'],
}
}
