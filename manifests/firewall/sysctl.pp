class rservers::firewall::sysctl {
  rbaselines::linux::sysctl { 'firewall':
    sysctl_options => [
            'set net.ipv4.ip_forward 1',
            'set net.ipv4.ip_nonlocal_bind 1',
            'set net.ipv4.conf.all.arp_ignore 1',
            'set net.ipv4.conf.all.arp_announce 2',
            'set net.core.somaxconn 2028',
            'set net.ipv4.tcp_fin_timeout 60',
            'set net.ipv4.tcp_adv_win_scale 2',
            'set net.core.netdev_max_backlog 2048',
      ],
  }
}
