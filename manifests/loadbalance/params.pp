class rservers::loadbalance::params {
  if $::fqdn =~ /^centos\.localdomain$/ {
      $vr_rid_prod = '100'
      $vips = [
               { ip => '10.49.1.226/21', label => "${facts['networking']['primary']}:0" },
              ]
  }

}

