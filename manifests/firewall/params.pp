class rservers::firewall::params {

  # Firewalls fw0[12].ext.lab
  if $::fqdn =~ /^fw0(1|2)\.ext\.lab$/ {
    $vr_id = '100'
    $vips = [
             { ip => '192.168.12.20/24', label => "${::iface_ext}:0" },
            ]
  }
}
