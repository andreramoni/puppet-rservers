class rservers::firewall::keepalived (
  $vips   = $::rservers::firewall::params::vips,
  $vr_id_ext  = $::rservers::firewall::params::vr_id_ext,
  $vr_id_mgmt  = $::rservers::firewall::params::vr_id_mgmt,
) inherits rservers::firewall::params {

  include ::keepalived

  ::keepalived::vrrp::instance { $vr_id:
    interface         => $::iface_ext,
    state             => 'BACKUP',
    virtual_router_id => $vr_id_ext,
    priority          => '100',
    auth_type         => 'PASS',
    auth_pass         => 'secretpass',
    virtual_ipaddress => $vips_ext,
    track_interface   => $::iface_ext,
    #track_script      => [ 'check_haproxy' ],
  }
  
  ::keepalived::vrrp::instance { $vr_id:
    interface         => $::iface_mgmt,
    state             => 'BACKUP',
    virtual_router_id => $vr_id_mgmt,
    priority          => '100',
    auth_type         => 'PASS',
    auth_pass         => 'secretpass',
    virtual_ipaddress => $vips_mgmt,
    #track_interface   => $::iface_ext,
    #track_script      => [ 'check_haproxy' ],
  }

  ::keepalived::vrrp::script { 'check_haproxy':
    script   => '/usr/bin/killall -0 haproxy',
    interval => '1', # 2
    fall     => '3', # 3
    rise     => '3', # 3
  }
}

