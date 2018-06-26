class rservers::testing {
  class { '::icinga2':
    manage_repo => true,
    features    => ['checker', 'mainlog', 'command'],
  }
  
}

