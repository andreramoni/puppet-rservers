class rservers::loadbalance::keepalived (
  $vips   = $::rservers::loadbalance::params::vips,
  $vr_rid = $::rservers::loadbalance::params::vr_rid,
) inherits rservers::loadbalance::params {

  include ::keepalived

  ::keepalived::vrrp::instance { $vr_rid_prod:
    interface         => ${facts['networking']['primary']},
    state             => 'BACKUP',
    virtual_router_id => $vr_rid_prod,
    priority          => '100',
    auth_type         => 'PASS',
    auth_pass         => 'secretpass',
    virtual_ipaddress => $vips,
    track_interface   => ${facts['networking']['primary']},
    track_script      => [ 'check_haproxy' ],
  }

  ::keepalived::vrrp::script { 'check_haproxy':
    script   => '/usr/bin/killall -0 haproxy',
    interval => '1', # 2
    fall     => '3', # 3
    rise     => '3', # 3
  }
}
