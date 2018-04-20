class rservers::windows::iis {

  $iis_features = [ 'Web-WebServer',
                    'Web-Scripting-Tools',
                    'Web-Asp-Net45',
                   ]

  windowsfeature { $iis_features:
    ensure => 'present',
    installmanagementtools => true,
  } 
#  iis::manage_site { 'Default Web Site':
#    ensure => absent,
#    site_path => 'any',
#    app_pool => 'DefaultAppPool',
#  }

}
