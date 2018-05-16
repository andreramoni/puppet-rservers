class rservers::windows::install {
  $dotnet_features = [ 'Net-Framework-45-Features',
                       'Net-Framework-45-Core', 
                       'Net-Framework-45-ASPNET',]

  windowsfeature { $dotnet_features:
    ensure => present,
  }

}
