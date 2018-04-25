class rservers::firewall::enable_forward {
  rbaselines::sysctl { 'ip_forward':
    sysctl_options        => ['net.ipv4.ip_forward = 1',]
  }
}
