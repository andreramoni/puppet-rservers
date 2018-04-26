class rservers::firewall::params {

  # Firewalls fw0[12].ext.lab
  if $::fqdn =~ /^fw0(1|2)\.ext\.lab$/ {
    $vr_id = '100'
    $vips_ext = [ { ip => '192.168.12.20/24', label => "${::iface_ext}:0" }, ],
    $vips_mgmt = [ { ip => '10.255.0.250/16', label => "${::iface_mgmt}:0" }, ],
  }
}
