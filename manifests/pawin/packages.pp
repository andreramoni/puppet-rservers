class rservers::pawin::install {

  $pawin_packages = ['teamviewer','putty','openssh']
  package { $pawin_packages:
    ensure => installed,
  }
}
