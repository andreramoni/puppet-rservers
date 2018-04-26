class rservers::firewall::params {

  # Firewalls fw0[12].ext.lab
  if $::fqdn =~ /^fw0(1|2)\.ext\.lab$/ {
    $vr_id_ext = '100'
    $vips_ext  = [ { ip => '192.168.12.20/24', label => "${::iface_ext}:0" }, ]
    $vr_id_mgmt = '101'
    $vips_mgmt = [ { ip => '10.255.0.250/16', label => "${::iface_mgmt}:0" }, ]
  }
}
