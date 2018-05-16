class rservers::iis::install {

  $iis_features = [ 'Web-WebServer',
                    'Web-Scripting-Tools',
                    'Web-Asp-Net45',
                   ]

  windowsfeature { $iis_features:
    ensure => 'present',
    installmanagementtools => true,
  }
}
