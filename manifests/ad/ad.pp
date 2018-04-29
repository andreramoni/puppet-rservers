class rservers::ad::ad {
  $ad_features = ['Active Directory Domain Services' ] 
  windowsfeature { $ad_features:
    ensure => 'present',
    installmanagementtools => true,
  }  
}
