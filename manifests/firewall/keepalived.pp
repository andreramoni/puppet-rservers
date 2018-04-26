class rservers::firewall::keepalived (
  $vips   = $::rservers::firewall::params::vips,
  $vr_id_ext  = $::rservers::firewall::params::vr_id_ext,
  $vr_id_mgmt  = $::rservers::firewall::params::vr_id_mgmt,
) inherits rservers::firewall::params {


# This is the kind of class that I prefer tu use package/file/server 
# instead of and external module.

  include ::keepalived

  ::keepalived::vrrp::instance { $vr_id_ext:
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
  
  ::keepalived::vrrp::instance { $vr_id_srv:
    interface         => $::iface_srv,
    state             => 'BACKUP',
    virtual_router_id => $vr_id_srv,
    priority          => '100',
    auth_type         => 'PASS',
    auth_pass         => 'secretpass',
    virtual_ipaddress => $vips_srv,
    #track_interface   => $::iface_srv,
    #track_script      => [ 'check_haproxy' ],
  }
  
  ::keepalived::vrrp::instance { $vr_id_dmz1:
    interface         => $::iface_dmz1,
    state             => 'BACKUP',
    virtual_router_id => $vr_id_dmz1,
    priority          => '100',
    auth_type         => 'PASS',
    auth_pass         => 'secretpass',
    virtual_ipaddress => $vips_dmz1,
    #track_interface   => $::iface_dmz1,
    #track_script      => [ 'check_haproxy' ],
  }

  ::keepalived::vrrp::script { 'check_haproxy':
    script   => '/usr/bin/killall -0 haproxy',
    interval => '1', # 2
    fall     => '3', # 3
    rise     => '3', # 3
  }
}

