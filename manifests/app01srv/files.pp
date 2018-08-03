class rservers::app01srv::files {
  file { 'app01':
    ensure  => directory,
    path    => [ 'c:\\inetpub', 'c:\\inetpub\\app01' ],
    recurse => true,
    source  => 'puppet:///modules/rservers/app01',
    require => Iis_site['app01'],
}
}
