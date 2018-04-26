class rservers::firewall::keepalived (
  $vips   = $::rservers::firewall::params::vips,
  $vr_id  = $::rservers::firewall::params::vr_id,
) inherits rservers::firewall::params {

  include ::keepalived

  ::keepalived::vrrp::instance { $vr_id:
    interface         => $facts['networking']['primary'],
    state             => 'BACKUP',
    virtual_router_id => $vr_id,
    priority          => '100',
    auth_type         => 'PASS',
    auth_pass         => 'secretpass',
    virtual_ipaddress => $vips,
    track_interface   => $facts['networking']['primary'],
    #track_script      => [ 'check_haproxy' ],
  }

  ::keepalived::vrrp::script { 'check_haproxy':
    script   => '/usr/bin/killall -0 haproxy',
    interval => '1', # 2
    fall     => '3', # 3
    rise     => '3', # 3
  }
}

