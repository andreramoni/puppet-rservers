class rservers::firewall::params {

  # Firewalls fw0[12].ext.lab
  if $::fqdn =~ /^fw0(1|2)\.ext\.lab$/ {
    $vr_id_ext = '100'
    $vips_ext  = [ { ip => '192.168.12.254/24', label => "${::iface_ext}:0" }, ]
    $vr_id_srv = '101'
    $vips_srv = [ { ip => '10.0.0.1/16', label => "${::iface_srv}:0" }, ]
    $vr_id_dmz1 = '102'
    $vips_dmz1 = [ { ip => '10.1.0.1/16', label => "${::iface_dmz1}:0" }, ]
  }
}
