class rservers::firewall::iptables {
  firewall { '9001 34a86954e6882e2a8a5d2a6b004aad26':
    ensure             => 'present',
    chain              => 'POSTROUTING',
    jump               => 'MASQUERADE',
    outiface           => 'ens224',
    proto              => 'all',
    table              => 'nat',
  }

}
