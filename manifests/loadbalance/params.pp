class rservers::loadbalance::params {
  if $::fqdn =~ /^centos\.localdomain$/ {
      $vr_rid_prod = '100'
      $vips = [
               { ip => '10.10.10.100/24', label => "${facts['networking']['primary']}:0" },
              ]
  }

}

