class rservers::iis::remove_default_site {

  iis_site { 'Default Web Site':
    ensure => 'absent',
  }

}
