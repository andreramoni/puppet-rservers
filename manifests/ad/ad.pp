class rservers::ad::ad {
  windowsfeature { 'Active\ Directory\ Domain\ Services':
    ensure => 'present',
#    installmanagementtools => true,
  }  
}
