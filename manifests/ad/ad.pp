class rservers::ad::ad {
  windowsfeature { 'ad-domain-services':
    ensure => 'present',
    installmanagementtools => true,
  }  
}
